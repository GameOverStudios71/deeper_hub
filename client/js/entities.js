/**
 * Entities module - Dynamic System with 5 tables
 */
window.Entities = {
    
    currentPage: 1,
    searchQuery: '',
    filterStatus: '',
    currentTab: 'entities',
    data: [],

    // Tab configuration
    tabs: {
        entities: {
            title: 'Entities',
            icon: 'fas fa-cubes',
            description: 'Manage content types and entity definitions',
            apiEndpoint: 'cms/entities'
        },
        fields: {
            title: 'Fields',
            icon: 'fas fa-list-ul',
            description: 'Manage entity fields and structure',
            apiEndpoint: 'cms/entities/fields'
        },
        entityData: {
            title: 'Entity Data',
            icon: 'fas fa-database',
            description: 'Manage entity data records (EAV)',
            apiEndpoint: 'cms/entities/data'
        },
        relationships: {
            title: 'Relationships',
            icon: 'fas fa-project-diagram',
            description: 'Manage relationship definitions',
            apiEndpoint: 'cms/entities/relationships'
        },
        entityRelationships: {
            title: 'Entity Relationships',
            icon: 'fas fa-link',
            description: 'Manage entity relationship instances',
            apiEndpoint: 'cms/entities/entity-relationships'
        }
    },

    /**
     * Initialize entities module
     */
    async init() {
        try {
            await this.switchTab(this.currentTab);
        } catch (error) {
            App.handleError(error, 'Entities');
        }
    },

    /**
     * Switch between tabs
     */
    async switchTab(tabKey) {
        this.currentTab = tabKey;
        this.currentPage = 1;
        this.searchQuery = '';
        this.filterStatus = '';
        
        this.renderTabInterface();
        await this.loadTabData();
    },

    /**
     * Render the tab interface
     */
    renderTabInterface() {
        const tabConfig = this.tabs[this.currentTab];
        const entityName = tabConfig.title.slice(0, -1); // Remove 's' from plural
        
        const html = `
            ${App.createModuleHeader('Dynamic System Management', [
                {
                    text: `Add New ${entityName}`,
                    icon: 'fas fa-plus',
                    class: 'btn-success',
                    onclick: 'Entities.showCreateForm()'
                }
            ])}
            
            ${this.createTabNavigation()}
            
            ${this.createTabSearchBar()}
            
            <div class="tab-content p-20">
                <div id="tabDataTable">
                    <div class="text-center p-20">
                        <i class="fas fa-spinner fa-spin"></i> Loading ${tabConfig.title.toLowerCase()}...
                    </div>
                </div>
                
                <div id="tabPagination" class="mt-20"></div>
            </div>
        `;

        App.showModuleContent(html);
        this.bindTabEvents();
    },

    /**
     * Create tab navigation
     */
    createTabNavigation() {
        let html = `
            <div class="tab-navigation">
                <div class="nav-tabs">
        `;

        Object.keys(this.tabs).forEach(tabKey => {
            const tab = this.tabs[tabKey];
            const isActive = tabKey === this.currentTab ? 'active' : '';
            
            html += `
                <button class="nav-link ${isActive}" onclick="Entities.switchTab('${tabKey}')">
                    <i class="${tab.icon}"></i> ${tab.title}
                </button>
            `;
        });

        html += `
                </div>
                <div class="tab-description">
                    <small class="text-muted">
                        <i class="${this.tabs[this.currentTab].icon}"></i>
                        ${this.tabs[this.currentTab].description}
                    </small>
                </div>
            </div>
        `;

        return html;
    },

    /**
     * Create search bar for current tab
     */
    createTabSearchBar() {
        const tabConfig = this.tabs[this.currentTab];
        const searchPlaceholder = `Search ${tabConfig.title.toLowerCase()}...`;
        
        let filters = [];
        
        // Add status filter for tables that have is_active
        if (['entities', 'fields', 'entityData'].includes(this.currentTab)) {
            filters.push({
                id: 'statusFilter',
                placeholder: 'Filter by status',
                options: [
                    { value: 'active', text: 'Active' },
                    { value: 'inactive', text: 'Inactive' }
                ]
            });
        }

        const actions = [];
        
        return App.createSearchBar(searchPlaceholder, filters, actions);
    },

    /**
     * Load data for current tab
     */
    async loadTabData() {
        try {
            const tabConfig = this.tabs[this.currentTab];
            const params = {
                page: this.currentPage,
                limit: 20,
                sort: 'created_at',
                order: 'desc'
            };

            if (this.searchQuery) {
                params.search = this.searchQuery;
            }

            if (this.filterStatus) {
                params.is_active = this.filterStatus === 'active';
            }

            let response;
            switch (this.currentTab) {
                case 'entities':
                    response = await cms.getEntities(params);
                    break;
                case 'fields':
                    response = await cms.getEntityFields(params);
                    break;
                case 'entityData':
                    response = await cms.getEntityData(params);
                    break;
                case 'relationships':
                    response = await cms.getEntityRelationshipDefinitions(params);
                    break;
                case 'entityRelationships':
                    response = await cms.getEntityRelationships(params);
                    break;
                default:
                    throw new Error(`Unknown tab: ${this.currentTab}`);
            }

            if (response.success) {
                this.data = response.data || [];
                this.renderTabTable();
                this.renderTabPagination(response.pagination);
            } else {
                throw new Error(response.message || 'Failed to load data');
            }
        } catch (error) {
            console.error(`Error loading ${this.currentTab} data:`, error);
            Utils.showError(`Error loading ${this.currentTab}: ${error.message}`);
            
            document.getElementById('tabDataTable').innerHTML = `
                <div class="text-center p-20">
                    <i class="fas fa-exclamation-triangle text-warning"></i>
                    <p>Error loading ${this.currentTab}: ${error.message}</p>
                    <button class="btn btn-primary" onclick="Entities.loadTabData()">
                        <i class="fas fa-redo"></i> Retry
                    </button>
                </div>
            `;
        }
    },

    /**
     * Render table for current tab
     */
    renderTabTable() {
        let columns = [];
        let actions = {
            edit: 'Entities.showEditForm',
            delete: 'Entities.deleteRecord'
        };

        // Define columns based on current tab
        switch (this.currentTab) {
            case 'entities':
                columns = [
                    { field: 'id', title: 'ID', width: '60px' },
                    { field: 'name', title: 'Name' },
                    { field: 'display_name', title: 'Display Name' },
                    { field: 'description', title: 'Description' },
                    { field: 'icon', title: 'Icon' },
                    { field: 'is_active', title: 'Status', type: 'badge' },
                    { field: 'created_at', title: 'Created', type: 'date' }
                ];
                actions.custom = [
                    { icon: 'fas fa-list', class: 'btn-info', onclick: 'Entities.manageFields', tooltip: 'Manage Fields' },
                    { icon: 'fas fa-database', class: 'btn-warning', onclick: 'Entities.viewData', tooltip: 'View Data' }
                ];
                break;
            case 'fields':
                columns = [
                    { field: 'id', title: 'ID', width: '60px' },
                    { field: 'entity_name', title: 'Entity' },
                    { field: 'name', title: 'Field Name' },
                    { field: 'display_name', title: 'Display Name' },
                    { field: 'field_type', title: 'Type' },
                    { field: 'is_required', title: 'Required', type: 'badge' },
                    { field: 'is_unique', title: 'Unique', type: 'badge' },
                    { field: 'is_active', title: 'Status', type: 'badge' }
                ];
                break;
            case 'entityData':
                columns = [
                    { field: 'id', title: 'ID', width: '60px' },
                    { field: 'entity_name', title: 'Entity' },
                    { field: 'field_name', title: 'Field' },
                    { field: 'record_id', title: 'Record ID' },
                    { field: 'value', title: 'Value' },
                    { field: 'value_numeric', title: 'Numeric' },
                    { field: 'value_date', title: 'Date', type: 'date' },
                    { field: 'is_active', title: 'Status', type: 'badge' }
                ];
                break;
            case 'relationships':
                columns = [
                    { field: 'id', title: 'ID', width: '60px' },
                    { field: 'name', title: 'Name' },
                    { field: 'from_entity_name', title: 'From Entity' },
                    { field: 'to_entity_name', title: 'To Entity' },
                    { field: 'relationship_type', title: 'Type' },
                    { field: 'is_required', title: 'Required', type: 'badge' },
                    { field: 'created_at', title: 'Created', type: 'date' }
                ];
                break;
            case 'entityRelationships':
                columns = [
                    { field: 'id', title: 'ID', width: '60px' },
                    { field: 'relationship_name', title: 'Relationship' },
                    { field: 'from_record_id', title: 'From Record' },
                    { field: 'to_record_id', title: 'To Record' },
                    { field: 'metadata', title: 'Metadata' },
                    { field: 'created_at', title: 'Created', type: 'date' }
                ];
                break;
        }

        const tableHtml = App.createDataTable(columns, this.data, actions);
        document.getElementById('tabDataTable').innerHTML = tableHtml;
    },

    /**
     * Render pagination for current tab
     */
    renderTabPagination(pagination) {
        if (!pagination) return;

        const paginationHtml = Utils.createPagination(
            pagination.current_page,
            pagination.pages,
            pagination.total,
            (page) => {
                this.currentPage = page;
                this.loadTabData();
            }
        );

        document.getElementById('tabPagination').innerHTML = paginationHtml;
    },

    /**
     * Bind tab events
     */
    bindTabEvents() {
        // Search functionality
        const searchInput = document.getElementById('searchInput');
        if (searchInput) {
            searchInput.addEventListener('input', Utils.debounce((e) => {
                this.searchQuery = e.target.value;
                this.currentPage = 1;
                this.loadTabData();
            }, 300));
        }

        // Status filter
        const statusFilter = document.getElementById('statusFilter');
        if (statusFilter) {
            statusFilter.addEventListener('change', (e) => {
                this.filterStatus = e.target.value;
                this.currentPage = 1;
                this.loadTabData();
            });
        }
    },

    /**
     * Show create form for current tab
     */
    showCreateForm() {
        const tabConfig = this.tabs[this.currentTab];
        const entityName = tabConfig.title.slice(0, -1);

        const formHtml = this.createTabForm();

        Utils.showModal(`Add New ${entityName}`, formHtml, [
            {
                text: 'Cancel',
                class: 'btn-secondary',
                onclick: 'Utils.hideModal()'
            },
            {
                text: `Create ${entityName}`,
                class: 'btn-success',
                onclick: 'Entities.saveRecord()'
            }
        ]);
    },

    /**
     * Show edit form for current tab
     */
    showEditForm(id) {
        const record = this.data.find(item => item.id == id);
        if (!record) {
            Utils.showError('Record not found');
            return;
        }

        const tabConfig = this.tabs[this.currentTab];
        const entityName = tabConfig.title.slice(0, -1);

        const formHtml = this.createTabForm(record);

        Utils.showModal(`Edit ${entityName}`, formHtml, [
            {
                text: 'Cancel',
                class: 'btn-secondary',
                onclick: 'Utils.hideModal()'
            },
            {
                text: `Update ${entityName}`,
                class: 'btn-primary',
                onclick: `Entities.saveRecord(${id})`
            }
        ]);
    },

    /**
     * Create form HTML for current tab
     */
    createTabForm(record = null) {
        let formHtml = '<form id="tabForm" class="needs-validation" novalidate>';

        switch (this.currentTab) {
            case 'entities':
                formHtml += this.createEntityForm(record);
                break;
            case 'fields':
                formHtml += this.createFieldForm(record);
                break;
            case 'entityData':
                formHtml += this.createEntityDataForm(record);
                break;
            case 'relationships':
                formHtml += this.createRelationshipForm(record);
                break;
            case 'entityRelationships':
                formHtml += this.createEntityRelationshipForm(record);
                break;
            default:
                formHtml += '<p>Form not implemented for this tab.</p>';
        }

        formHtml += '</form>';
        return formHtml;
    },

    /**
     * Create form for Entities tab
     */
    createEntityForm(record = null) {
        const name = record?.name || '';
        const displayName = record?.display_name || '';
        const description = record?.description || '';
        const icon = record?.icon || '';
        const isActive = record?.is_active !== false;

        return `
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="name">Name *</label>
                        <input type="text" class="form-control" id="name" name="name" value="${name}" required>
                        <div class="invalid-feedback">Please provide a valid name.</div>
                        <small class="form-text text-muted">Unique identifier (lowercase, underscores allowed)</small>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="display_name">Display Name *</label>
                        <input type="text" class="form-control" id="display_name" name="display_name" value="${displayName}" required>
                        <div class="invalid-feedback">Please provide a valid display name.</div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea class="form-control" id="description" name="description" rows="3">${description}</textarea>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="icon">Icon</label>
                        <input type="text" class="form-control" id="icon" name="icon" value="${icon}" placeholder="fas fa-cube">
                        <small class="form-text text-muted">FontAwesome icon class</small>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="is_active">Status</label>
                        <select class="form-control" id="is_active" name="is_active">
                            <option value="true" ${isActive ? 'selected' : ''}>Active</option>
                            <option value="false" ${!isActive ? 'selected' : ''}>Inactive</option>
                        </select>
                    </div>
                </div>
            </div>
        `;
    },

    /**
     * Create form for Fields tab
     */
    createFieldForm(record = null) {
        const entityId = record?.entity_id || '';
        const name = record?.name || '';
        const displayName = record?.display_name || '';
        const fieldType = record?.field_type || 'text';
        const isRequired = record?.is_required === true;
        const isUnique = record?.is_unique === true;
        const isSearchable = record?.is_searchable !== false;
        const defaultValue = record?.default_value || '';
        const validationRules = record?.validation_rules || '';
        const fieldOptions = record?.field_options || '';
        const orderIndex = record?.order_index || 0;
        const isActive = record?.is_active !== false;

        return `
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="entity_id">Entity ID *</label>
                        <input type="number" class="form-control" id="entity_id" name="entity_id" value="${entityId}" required>
                        <div class="invalid-feedback">Please provide a valid entity ID.</div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="name">Field Name *</label>
                        <input type="text" class="form-control" id="name" name="name" value="${name}" required>
                        <div class="invalid-feedback">Please provide a valid field name.</div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="display_name">Display Name *</label>
                        <input type="text" class="form-control" id="display_name" name="display_name" value="${displayName}" required>
                        <div class="invalid-feedback">Please provide a valid display name.</div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="field_type">Field Type *</label>
                        <select class="form-control" id="field_type" name="field_type" required>
                            <option value="text" ${fieldType === 'text' ? 'selected' : ''}>Text</option>
                            <option value="textarea" ${fieldType === 'textarea' ? 'selected' : ''}>Textarea</option>
                            <option value="number" ${fieldType === 'number' ? 'selected' : ''}>Number</option>
                            <option value="integer" ${fieldType === 'integer' ? 'selected' : ''}>Integer</option>
                            <option value="decimal" ${fieldType === 'decimal' ? 'selected' : ''}>Decimal</option>
                            <option value="boolean" ${fieldType === 'boolean' ? 'selected' : ''}>Boolean</option>
                            <option value="date" ${fieldType === 'date' ? 'selected' : ''}>Date</option>
                            <option value="datetime" ${fieldType === 'datetime' ? 'selected' : ''}>DateTime</option>
                            <option value="email" ${fieldType === 'email' ? 'selected' : ''}>Email</option>
                            <option value="url" ${fieldType === 'url' ? 'selected' : ''}>URL</option>
                            <option value="file" ${fieldType === 'file' ? 'selected' : ''}>File</option>
                            <option value="image" ${fieldType === 'image' ? 'selected' : ''}>Image</option>
                            <option value="json" ${fieldType === 'json' ? 'selected' : ''}>JSON</option>
                            <option value="relation" ${fieldType === 'relation' ? 'selected' : ''}>Relation</option>
                            <option value="select" ${fieldType === 'select' ? 'selected' : ''}>Select</option>
                            <option value="radio" ${fieldType === 'radio' ? 'selected' : ''}>Radio</option>
                            <option value="checkbox" ${fieldType === 'checkbox' ? 'selected' : ''}>Checkbox</option>
                        </select>
                        <div class="invalid-feedback">Please select a field type.</div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="default_value">Default Value</label>
                <input type="text" class="form-control" id="default_value" name="default_value" value="${defaultValue}">
            </div>
            <div class="form-group">
                <label for="validation_rules">Validation Rules (JSON)</label>
                <textarea class="form-control" id="validation_rules" name="validation_rules" rows="3">${validationRules}</textarea>
                <small class="form-text text-muted">JSON format validation rules</small>
            </div>
            <div class="form-group">
                <label for="field_options">Field Options (JSON)</label>
                <textarea class="form-control" id="field_options" name="field_options" rows="3">${fieldOptions}</textarea>
                <small class="form-text text-muted">JSON format options for select/radio/checkbox types</small>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="is_required">Required</label>
                        <select class="form-control" id="is_required" name="is_required">
                            <option value="false" ${!isRequired ? 'selected' : ''}>No</option>
                            <option value="true" ${isRequired ? 'selected' : ''}>Yes</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="is_unique">Unique</label>
                        <select class="form-control" id="is_unique" name="is_unique">
                            <option value="false" ${!isUnique ? 'selected' : ''}>No</option>
                            <option value="true" ${isUnique ? 'selected' : ''}>Yes</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="is_searchable">Searchable</label>
                        <select class="form-control" id="is_searchable" name="is_searchable">
                            <option value="true" ${isSearchable ? 'selected' : ''}>Yes</option>
                            <option value="false" ${!isSearchable ? 'selected' : ''}>No</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="is_active">Status</label>
                        <select class="form-control" id="is_active" name="is_active">
                            <option value="true" ${isActive ? 'selected' : ''}>Active</option>
                            <option value="false" ${!isActive ? 'selected' : ''}>Inactive</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="order_index">Order Index</label>
                <input type="number" class="form-control" id="order_index" name="order_index" value="${orderIndex}" min="0">
            </div>
        `;
    },

    /**
     * Create form for Entity Data tab
     */
    createEntityDataForm(record = null) {
        const entityId = record?.entity_id || '';
        const fieldId = record?.field_id || '';
        const recordId = record?.record_id || '';
        const value = record?.value || '';
        const valueNumeric = record?.value_numeric || '';
        const valueDate = record?.value_date || '';
        const isActive = record?.is_active !== false;

        return `
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="entity_id">Entity ID *</label>
                        <input type="number" class="form-control" id="entity_id" name="entity_id" value="${entityId}" required>
                        <div class="invalid-feedback">Please provide a valid entity ID.</div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="field_id">Field ID *</label>
                        <input type="number" class="form-control" id="field_id" name="field_id" value="${fieldId}" required>
                        <div class="invalid-feedback">Please provide a valid field ID.</div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="record_id">Record ID *</label>
                        <input type="text" class="form-control" id="record_id" name="record_id" value="${recordId}" required>
                        <div class="invalid-feedback">Please provide a valid record ID.</div>
                        <small class="form-text text-muted">UUID to group fields of the same record</small>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="value">Value</label>
                <textarea class="form-control" id="value" name="value" rows="3">${value}</textarea>
                <small class="form-text text-muted">Text representation of the value</small>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="value_numeric">Numeric Value</label>
                        <input type="number" step="any" class="form-control" id="value_numeric" name="value_numeric" value="${valueNumeric}">
                        <small class="form-text text-muted">For sorting/filtering numeric values</small>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="value_date">Date Value</label>
                        <input type="datetime-local" class="form-control" id="value_date" name="value_date" value="${valueDate}">
                        <small class="form-text text-muted">For sorting/filtering date values</small>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="is_active">Status</label>
                <select class="form-control" id="is_active" name="is_active">
                    <option value="true" ${isActive ? 'selected' : ''}>Active</option>
                    <option value="false" ${!isActive ? 'selected' : ''}>Inactive</option>
                </select>
            </div>
        `;
    },

    /**
     * Create form for Relationships tab
     */
    createRelationshipForm(record = null) {
        const name = record?.name || '';
        const fromEntityId = record?.from_entity_id || '';
        const toEntityId = record?.to_entity_id || '';
        const relationshipType = record?.relationship_type || 'one_to_many';
        const isRequired = record?.is_required === true;
        const cascadeDelete = record?.cascade_delete === true;
        const description = record?.description || '';

        return `
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="name">Relationship Name *</label>
                        <input type="text" class="form-control" id="name" name="name" value="${name}" required>
                        <div class="invalid-feedback">Please provide a valid name.</div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="relationship_type">Relationship Type *</label>
                        <select class="form-control" id="relationship_type" name="relationship_type" required>
                            <option value="one_to_one" ${relationshipType === 'one_to_one' ? 'selected' : ''}>One to One</option>
                            <option value="one_to_many" ${relationshipType === 'one_to_many' ? 'selected' : ''}>One to Many</option>
                            <option value="many_to_one" ${relationshipType === 'many_to_one' ? 'selected' : ''}>Many to One</option>
                            <option value="many_to_many" ${relationshipType === 'many_to_many' ? 'selected' : ''}>Many to Many</option>
                        </select>
                        <div class="invalid-feedback">Please select a relationship type.</div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="from_entity_id">From Entity ID *</label>
                        <input type="number" class="form-control" id="from_entity_id" name="from_entity_id" value="${fromEntityId}" required>
                        <div class="invalid-feedback">Please provide a valid from entity ID.</div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="to_entity_id">To Entity ID *</label>
                        <input type="number" class="form-control" id="to_entity_id" name="to_entity_id" value="${toEntityId}" required>
                        <div class="invalid-feedback">Please provide a valid to entity ID.</div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea class="form-control" id="description" name="description" rows="3">${description}</textarea>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="is_required">Required</label>
                        <select class="form-control" id="is_required" name="is_required">
                            <option value="false" ${!isRequired ? 'selected' : ''}>No</option>
                            <option value="true" ${isRequired ? 'selected' : ''}>Yes</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="cascade_delete">Cascade Delete</label>
                        <select class="form-control" id="cascade_delete" name="cascade_delete">
                            <option value="false" ${!cascadeDelete ? 'selected' : ''}>No</option>
                            <option value="true" ${cascadeDelete ? 'selected' : ''}>Yes</option>
                        </select>
                    </div>
                </div>
            </div>
        `;
    },

    /**
     * Create form for Entity Relationships tab
     */
    createEntityRelationshipForm(record = null) {
        const relationshipId = record?.relationship_id || '';
        const fromRecordId = record?.from_record_id || '';
        const toRecordId = record?.to_record_id || '';
        const metadata = record?.metadata || '';

        return `
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="relationship_id">Relationship ID *</label>
                        <input type="number" class="form-control" id="relationship_id" name="relationship_id" value="${relationshipId}" required>
                        <div class="invalid-feedback">Please provide a valid relationship ID.</div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="from_record_id">From Record ID *</label>
                        <input type="text" class="form-control" id="from_record_id" name="from_record_id" value="${fromRecordId}" required>
                        <div class="invalid-feedback">Please provide a valid from record ID.</div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="to_record_id">To Record ID *</label>
                        <input type="text" class="form-control" id="to_record_id" name="to_record_id" value="${toRecordId}" required>
                        <div class="invalid-feedback">Please provide a valid to record ID.</div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="metadata">Metadata (JSON)</label>
                <textarea class="form-control" id="metadata" name="metadata" rows="4">${metadata}</textarea>
                <small class="form-text text-muted">Additional metadata for this relationship instance</small>
            </div>
        `;
    },

    /**
     * Save record for current tab
     */
    async saveRecord(id = null) {
        try {
            const form = document.getElementById('tabForm');
            if (!form.checkValidity()) {
                form.classList.add('was-validated');
                return;
            }

            const formData = Utils.serializeForm(form);
            const tabConfig = this.tabs[this.currentTab];

            let response;
            if (id) {
                // Update existing record
                switch (this.currentTab) {
                    case 'entities':
                        response = await cms.updateEntity(id, formData);
                        break;
                    case 'fields':
                        response = await cms.updateEntityField(id, formData);
                        break;
                    case 'entityData':
                        response = await cms.updateEntityData(id, formData);
                        break;
                    case 'relationships':
                        response = await cms.updateEntityRelationshipDefinition(id, formData);
                        break;
                    case 'entityRelationships':
                        response = await cms.updateEntityRelationship(id, formData);
                        break;
                    default:
                        throw new Error(`Update not implemented for ${this.currentTab}`);
                }
            } else {
                // Create new record
                switch (this.currentTab) {
                    case 'entities':
                        response = await cms.createEntity(formData);
                        break;
                    case 'fields':
                        response = await cms.createEntityField(formData);
                        break;
                    case 'entityData':
                        response = await cms.createEntityData(formData);
                        break;
                    case 'relationships':
                        response = await cms.createEntityRelationshipDefinition(formData);
                        break;
                    case 'entityRelationships':
                        response = await cms.createEntityRelationship(formData);
                        break;
                    default:
                        throw new Error(`Create not implemented for ${this.currentTab}`);
                }
            }

            if (response.success) {
                Utils.hideModal();
                Utils.showSuccess(response.message || `${tabConfig.title.slice(0, -1)} ${id ? 'updated' : 'created'} successfully!`);
                await this.loadTabData();
            } else {
                throw new Error(response.message || 'Failed to save record');
            }
        } catch (error) {
            console.error('Error saving record:', error);
            Utils.showError(`Error saving record: ${error.message}`);
        }
    },

    /**
     * Delete record
     */
    async deleteRecord(id) {
        const record = this.data.find(item => item.id == id);
        if (!record) {
            Utils.showError('Record not found');
            return;
        }

        const tabConfig = this.tabs[this.currentTab];
        const entityName = tabConfig.title.slice(0, -1);
        const recordName = record.name || record.display_name || `ID ${id}`;

        if (!confirm(`Are you sure you want to delete this ${entityName.toLowerCase()}: ${recordName}?`)) {
            return;
        }

        try {
            let response;
            switch (this.currentTab) {
                case 'entities':
                    response = await cms.deleteEntity(id);
                    break;
                case 'fields':
                    response = await cms.deleteEntityField(id);
                    break;
                case 'entityData':
                    response = await cms.deleteEntityData(id);
                    break;
                case 'relationships':
                    response = await cms.deleteEntityRelationshipDefinition(id);
                    break;
                case 'entityRelationships':
                    response = await cms.deleteEntityRelationship(id);
                    break;
                default:
                    throw new Error(`Delete not implemented for ${this.currentTab}`);
            }

            if (response.success) {
                Utils.showSuccess(response.message || `${entityName} deleted successfully!`);
                await this.loadTabData();
            } else {
                throw new Error(response.message || 'Failed to delete record');
            }
        } catch (error) {
            console.error('Error deleting record:', error);
            Utils.showError(`Error deleting record: ${error.message}`);
        }
    },

    /**
     * Search functionality
     */
    search() {
        const searchInput = document.getElementById('searchInput');
        this.searchQuery = searchInput ? searchInput.value : '';
        this.currentPage = 1;
        this.loadTabData();
    },

    /**
     * Clear search
     */
    clearSearch() {
        const searchInput = document.getElementById('searchInput');
        const statusFilter = document.getElementById('statusFilter');

        if (searchInput) searchInput.value = '';
        if (statusFilter) statusFilter.value = '';

        this.searchQuery = '';
        this.filterStatus = '';
        this.currentPage = 1;
        this.loadTabData();
    },

    /**
     * Manage fields for an entity
     */
    manageFields(entityId) {
        this.switchTab('fields');
        // TODO: Add filter by entity_id
    },

    /**
     * View data for an entity
     */
    viewData(entityId) {
        this.switchTab('entityData');
        // TODO: Add filter by entity_id
    }
};
