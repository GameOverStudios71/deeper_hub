/**
 * Forms module - Expanded with 9 tables
 */
window.Forms = {

    currentPage: 1,
    searchQuery: '',
    filterStatus: '',
    currentTab: 'forms',
    data: [],

    // Tab configuration
    tabs: {
        forms: {
            title: 'Forms',
            icon: 'fas fa-wpforms',
            description: 'Manage forms and their configurations',
            apiEndpoint: 'forms'
        },
        fieldTypes: {
            title: 'Field Types',
            icon: 'fas fa-list-alt',
            description: 'Manage form field types (text, select, etc.)',
            apiEndpoint: 'forms/field-types'
        },
        fields: {
            title: 'Form Fields',
            icon: 'fas fa-edit',
            description: 'Manage individual form fields',
            apiEndpoint: 'forms/fields'
        },
        displays: {
            title: 'Form Displays',
            icon: 'fas fa-desktop',
            description: 'Manage form display modes',
            apiEndpoint: 'forms/displays'
        },
        displayFields: {
            title: 'Display Fields',
            icon: 'fas fa-th-list',
            description: 'Manage fields in display modes',
            apiEndpoint: 'forms/display-fields'
        },
        preLists: {
            title: 'Pre Lists',
            icon: 'fas fa-list',
            description: 'Manage predefined option lists',
            apiEndpoint: 'forms/pre-lists'
        },
        preValues: {
            title: 'Pre Values',
            icon: 'fas fa-tags',
            description: 'Manage values for predefined lists',
            apiEndpoint: 'forms/pre-values'
        },
        submissions: {
            title: 'Submissions',
            icon: 'fas fa-paper-plane',
            description: 'View form submissions',
            apiEndpoint: 'forms/submissions'
        },
        submissionData: {
            title: 'Submission Data',
            icon: 'fas fa-database',
            description: 'View detailed submission data',
            apiEndpoint: 'forms/submission-data'
        }
    },

    /**
     * Initialize forms module
     */
    async init() {
        try {
            await this.switchTab(this.currentTab);
        } catch (error) {
            App.handleError(error, 'Forms');
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
            ${App.createModuleHeader('Forms Management', [
                {
                    text: `Add New ${entityName}`,
                    icon: 'fas fa-plus',
                    class: 'btn-success',
                    onclick: 'Forms.showCreateForm()'
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
                <button class="nav-link ${isActive}" onclick="Forms.switchTab('${tabKey}')">
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
        if (['forms', 'fieldTypes', 'fields', 'displays', 'preLists'].includes(this.currentTab)) {
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
                case 'forms':
                    response = await cms.getForms(params);
                    break;
                case 'fieldTypes':
                    response = await cms.getFormFieldTypes(params);
                    break;
                case 'fields':
                    response = await cms.getFormFields(params);
                    break;
                case 'displays':
                    response = await cms.getFormDisplays(params);
                    break;
                case 'displayFields':
                    response = await cms.getFormDisplayFields(params);
                    break;
                case 'preLists':
                    response = await cms.getFormPreLists(params);
                    break;
                case 'preValues':
                    response = await cms.getFormPreValues(params);
                    break;
                case 'submissions':
                    response = await cms.getFormSubmissions(params);
                    break;
                case 'submissionData':
                    response = await cms.getFormSubmissionData(params);
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
                    <button class="btn btn-primary" onclick="Forms.loadTabData()">
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
        const tabConfig = this.tabs[this.currentTab];
        let columns = [];
        let actions = {
            edit: 'Forms.showEditForm',
            delete: 'Forms.deleteRecord'
        };

        // Define columns based on current tab
        switch (this.currentTab) {
            case 'forms':
                columns = [
                    { field: 'id', title: 'ID', width: '60px' },
                    { field: 'name', title: 'Name' },
                    { field: 'title', title: 'Title' },
                    { field: 'module', title: 'Module' },
                    { field: 'is_active', title: 'Status', type: 'badge' },
                    { field: 'created_at', title: 'Created', type: 'date' }
                ];
                actions.custom = [
                    { icon: 'fas fa-eye', class: 'btn-info', onclick: 'Forms.previewForm', tooltip: 'Preview Form' },
                    { icon: 'fas fa-list', class: 'btn-secondary', onclick: 'Forms.viewFields', tooltip: 'View Fields' }
                ];
                break;
            case 'fieldTypes':
                columns = [
                    { field: 'id', title: 'ID', width: '60px' },
                    { field: 'name', title: 'Name' },
                    { field: 'title', title: 'Title' },
                    { field: 'input_type', title: 'Input Type' },
                    { field: 'is_active', title: 'Status', type: 'badge' },
                    { field: 'order_index', title: 'Order' }
                ];
                break;
            case 'fields':
                columns = [
                    { field: 'id', title: 'ID', width: '60px' },
                    { field: 'form_id', title: 'Form ID' },
                    { field: 'name', title: 'Name' },
                    { field: 'title', title: 'Title' },
                    { field: 'field_type', title: 'Type' },
                    { field: 'is_required', title: 'Required', type: 'badge' },
                    { field: 'is_active', title: 'Status', type: 'badge' }
                ];
                break;
            case 'displays':
                columns = [
                    { field: 'id', title: 'ID', width: '60px' },
                    { field: 'form_id', title: 'Form ID' },
                    { field: 'name', title: 'Name' },
                    { field: 'title', title: 'Title' },
                    { field: 'display_type', title: 'Type' },
                    { field: 'is_default', title: 'Default', type: 'badge' },
                    { field: 'is_active', title: 'Status', type: 'badge' }
                ];
                break;
            case 'displayFields':
                columns = [
                    { field: 'id', title: 'ID', width: '60px' },
                    { field: 'display_id', title: 'Display ID' },
                    { field: 'field_id', title: 'Field ID' },
                    { field: 'column_number', title: 'Column' },
                    { field: 'order_index', title: 'Order' },
                    { field: 'is_visible', title: 'Visible', type: 'badge' }
                ];
                break;
            case 'preLists':
                columns = [
                    { field: 'id', title: 'ID', width: '60px' },
                    { field: 'name', title: 'Name' },
                    { field: 'title', title: 'Title' },
                    { field: 'description', title: 'Description' },
                    { field: 'is_active', title: 'Status', type: 'badge' },
                    { field: 'created_at', title: 'Created', type: 'date' }
                ];
                actions.custom = [
                    { icon: 'fas fa-list', class: 'btn-info', onclick: 'Forms.viewListValues', tooltip: 'View Values' }
                ];
                break;
            case 'preValues':
                columns = [
                    { field: 'id', title: 'ID', width: '60px' },
                    { field: 'list_id', title: 'List ID' },
                    { field: 'value', title: 'Value' },
                    { field: 'title', title: 'Title' },
                    { field: 'order_index', title: 'Order' },
                    { field: 'is_active', title: 'Status', type: 'badge' }
                ];
                break;
            case 'submissions':
                columns = [
                    { field: 'id', title: 'ID', width: '60px' },
                    { field: 'form_id', title: 'Form ID' },
                    { field: 'user_ip', title: 'IP Address' },
                    { field: 'user_agent', title: 'User Agent' },
                    { field: 'status', title: 'Status' },
                    { field: 'created_at', title: 'Submitted', type: 'date' }
                ];
                actions.custom = [
                    { icon: 'fas fa-eye', class: 'btn-info', onclick: 'Forms.viewSubmissionData', tooltip: 'View Data' }
                ];
                actions.delete = null; // Don't allow deletion of submissions
                break;
            case 'submissionData':
                columns = [
                    { field: 'id', title: 'ID', width: '60px' },
                    { field: 'submission_id', title: 'Submission ID' },
                    { field: 'field_name', title: 'Field' },
                    { field: 'field_value', title: 'Value' },
                    { field: 'created_at', title: 'Created', type: 'date' }
                ];
                actions.edit = null; // Don't allow editing of submission data
                actions.delete = null; // Don't allow deletion of submission data
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
                onclick: 'Forms.saveRecord()'
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
                onclick: `Forms.saveRecord(${id})`
            }
        ]);
    },

    /**
     * Create form HTML for current tab
     */
    createTabForm(record = null) {
        const isEdit = record !== null;
        let formHtml = '<form id="tabForm" class="needs-validation" novalidate>';

        switch (this.currentTab) {
            case 'forms':
                formHtml += this.createFormForm(record);
                break;
            case 'fieldTypes':
                formHtml += this.createFieldTypeForm(record);
                break;
            case 'fields':
                formHtml += this.createFieldForm(record);
                break;
            case 'displays':
                formHtml += this.createDisplayForm(record);
                break;
            case 'displayFields':
                formHtml += this.createDisplayFieldForm(record);
                break;
            case 'preLists':
                formHtml += this.createPreListForm(record);
                break;
            case 'preValues':
                formHtml += this.createPreValueForm(record);
                break;
            default:
                formHtml += '<p>Form not implemented for this tab.</p>';
        }

        formHtml += '</form>';
        return formHtml;
    },

    /**
     * Create form for Forms tab
     */
    createFormForm(record = null) {
        const name = record?.name || '';
        const title = record?.title || '';
        const description = record?.description || '';
        const module = record?.module || 'cms';
        const submitName = record?.submit_name || 'Submit';
        const successMessage = record?.success_message || 'Form submitted successfully!';
        const isActive = record?.is_active !== false;

        return `
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="name">Name *</label>
                        <input type="text" class="form-control" id="name" name="name" value="${name}" required>
                        <div class="invalid-feedback">Please provide a valid name.</div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="title">Title *</label>
                        <input type="text" class="form-control" id="title" name="title" value="${title}" required>
                        <div class="invalid-feedback">Please provide a valid title.</div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea class="form-control" id="description" name="description" rows="3">${description}</textarea>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="module">Module</label>
                        <input type="text" class="form-control" id="module" name="module" value="${module}">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="submit_name">Submit Button Text</label>
                        <input type="text" class="form-control" id="submit_name" name="submit_name" value="${submitName}">
                    </div>
                </div>
                <div class="col-md-4">
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
                <label for="success_message">Success Message</label>
                <textarea class="form-control" id="success_message" name="success_message" rows="2">${successMessage}</textarea>
            </div>
        `;
    },

    /**
     * Create form for Field Types tab
     */
    createFieldTypeForm(record = null) {
        const name = record?.name || '';
        const title = record?.title || '';
        const description = record?.description || '';
        const inputType = record?.input_type || 'text';
        const isActive = record?.is_active !== false;

        return `
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="name">Name *</label>
                        <input type="text" class="form-control" id="name" name="name" value="${name}" required>
                        <div class="invalid-feedback">Please provide a valid name.</div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="title">Title *</label>
                        <input type="text" class="form-control" id="title" name="title" value="${title}" required>
                        <div class="invalid-feedback">Please provide a valid title.</div>
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
                        <label for="input_type">Input Type *</label>
                        <select class="form-control" id="input_type" name="input_type" required>
                            <option value="text" ${inputType === 'text' ? 'selected' : ''}>Text</option>
                            <option value="textarea" ${inputType === 'textarea' ? 'selected' : ''}>Textarea</option>
                            <option value="select" ${inputType === 'select' ? 'selected' : ''}>Select</option>
                            <option value="radio" ${inputType === 'radio' ? 'selected' : ''}>Radio</option>
                            <option value="checkbox" ${inputType === 'checkbox' ? 'selected' : ''}>Checkbox</option>
                            <option value="file" ${inputType === 'file' ? 'selected' : ''}>File</option>
                            <option value="email" ${inputType === 'email' ? 'selected' : ''}>Email</option>
                            <option value="number" ${inputType === 'number' ? 'selected' : ''}>Number</option>
                            <option value="date" ${inputType === 'date' ? 'selected' : ''}>Date</option>
                        </select>
                        <div class="invalid-feedback">Please select an input type.</div>
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
                    case 'forms':
                        response = await cms.updateForm(id, formData);
                        break;
                    case 'fieldTypes':
                        response = await cms.updateFormFieldType(id, formData);
                        break;
                    case 'fields':
                        response = await cms.updateFormField(id, formData);
                        break;
                    case 'displays':
                        response = await cms.updateFormDisplay(id, formData);
                        break;
                    case 'displayFields':
                        response = await cms.updateFormDisplayField(id, formData);
                        break;
                    case 'preLists':
                        response = await cms.updateFormPreList(id, formData);
                        break;
                    case 'preValues':
                        response = await cms.updateFormPreValue(id, formData);
                        break;
                    default:
                        throw new Error(`Update not implemented for ${this.currentTab}`);
                }
            } else {
                // Create new record
                switch (this.currentTab) {
                    case 'forms':
                        response = await cms.createForm(formData);
                        break;
                    case 'fieldTypes':
                        response = await cms.createFormFieldType(formData);
                        break;
                    case 'fields':
                        response = await cms.createFormField(formData);
                        break;
                    case 'displays':
                        response = await cms.createFormDisplay(formData);
                        break;
                    case 'displayFields':
                        response = await cms.createFormDisplayField(formData);
                        break;
                    case 'preLists':
                        response = await cms.createFormPreList(formData);
                        break;
                    case 'preValues':
                        response = await cms.createFormPreValue(formData);
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
        const recordName = record.name || record.title || `ID ${id}`;

        if (!confirm(`Are you sure you want to delete this ${entityName.toLowerCase()}: ${recordName}?`)) {
            return;
        }

        try {
            let response;
            switch (this.currentTab) {
                case 'forms':
                    response = await cms.deleteForm(id);
                    break;
                case 'fieldTypes':
                    response = await cms.deleteFormFieldType(id);
                    break;
                case 'fields':
                    response = await cms.deleteFormField(id);
                    break;
                case 'displays':
                    response = await cms.deleteFormDisplay(id);
                    break;
                case 'displayFields':
                    response = await cms.deleteFormDisplayField(id);
                    break;
                case 'preLists':
                    response = await cms.deleteFormPreList(id);
                    break;
                case 'preValues':
                    response = await cms.deleteFormPreValue(id);
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
    }
};

    /**
     * Load forms list
     */
    async loadForms() {
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

        const html = `
            ${App.createModuleHeader('Forms', [
                {
                    text: 'Add New Form',
                    icon: 'fas fa-plus',
                    class: 'btn-success',
                    onclick: 'Forms.showCreateForm()'
                }
            ])}
            
            ${App.createSearchBar('Search forms...', [
                {
                    id: 'statusFilter',
                    placeholder: 'Filter by status',
                    options: [
                        { value: 'active', text: 'Active' },
                        { value: 'inactive', text: 'Inactive' }
                    ]
                }
            ])}
            
            <div class="forms-content p-20">
                <div id="formsTable">
                    <div class="text-center p-20">
                        <i class="fas fa-spinner fa-spin"></i> Loading forms...
                    </div>
                </div>
                
                <div id="formsPagination" class="mt-20"></div>
            </div>
        `;

        App.showModuleContent(html);
        this.bindEvents();

        try {
            const response = await cms.getForms(params);
            
            if (response.success) {
                this.forms = response.data;
                this.renderFormsTable(response.data);
                this.renderPagination(response.pagination);
            } else {
                throw new Error(response.message || 'Failed to load forms');
            }
        } catch (error) {
            $('#formsTable').html('<div class="text-center p-20">Error loading forms: ' + error.message + '</div>');
        }
    },

    /**
     * Load field types
     */
    async loadFieldTypes() {
        try {
            const response = await cms.getFormFieldTypes();
            if (response.success) {
                this.fieldTypes = response.data;
            }
        } catch (error) {
            console.error('Error loading field types:', error);
        }
    },

    /**
     * Bind events
     */
    bindEvents() {
        // Search functionality
        $('#searchInput').on('input', Utils.debounce(() => {
            this.searchQuery = $('#searchInput').val();
            this.currentPage = 1;
            this.loadForms();
        }, 500));

        // Status filter
        $('#statusFilter').on('change', () => {
            this.filterStatus = $('#statusFilter').val();
            this.currentPage = 1;
            this.loadForms();
        });
    },

    /**
     * Render forms table
     */
    renderFormsTable(forms) {
        const columns = [
            { field: 'title', title: 'Title' },
            { field: 'name', title: 'Name' },
            { field: 'method', title: 'Method' },
            { 
                field: 'ajax_mode', 
                title: 'AJAX',
                formatter: (value) => value ? '<span class="badge badge-success">Yes</span>' : '<span class="badge badge-secondary">No</span>'
            },
            { 
                field: 'is_active', 
                title: 'Status',
                type: 'badge'
            },
            { 
                field: 'created_at', 
                title: 'Created',
                type: 'date'
            }
        ];

        const actions = {
            edit: 'Forms.showEditForm',
            delete: 'Forms.deleteForm',
            custom: [
                {
                    icon: 'fas fa-list',
                    class: 'btn-info',
                    onclick: 'Forms.manageFields',
                    tooltip: 'Manage Fields'
                },
                {
                    icon: 'fas fa-eye',
                    class: 'btn-warning',
                    onclick: 'Forms.previewForm',
                    tooltip: 'Preview'
                }
            ]
        };

        const tableHtml = App.createDataTable(columns, forms, actions);
        $('#formsTable').html(tableHtml);
    },

    /**
     * Render pagination
     */
    renderPagination(pagination) {
        if (!pagination || pagination.pages <= 1) {
            $('#formsPagination').empty();
            return;
        }

        const paginationHtml = Utils.createPagination(pagination, 'Forms.goToPage');
        $('#formsPagination').html(paginationHtml);
    },

    /**
     * Go to specific page
     */
    goToPage(page) {
        this.currentPage = page;
        this.loadForms();
    },

    /**
     * Search forms
     */
    search() {
        this.searchQuery = $('#searchInput').val();
        this.filterStatus = $('#statusFilter').val();
        this.currentPage = 1;
        this.loadForms();
    },

    /**
     * Clear search
     */
    clearSearch() {
        $('#searchInput').val('');
        $('#statusFilter').val('');
        this.searchQuery = '';
        this.filterStatus = '';
        this.currentPage = 1;
        this.loadForms();
    },

    /**
     * Show create form
     */
    showCreateForm() {
        const formHtml = this.createFormForm();
        
        Utils.showModal('Create New Form', formHtml, `
            <button type="button" class="btn btn-secondary" onclick="Utils.hideModal()">Cancel</button>
            <button type="button" class="btn btn-success" onclick="Forms.saveForm()">Create Form</button>
        `);
    },

    /**
     * Show edit form
     */
    async showEditForm(formId) {
        try {
            const response = await cms.getForm(formId);
            
            if (response.success) {
                const formHtml = this.createFormForm(response.data);
                
                Utils.showModal('Edit Form', formHtml, `
                    <button type="button" class="btn btn-secondary" onclick="Utils.hideModal()">Cancel</button>
                    <button type="button" class="btn btn-primary" onclick="Forms.saveForm(${formId})">Update Form</button>
                `);

                Utils.populateForm('#formForm', response.data);
            } else {
                throw new Error(response.message || 'Failed to load form');
            }
        } catch (error) {
            Utils.showError('Error loading form: ' + error.message);
        }
    },

    /**
     * Create form HTML
     */
    createFormForm(form = null) {
        return `
            <form id="formForm">
                <div class="form-group">
                    <label for="formTitle">Title *</label>
                    <input type="text" id="formTitle" name="title" class="form-control" required>
                </div>
                
                <div class="form-group">
                    <label for="formName">Name *</label>
                    <input type="text" id="formName" name="name" class="form-control" required 
                           pattern="^[a-zA-Z0-9_]+$" placeholder="form_name">
                </div>
                
                <div class="form-group">
                    <label for="formDescription">Description</label>
                    <textarea id="formDescription" name="description" class="form-control" rows="3"></textarea>
                </div>
                
                <div class="form-group">
                    <label for="formMethod">Method</label>
                    <select id="formMethod" name="method" class="form-control">
                        <option value="POST">POST</option>
                        <option value="GET">GET</option>
                        <option value="PUT">PUT</option>
                        <option value="PATCH">PATCH</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="formAction">Action URL</label>
                    <input type="text" id="formAction" name="action_url" class="form-control" 
                           placeholder="/submit-form">
                </div>
                
                <div class="form-group">
                    <label for="submitName">Submit Button Text</label>
                    <input type="text" id="submitName" name="submit_name" class="form-control" 
                           placeholder="Submit" value="Submit">
                </div>
                
                <div class="form-group">
                    <label>
                        <input type="checkbox" id="ajaxMode" name="ajax_mode" checked> AJAX Mode
                    </label>
                </div>
                
                <div class="form-group">
                    <label>
                        <input type="checkbox" id="captchaEnabled" name="captcha_enabled"> Enable CAPTCHA
                    </label>
                </div>
                
                <div class="form-group">
                    <label>
                        <input type="checkbox" id="honeypotEnabled" name="honeypot_enabled" checked> Enable Honeypot
                    </label>
                </div>
                
                <div class="form-group">
                    <label for="rateLimit">Rate Limit (requests per minute)</label>
                    <input type="number" id="rateLimit" name="rate_limit" class="form-control" 
                           min="0" value="0" placeholder="0 = no limit">
                </div>
                
                <div class="form-group">
                    <label>
                        <input type="checkbox" id="formActive" name="is_active" checked> Active
                    </label>
                </div>
                
                <!-- Email Settings -->
                <h4>Email Settings</h4>
                
                <div class="form-group">
                    <label for="emailTo">Email To</label>
                    <input type="email" id="emailTo" name="email_to" class="form-control" 
                           placeholder="admin@example.com">
                </div>
                
                <div class="form-group">
                    <label for="emailSubject">Email Subject</label>
                    <input type="text" id="emailSubject" name="email_subject" class="form-control" 
                           placeholder="New form submission">
                </div>
                
                <!-- Messages -->
                <h4>Messages</h4>
                
                <div class="form-group">
                    <label for="successMessage">Success Message</label>
                    <textarea id="successMessage" name="success_message" class="form-control" rows="2"
                              placeholder="Thank you for your submission!"></textarea>
                </div>
                
                <div class="form-group">
                    <label for="errorMessage">Error Message</label>
                    <textarea id="errorMessage" name="error_message" class="form-control" rows="2"
                              placeholder="An error occurred. Please try again."></textarea>
                </div>
            </form>
        `;
    },

    /**
     * Save form (create or update)
     */
    async saveForm(formId = null) {
        try {
            const formData = Utils.serializeForm('#formForm');
            
            // Add current user as creator for new forms
            if (!formId) {
                const currentUser = Utils.getCurrentUser();
                formData.created_by = currentUser?.id || 1;
            }

            // Validation
            const validation = Utils.validateForm('#formForm', {
                title: { required: true, label: 'Title' },
                name: { required: true, label: 'Name', pattern: /^[a-zA-Z0-9_]+$/ }
            });

            if (!validation.valid) {
                Utils.showError('Validation failed: ' + validation.errors.join(', '));
                return;
            }

            let response;
            if (formId) {
                response = await cms.updateForm(formId, formData);
            } else {
                response = await cms.createForm(formData);
            }

            if (response.success) {
                Utils.hideModal();
                Utils.showSuccess(`Form ${formId ? 'updated' : 'created'} successfully!`);
                this.loadForms();
            } else {
                throw new Error(response.message || 'Failed to save form');
            }
        } catch (error) {
            Utils.showError('Error saving form: ' + error.message);
        }
    },

    /**
     * Delete form
     */
    async deleteForm(formId) {
        const form = this.forms.find(f => f.id === formId);
        if (!form) return;

        const confirmed = await App.confirmDangerousAction(
            `Are you sure you want to delete the form "${form.title}"? This will also delete all form fields and submissions.`,
            'delete'
        );

        if (!confirmed) return;

        try {
            const response = await cms.deleteForm(formId);
            
            if (response.success) {
                Utils.showSuccess('Form deleted successfully!');
                this.loadForms();
            } else {
                throw new Error(response.message || 'Failed to delete form');
            }
        } catch (error) {
            Utils.showError('Error deleting form: ' + error.message);
        }
    },

    /**
     * Manage form fields
     */
    async manageFields(formId) {
        this.currentFormId = formId;
        const form = this.forms.find(f => f.id === formId);
        
        try {
            const response = await cms.getFormFields(formId);
            const fields = response.success ? response.data : [];
            
            const fieldsHtml = this.createFieldsManager(form, fields);
            
            Utils.showModal(`Manage Fields - ${form.title}`, fieldsHtml, `
                <button type="button" class="btn btn-secondary" onclick="Utils.hideModal()">Close</button>
                <button type="button" class="btn btn-success" onclick="Forms.showAddFieldForm()">Add Field</button>
            `);
            
        } catch (error) {
            Utils.showError('Error loading form fields: ' + error.message);
        }
    },

    /**
     * Create fields manager HTML
     */
    createFieldsManager(form, fields) {
        let html = `
            <div class="fields-manager">
                <p><strong>Form:</strong> ${form.title}</p>
                <div id="fieldsList">
        `;

        if (fields.length > 0) {
            fields.forEach(field => {
                html += `
                    <div class="field-item" style="border: 1px solid #ddd; padding: 15px; margin-bottom: 10px; border-radius: 4px;">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <strong>${field.title}</strong> (${field.name})
                                <br>
                                <small>Type: ${field.field_type_title || 'Unknown'} | Required: ${field.is_required ? 'Yes' : 'No'}</small>
                            </div>
                            <div>
                                <button class="btn btn-primary btn-sm" onclick="Forms.editField(${field.id})">Edit</button>
                                <button class="btn btn-danger btn-sm" onclick="Forms.deleteField(${field.id})">Delete</button>
                            </div>
                        </div>
                    </div>
                `;
            });
        } else {
            html += '<p class="text-center">No fields added yet.</p>';
        }

        html += `
                </div>
            </div>
        `;

        return html;
    },

    /**
     * Show add field form
     */
    showAddFieldForm() {
        const fieldHtml = this.createFieldForm();
        
        Utils.showModal('Add Form Field', fieldHtml, `
            <button type="button" class="btn btn-secondary" onclick="Forms.manageFields(${this.currentFormId})">Back</button>
            <button type="button" class="btn btn-success" onclick="Forms.saveField()">Add Field</button>
        `);

        this.populateFieldTypeSelect();
    },

    /**
     * Create field form HTML
     */
    createFieldForm(field = null) {
        return `
            <form id="fieldForm">
                <div class="form-group">
                    <label for="fieldTitle">Title *</label>
                    <input type="text" id="fieldTitle" name="title" class="form-control" required>
                </div>
                
                <div class="form-group">
                    <label for="fieldName">Name *</label>
                    <input type="text" id="fieldName" name="name" class="form-control" required 
                           pattern="^[a-zA-Z0-9_]+$" placeholder="field_name">
                </div>
                
                <div class="form-group">
                    <label for="fieldType">Field Type *</label>
                    <select id="fieldType" name="field_type_id" class="form-control" required>
                        <option value="">Select field type...</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="fieldDescription">Description</label>
                    <textarea id="fieldDescription" name="description" class="form-control" rows="2"></textarea>
                </div>
                
                <div class="form-group">
                    <label for="fieldPlaceholder">Placeholder</label>
                    <input type="text" id="fieldPlaceholder" name="placeholder" class="form-control">
                </div>
                
                <div class="form-group">
                    <label for="fieldDefault">Default Value</label>
                    <input type="text" id="fieldDefault" name="default_value" class="form-control">
                </div>
                
                <div class="form-group">
                    <label>
                        <input type="checkbox" id="fieldRequired" name="is_required"> Required
                    </label>
                </div>
                
                <div class="form-group">
                    <label>
                        <input type="checkbox" id="fieldReadonly" name="is_readonly"> Read Only
                    </label>
                </div>
                
                <div class="form-group">
                    <label for="fieldOrder">Order</label>
                    <input type="number" id="fieldOrder" name="order_index" class="form-control" min="0" value="0">
                </div>
            </form>
        `;
    },

    /**
     * Populate field type select
     */
    populateFieldTypeSelect() {
        const select = $('#fieldType');
        this.fieldTypes.forEach(type => {
            select.append(`<option value="${type.id}">${type.title}</option>`);
        });
    },

    /**
     * Save field
     */
    async saveField(fieldId = null) {
        try {
            const formData = Utils.serializeForm('#fieldForm');
            formData.form_id = this.currentFormId;

            // Validation
            const validation = Utils.validateForm('#fieldForm', {
                title: { required: true, label: 'Title' },
                name: { required: true, label: 'Name', pattern: /^[a-zA-Z0-9_]+$/ },
                field_type_id: { required: true, label: 'Field Type' }
            });

            if (!validation.valid) {
                Utils.showError('Validation failed: ' + validation.errors.join(', '));
                return;
            }

            let response;
            if (fieldId) {
                response = await cms.updateFormField(this.currentFormId, fieldId, formData);
            } else {
                response = await cms.createFormField(this.currentFormId, formData);
            }

            if (response.success) {
                Utils.showSuccess(`Field ${fieldId ? 'updated' : 'added'} successfully!`);
                this.manageFields(this.currentFormId);
            } else {
                throw new Error(response.message || 'Failed to save field');
            }
        } catch (error) {
            Utils.showError('Error saving field: ' + error.message);
        }
    },

    /**
     * Preview form
     */
    previewForm(formId) {
        const form = this.forms.find(f => f.id === formId);
        if (!form) return;

        Utils.showModal(`Preview - ${form.title}`, `
            <div class="form-preview">
                <p><em>This is a preview of how the form will appear to users.</em></p>
                <div style="border: 1px solid #ddd; padding: 20px; background: #f9f9f9;">
                    <h3>${form.title}</h3>
                    ${form.description ? `<p>${form.description}</p>` : ''}
                    <p><em>Form fields will be displayed here based on the configured fields.</em></p>
                    <button class="btn btn-primary" disabled>${form.submit_name || 'Submit'}</button>
                </div>
            </div>
        `);
    }
};
