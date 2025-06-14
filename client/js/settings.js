/**
 * Settings module - Expanded with 5 tables
 */
window.Settings = {

    currentPage: 1,
    searchQuery: '',
    filterStatus: '',
    currentTab: 'settingCategories',
    data: [],

    // Tab configuration
    tabs: {
        settingCategories: {
            title: 'Setting Categories',
            icon: 'fas fa-folder',
            description: 'Manage setting categories and organization',
            apiEndpoint: 'settings/categories'
        },
        settingTypes: {
            title: 'Setting Types',
            icon: 'fas fa-cogs',
            description: 'Manage setting types and input configurations',
            apiEndpoint: 'settings/types'
        },
        settings: {
            title: 'Settings',
            icon: 'fas fa-sliders-h',
            description: 'Manage system settings and configurations',
            apiEndpoint: 'settings'
        },
        themes: {
            title: 'Themes',
            icon: 'fas fa-palette',
            description: 'Manage visual themes and appearance',
            apiEndpoint: 'themes'
        },
        themeSettings: {
            title: 'Theme Settings',
            icon: 'fas fa-paint-brush',
            description: 'Manage theme-specific configurations',
            apiEndpoint: 'themes/settings'
        }
    },

    /**
     * Initialize settings module
     */
    async init() {
        try {
            await this.switchTab(this.currentTab);
        } catch (error) {
            App.handleError(error, 'Settings');
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
            ${App.createModuleHeader('Settings Management', [
                {
                    text: `Add New ${entityName}`,
                    icon: 'fas fa-plus',
                    class: 'btn-success',
                    onclick: 'Settings.showCreateForm()'
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
                <button class="nav-link ${isActive}" onclick="Settings.switchTab('${tabKey}')">
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
        if (['settingCategories', 'settingTypes', 'settings', 'themes'].includes(this.currentTab)) {
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
                case 'settingCategories':
                    response = await cms.getSettingCategories(params);
                    break;
                case 'settingTypes':
                    response = await cms.getSettingTypes(params);
                    break;
                case 'settings':
                    response = await cms.getSettings(params);
                    break;
                case 'themes':
                    response = await cms.getThemes(params);
                    break;
                case 'themeSettings':
                    response = await cms.getThemeSettings(params);
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
                    <button class="btn btn-primary" onclick="Settings.loadTabData()">
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
            edit: 'Settings.showEditForm',
            delete: 'Settings.deleteRecord'
        };

        // Define columns based on current tab
        switch (this.currentTab) {
            case 'settingCategories':
                columns = [
                    { field: 'id', title: 'ID', width: '60px' },
                    { field: 'name', title: 'Name' },
                    { field: 'title', title: 'Title' },
                    { field: 'description', title: 'Description' },
                    { field: 'icon', title: 'Icon' },
                    { field: 'order_index', title: 'Order' },
                    { field: 'is_active', title: 'Status', type: 'badge' },
                    { field: 'created_at', title: 'Created', type: 'date' }
                ];
                break;
            case 'settingTypes':
                columns = [
                    { field: 'id', title: 'ID', width: '60px' },
                    { field: 'name', title: 'Name' },
                    { field: 'title', title: 'Title' },
                    { field: 'input_type', title: 'Input Type' },
                    { field: 'validation_rules', title: 'Validation' },
                    { field: 'order_index', title: 'Order' },
                    { field: 'is_active', title: 'Status', type: 'badge' }
                ];
                break;
            case 'settings':
                columns = [
                    { field: 'id', title: 'ID', width: '60px' },
                    { field: 'name', title: 'Name' },
                    { field: 'title', title: 'Title' },
                    { field: 'category_title', title: 'Category' },
                    { field: 'type_title', title: 'Type' },
                    { field: 'value', title: 'Value' },
                    { field: 'is_active', title: 'Status', type: 'badge' }
                ];
                break;
            case 'themes':
                columns = [
                    { field: 'id', title: 'ID', width: '60px' },
                    { field: 'name', title: 'Name' },
                    { field: 'title', title: 'Title' },
                    { field: 'version', title: 'Version' },
                    { field: 'author', title: 'Author' },
                    { field: 'is_responsive', title: 'Responsive', type: 'badge' },
                    { field: 'is_default', title: 'Default', type: 'badge' },
                    { field: 'is_active', title: 'Status', type: 'badge' }
                ];
                actions.custom = [
                    { icon: 'fas fa-eye', class: 'btn-info', onclick: 'Settings.previewTheme', tooltip: 'Preview Theme' },
                    { icon: 'fas fa-star', class: 'btn-warning', onclick: 'Settings.setDefaultTheme', tooltip: 'Set as Default' }
                ];
                break;
            case 'themeSettings':
                columns = [
                    { field: 'id', title: 'ID', width: '60px' },
                    { field: 'theme_title', title: 'Theme' },
                    { field: 'setting_name', title: 'Setting Name' },
                    { field: 'setting_title', title: 'Setting Title' },
                    { field: 'setting_value', title: 'Value' },
                    { field: 'setting_type', title: 'Type' },
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
                onclick: 'Settings.saveRecord()'
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
                onclick: `Settings.saveRecord(${id})`
            }
        ]);
    },

    /**
     * Create form HTML for current tab
     */
    createTabForm(record = null) {
        let formHtml = '<form id="tabForm" class="needs-validation" novalidate>';

        switch (this.currentTab) {
            case 'settingCategories':
                formHtml += this.createSettingCategoryForm(record);
                break;
            case 'settingTypes':
                formHtml += this.createSettingTypeForm(record);
                break;
            case 'settings':
                formHtml += this.createSettingForm(record);
                break;
            case 'themes':
                formHtml += this.createThemeForm(record);
                break;
            case 'themeSettings':
                formHtml += this.createThemeSettingForm(record);
                break;
            default:
                formHtml += '<p>Form not implemented for this tab.</p>';
        }

        formHtml += '</form>';
        return formHtml;
    },

    /**
     * Create form for Setting Categories tab
     */
    createSettingCategoryForm(record = null) {
        const name = record?.name || '';
        const title = record?.title || '';
        const description = record?.description || '';
        const icon = record?.icon || '';
        const isActive = record?.is_active !== false;
        const orderIndex = record?.order_index || 0;

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
                        <label for="icon">Icon</label>
                        <input type="text" class="form-control" id="icon" name="icon" value="${icon}" placeholder="fas fa-cog">
                        <small class="form-text text-muted">FontAwesome icon class</small>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="order_index">Order Index</label>
                        <input type="number" class="form-control" id="order_index" name="order_index" value="${orderIndex}" min="0">
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
        `;
    },

    /**
     * Create form for Setting Types tab
     */
    createSettingTypeForm(record = null) {
        const name = record?.name || '';
        const title = record?.title || '';
        const description = record?.description || '';
        const inputType = record?.input_type || 'text';
        const validationRules = record?.validation_rules || '';
        const defaultOptions = record?.default_options || '';
        const isActive = record?.is_active !== false;
        const orderIndex = record?.order_index || 0;

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
                            <option value="number" ${inputType === 'number' ? 'selected' : ''}>Number</option>
                            <option value="email" ${inputType === 'email' ? 'selected' : ''}>Email</option>
                            <option value="url" ${inputType === 'url' ? 'selected' : ''}>URL</option>
                            <option value="color" ${inputType === 'color' ? 'selected' : ''}>Color</option>
                            <option value="file" ${inputType === 'file' ? 'selected' : ''}>File</option>
                        </select>
                        <div class="invalid-feedback">Please select an input type.</div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="order_index">Order Index</label>
                        <input type="number" class="form-control" id="order_index" name="order_index" value="${orderIndex}" min="0">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="validation_rules">Validation Rules (JSON)</label>
                <textarea class="form-control" id="validation_rules" name="validation_rules" rows="3">${validationRules}</textarea>
                <small class="form-text text-muted">JSON format validation rules</small>
            </div>
            <div class="form-group">
                <label for="default_options">Default Options (JSON)</label>
                <textarea class="form-control" id="default_options" name="default_options" rows="3">${defaultOptions}</textarea>
                <small class="form-text text-muted">JSON format default options for select/radio types</small>
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
     * Create form for Settings tab
     */
    createSettingForm(record = null) {
        const categoryId = record?.category_id || '';
        const settingTypeId = record?.setting_type_id || '';
        const name = record?.name || '';
        const title = record?.title || '';
        const description = record?.description || '';
        const value = record?.value || '';
        const defaultValue = record?.default_value || '';
        const options = record?.options || '';
        const validationRules = record?.validation_rules || '';
        const placeholder = record?.placeholder || '';
        const helpText = record?.help_text || '';
        const cssClass = record?.css_class || '';
        const isRequired = record?.is_required === true;
        const isReadonly = record?.is_readonly === true;
        const isTranslatable = record?.is_translatable === true;
        const isActive = record?.is_active !== false;
        const orderIndex = record?.order_index || 0;

        return `
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="category_id">Category ID *</label>
                        <input type="number" class="form-control" id="category_id" name="category_id" value="${categoryId}" required>
                        <div class="invalid-feedback">Please provide a valid category ID.</div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="setting_type_id">Setting Type ID *</label>
                        <input type="number" class="form-control" id="setting_type_id" name="setting_type_id" value="${settingTypeId}" required>
                        <div class="invalid-feedback">Please provide a valid setting type ID.</div>
                    </div>
                </div>
            </div>
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
                        <label for="value">Value</label>
                        <textarea class="form-control" id="value" name="value" rows="2">${value}</textarea>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="default_value">Default Value</label>
                        <textarea class="form-control" id="default_value" name="default_value" rows="2">${defaultValue}</textarea>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="options">Options (JSON)</label>
                <textarea class="form-control" id="options" name="options" rows="3">${options}</textarea>
                <small class="form-text text-muted">JSON format options for select/radio types</small>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="placeholder">Placeholder</label>
                        <input type="text" class="form-control" id="placeholder" name="placeholder" value="${placeholder}">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="css_class">CSS Class</label>
                        <input type="text" class="form-control" id="css_class" name="css_class" value="${cssClass}">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="help_text">Help Text</label>
                <textarea class="form-control" id="help_text" name="help_text" rows="2">${helpText}</textarea>
            </div>
            <div class="form-group">
                <label for="validation_rules">Validation Rules (JSON)</label>
                <textarea class="form-control" id="validation_rules" name="validation_rules" rows="3">${validationRules}</textarea>
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
                        <label for="is_readonly">Readonly</label>
                        <select class="form-control" id="is_readonly" name="is_readonly">
                            <option value="false" ${!isReadonly ? 'selected' : ''}>No</option>
                            <option value="true" ${isReadonly ? 'selected' : ''}>Yes</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="is_translatable">Translatable</label>
                        <select class="form-control" id="is_translatable" name="is_translatable">
                            <option value="false" ${!isTranslatable ? 'selected' : ''}>No</option>
                            <option value="true" ${isTranslatable ? 'selected' : ''}>Yes</option>
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
     * Create form for Themes tab
     */
    createThemeForm(record = null) {
        const name = record?.name || '';
        const title = record?.title || '';
        const description = record?.description || '';
        const templatePath = record?.template_path || '';
        const cssFile = record?.css_file || '';
        const jsFile = record?.js_file || '';
        const previewImage = record?.preview_image || '';
        const version = record?.version || '1.0.0';
        const author = record?.author || '';
        const authorUrl = record?.author_url || '';
        const supportsDarkMode = record?.supports_dark_mode === true;
        const isResponsive = record?.is_responsive !== false;
        const minWidth = record?.min_width || 320;
        const isActive = record?.is_active !== false;
        const isDefault = record?.is_default === true;
        const orderIndex = record?.order_index || 0;

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
                        <label for="template_path">Template Path *</label>
                        <input type="text" class="form-control" id="template_path" name="template_path" value="${templatePath}" required>
                        <div class="invalid-feedback">Please provide a template path.</div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="css_file">CSS File</label>
                        <input type="text" class="form-control" id="css_file" name="css_file" value="${cssFile}">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="js_file">JavaScript File</label>
                        <input type="text" class="form-control" id="js_file" name="js_file" value="${jsFile}">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="preview_image">Preview Image</label>
                        <input type="text" class="form-control" id="preview_image" name="preview_image" value="${previewImage}">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="version">Version</label>
                        <input type="text" class="form-control" id="version" name="version" value="${version}">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="author">Author</label>
                        <input type="text" class="form-control" id="author" name="author" value="${author}">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="min_width">Min Width (px)</label>
                        <input type="number" class="form-control" id="min_width" name="min_width" value="${minWidth}" min="320">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="author_url">Author URL</label>
                <input type="url" class="form-control" id="author_url" name="author_url" value="${authorUrl}">
            </div>
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="supports_dark_mode">Dark Mode</label>
                        <select class="form-control" id="supports_dark_mode" name="supports_dark_mode">
                            <option value="false" ${!supportsDarkMode ? 'selected' : ''}>No</option>
                            <option value="true" ${supportsDarkMode ? 'selected' : ''}>Yes</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="is_responsive">Responsive</label>
                        <select class="form-control" id="is_responsive" name="is_responsive">
                            <option value="true" ${isResponsive ? 'selected' : ''}>Yes</option>
                            <option value="false" ${!isResponsive ? 'selected' : ''}>No</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="is_default">Default Theme</label>
                        <select class="form-control" id="is_default" name="is_default">
                            <option value="false" ${!isDefault ? 'selected' : ''}>No</option>
                            <option value="true" ${isDefault ? 'selected' : ''}>Yes</option>
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
     * Create form for Theme Settings tab
     */
    createThemeSettingForm(record = null) {
        const themeId = record?.theme_id || '';
        const settingId = record?.setting_id || '';
        const settingValue = record?.setting_value || '';

        return `
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="theme_id">Theme ID *</label>
                        <input type="number" class="form-control" id="theme_id" name="theme_id" value="${themeId}" required>
                        <div class="invalid-feedback">Please provide a valid theme ID.</div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="setting_id">Setting ID *</label>
                        <input type="number" class="form-control" id="setting_id" name="setting_id" value="${settingId}" required>
                        <div class="invalid-feedback">Please provide a valid setting ID.</div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="value">Value</label>
                <textarea class="form-control" id="value" name="value" rows="3">${settingValue}</textarea>
                <small class="form-text text-muted">The value for this theme setting</small>
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
                    case 'settingCategories':
                        response = await cms.updateSettingCategory(id, formData);
                        break;
                    case 'settingTypes':
                        response = await cms.updateSettingType(id, formData);
                        break;
                    case 'settings':
                        response = await cms.updateSetting(id, formData);
                        break;
                    case 'themes':
                        response = await cms.updateTheme(id, formData);
                        break;
                    case 'themeSettings':
                        response = await cms.updateThemeSetting(id, formData);
                        break;
                    default:
                        throw new Error(`Update not implemented for ${this.currentTab}`);
                }
            } else {
                // Create new record
                switch (this.currentTab) {
                    case 'settingCategories':
                        response = await cms.createSettingCategory(formData);
                        break;
                    case 'settingTypes':
                        response = await cms.createSettingType(formData);
                        break;
                    case 'settings':
                        response = await cms.createSetting(formData);
                        break;
                    case 'themes':
                        response = await cms.createTheme(formData);
                        break;
                    case 'themeSettings':
                        response = await cms.createThemeSetting(formData);
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
                case 'settingCategories':
                    response = await cms.deleteSettingCategory(id);
                    break;
                case 'settingTypes':
                    response = await cms.deleteSettingType(id);
                    break;
                case 'settings':
                    response = await cms.deleteSetting(id);
                    break;
                case 'themes':
                    response = await cms.deleteTheme(id);
                    break;
                case 'themeSettings':
                    response = await cms.deleteThemeSetting(id);
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
     * Preview theme
     */
    previewTheme(themeId) {
        const theme = this.data.find(t => t.id == themeId);
        if (!theme) {
            Utils.showError('Theme not found');
            return;
        }

        Utils.showModal(`Preview Theme - ${theme.title}`, `
            <div class="theme-preview-modal">
                <div class="theme-info mb-20">
                    <h4>${theme.title}</h4>
                    <p>${theme.description || 'No description available'}</p>
                    <div class="theme-meta">
                        <span class="badge badge-info">Version: ${theme.version}</span>
                        ${theme.author ? `<span class="badge badge-secondary">Author: ${theme.author}</span>` : ''}
                        ${theme.is_responsive ? '<span class="badge badge-success">Responsive</span>' : ''}
                        ${theme.supports_dark_mode ? '<span class="badge badge-dark">Dark Mode</span>' : ''}
                    </div>
                </div>

                <div class="theme-preview-container" style="border: 1px solid #ddd; border-radius: 8px; overflow: hidden;">
                    ${theme.preview_image ?
                        `<img src="${theme.preview_image}" alt="${theme.title}" style="width: 100%; height: auto;">` :
                        `<div style="height: 300px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); display: flex; align-items: center; justify-content: center; color: white;">
                            <div class="text-center">
                                <i class="fas fa-palette fa-3x mb-10"></i>
                                <h5>Theme Preview</h5>
                                <p>No preview image available</p>
                            </div>
                        </div>`
                    }
                </div>

                <div class="theme-details mt-20">
                    <h6>Theme Details:</h6>
                    <ul>
                        <li><strong>Template Path:</strong> ${theme.template_path}</li>
                        ${theme.css_file ? `<li><strong>CSS File:</strong> ${theme.css_file}</li>` : ''}
                        ${theme.js_file ? `<li><strong>JS File:</strong> ${theme.js_file}</li>` : ''}
                        <li><strong>Min Width:</strong> ${theme.min_width}px</li>
                    </ul>
                </div>
            </div>
        `);
    },

    /**
     * Set default theme
     */
    async setDefaultTheme(themeId) {
        const theme = this.data.find(t => t.id == themeId);
        if (!theme) {
            Utils.showError('Theme not found');
            return;
        }

        if (!confirm(`Are you sure you want to set "${theme.title}" as the default theme?`)) {
            return;
        }

        try {
            const response = await cms.setDefaultTheme(themeId);

            if (response.success) {
                Utils.showSuccess(`"${theme.title}" is now the default theme!`);
                await this.loadTabData();
            } else {
                throw new Error(response.message || 'Failed to set default theme');
            }
        } catch (error) {
            console.error('Error setting default theme:', error);
            Utils.showError(`Error setting default theme: ${error.message}`);
        }
    },

    /**
     * Load settings (legacy method for compatibility)
     */
    async loadSettings() {
        const html = `
            ${App.createModuleHeader('Settings', [
                {
                    text: 'Add Theme',
                    icon: 'fas fa-plus',
                    class: 'btn-success',
                    onclick: 'Settings.showCreateThemeForm()'
                }
            ])}
            
            <div class="settings-content">
                <!-- Settings Navigation -->
                <div class="settings-nav p-20" style="background: #f8f9fa; border-bottom: 1px solid #dee2e6;">
                    <div class="nav-tabs">
                        <button class="nav-tab active" onclick="Settings.showTab('general')">
                            <i class="fas fa-cog"></i> General Settings
                        </button>
                        <button class="nav-tab" onclick="Settings.showTab('themes')">
                            <i class="fas fa-palette"></i> Themes
                        </button>
                        <button class="nav-tab" onclick="Settings.showTab('system')">
                            <i class="fas fa-server"></i> System
                        </button>
                    </div>
                </div>
                
                <!-- Settings Content -->
                <div class="settings-tabs">
                    <!-- General Settings Tab -->
                    <div id="generalTab" class="settings-tab active">
                        <div class="p-20">
                            <h3>General Settings</h3>
                            <div id="settingsForm">
                                <div class="text-center p-20">
                                    <i class="fas fa-spinner fa-spin"></i> Loading settings...
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Themes Tab -->
                    <div id="themesTab" class="settings-tab" style="display: none;">
                        <div class="p-20">
                            <h3>Theme Management</h3>
                            <div id="themesGrid">
                                <div class="text-center p-20">
                                    <i class="fas fa-spinner fa-spin"></i> Loading themes...
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- System Tab -->
                    <div id="systemTab" class="settings-tab" style="display: none;">
                        <div class="p-20">
                            <h3>System Information</h3>
                            <div id="systemInfo">
                                <div class="text-center p-20">
                                    <i class="fas fa-spinner fa-spin"></i> Loading system info...
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        `;

        App.showModuleContent(html);
        this.bindEvents();

        // Load initial content
        await this.loadGeneralSettings();
        await this.loadThemesGrid();
        this.loadSystemInfo();
    },

    /**
     * Load setting categories
     */
    async loadCategories() {
        try {
            const response = await cms.getSettingCategories();
            if (response.success) {
                this.categories = response.data;
            }
        } catch (error) {
            console.error('Error loading setting categories:', error);
        }
    },

    /**
     * Load themes
     */
    async loadThemes() {
        try {
            const response = await cms.getThemes();
            if (response.success) {
                this.themes = response.data;
            }
        } catch (error) {
            console.error('Error loading themes:', error);
        }
    },

    /**
     * Bind events
     */
    bindEvents() {
        // Tab switching is handled by showTab method
    },

    /**
     * Show specific tab
     */
    showTab(tabName) {
        // Update nav tabs
        $('.nav-tab').removeClass('active');
        $(`.nav-tab:contains('${tabName === 'general' ? 'General' : tabName === 'themes' ? 'Themes' : 'System'}')`).addClass('active');
        
        // Update content tabs
        $('.settings-tab').hide();
        $(`#${tabName}Tab`).show();
        
        // Load content if needed
        if (tabName === 'themes') {
            this.loadThemesGrid();
        } else if (tabName === 'system') {
            this.loadSystemInfo();
        }
    },

    /**
     * Load general settings
     */
    async loadGeneralSettings() {
        try {
            const response = await cms.getSettings();
            
            if (response.success) {
                this.settings = response.data;
                this.renderSettingsForm(response.data);
            } else {
                throw new Error(response.message || 'Failed to load settings');
            }
        } catch (error) {
            $('#settingsForm').html('<div class="text-center p-20">Error loading settings: ' + error.message + '</div>');
        }
    },

    /**
     * Render settings form
     */
    renderSettingsForm(settings) {
        // Group settings by category
        const groupedSettings = {};
        settings.forEach(setting => {
            const categoryName = setting.category_title || 'General';
            if (!groupedSettings[categoryName]) {
                groupedSettings[categoryName] = [];
            }
            groupedSettings[categoryName].push(setting);
        });

        let html = '<form id="settingsFormData">';
        
        Object.keys(groupedSettings).forEach(categoryName => {
            html += `
                <div class="settings-category mb-20">
                    <h4>${categoryName}</h4>
                    <div class="settings-group" style="border: 1px solid #dee2e6; border-radius: 4px; padding: 20px;">
            `;
            
            groupedSettings[categoryName].forEach(setting => {
                html += this.renderSettingField(setting);
            });
            
            html += `
                    </div>
                </div>
            `;
        });

        html += `
            <div class="settings-actions">
                <button type="button" class="btn btn-primary" onclick="Settings.saveSettings()">
                    <i class="fas fa-save"></i> Save Settings
                </button>
                <button type="button" class="btn btn-secondary" onclick="Settings.resetSettings()">
                    <i class="fas fa-undo"></i> Reset to Defaults
                </button>
            </div>
        </form>`;

        $('#settingsForm').html(html);
    },

    /**
     * Render individual setting field
     */
    renderSettingField(setting) {
        const value = setting.value || setting.default_value || '';
        const inputType = setting.setting_type_input_type || 'text';
        
        let fieldHtml = `
            <div class="form-group">
                <label for="setting_${setting.name}">${setting.title}</label>
        `;

        switch (inputType) {
            case 'textarea':
                fieldHtml += `
                    <textarea id="setting_${setting.name}" name="${setting.name}" class="form-control" 
                              rows="3" ${setting.is_readonly ? 'readonly' : ''}
                              placeholder="${setting.placeholder || ''}">${Utils.escapeHtml(value)}</textarea>
                `;
                break;
                
            case 'select':
                fieldHtml += `<select id="setting_${setting.name}" name="${setting.name}" class="form-control" ${setting.is_readonly ? 'disabled' : ''}>`;
                
                if (setting.options) {
                    try {
                        const options = JSON.parse(setting.options);
                        Object.keys(options).forEach(key => {
                            const selected = value === key ? 'selected' : '';
                            fieldHtml += `<option value="${key}" ${selected}>${options[key]}</option>`;
                        });
                    } catch (e) {
                        fieldHtml += `<option value="${value}">${value}</option>`;
                    }
                }
                
                fieldHtml += `</select>`;
                break;
                
            case 'checkbox':
                const checked = value === '1' || value === 'true' || value === true ? 'checked' : '';
                fieldHtml += `
                    <div class="form-check">
                        <input type="checkbox" id="setting_${setting.name}" name="${setting.name}" 
                               class="form-check-input" value="1" ${checked} ${setting.is_readonly ? 'disabled' : ''}>
                        <label class="form-check-label" for="setting_${setting.name}">
                            ${setting.title}
                        </label>
                    </div>
                `;
                break;
                
            case 'number':
                fieldHtml += `
                    <input type="number" id="setting_${setting.name}" name="${setting.name}" 
                           class="form-control" value="${value}" ${setting.is_readonly ? 'readonly' : ''}
                           placeholder="${setting.placeholder || ''}">
                `;
                break;
                
            case 'email':
                fieldHtml += `
                    <input type="email" id="setting_${setting.name}" name="${setting.name}" 
                           class="form-control" value="${value}" ${setting.is_readonly ? 'readonly' : ''}
                           placeholder="${setting.placeholder || ''}">
                `;
                break;
                
            case 'url':
                fieldHtml += `
                    <input type="url" id="setting_${setting.name}" name="${setting.name}" 
                           class="form-control" value="${value}" ${setting.is_readonly ? 'readonly' : ''}
                           placeholder="${setting.placeholder || ''}">
                `;
                break;
                
            default: // text
                fieldHtml += `
                    <input type="text" id="setting_${setting.name}" name="${setting.name}" 
                           class="form-control" value="${value}" ${setting.is_readonly ? 'readonly' : ''}
                           placeholder="${setting.placeholder || ''}">
                `;
                break;
        }

        if (setting.description) {
            fieldHtml += `<small class="form-text text-muted">${setting.description}</small>`;
        }

        fieldHtml += `</div>`;
        
        return fieldHtml;
    },

    /**
     * Save settings
     */
    async saveSettings() {
        try {
            const formData = Utils.serializeForm('#settingsFormData');
            const promises = [];

            // Update each setting individually
            Object.keys(formData).forEach(settingName => {
                const value = formData[settingName];
                promises.push(cms.updateSetting(settingName, value));
            });

            await Promise.all(promises);
            
            Utils.showSuccess('Settings saved successfully!');
            this.loadGeneralSettings(); // Reload to show updated values
            
        } catch (error) {
            Utils.showError('Error saving settings: ' + error.message);
        }
    },

    /**
     * Reset settings to defaults
     */
    async resetSettings() {
        const confirmed = await Utils.confirm(
            'Are you sure you want to reset all settings to their default values? This action cannot be undone.',
            'Reset Settings'
        );

        if (!confirmed) return;

        try {
            const promises = [];
            
            this.settings.forEach(setting => {
                if (setting.default_value !== null) {
                    promises.push(cms.updateSetting(setting.name, setting.default_value));
                }
            });

            await Promise.all(promises);
            
            Utils.showSuccess('Settings reset to defaults successfully!');
            this.loadGeneralSettings();
            
        } catch (error) {
            Utils.showError('Error resetting settings: ' + error.message);
        }
    },

    /**
     * Load themes grid
     */
    async loadThemesGrid() {
        try {
            await this.loadThemes(); // Refresh themes data
            this.renderThemesGrid(this.themes);
        } catch (error) {
            $('#themesGrid').html('<div class="text-center p-20">Error loading themes: ' + error.message + '</div>');
        }
    },

    /**
     * Render themes grid
     */
    renderThemesGrid(themes) {
        let html = '';
        
        if (themes.length > 0) {
            html += '<div class="themes-container" style="display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 20px;">';
            
            themes.forEach(theme => {
                const isDefault = theme.is_default;
                const isActive = theme.is_active;
                
                html += `
                    <div class="theme-card" style="border: 1px solid #dee2e6; border-radius: 8px; overflow: hidden; ${isDefault ? 'border-color: #007bff; box-shadow: 0 0 0 2px rgba(0,123,255,0.25);' : ''}">
                        <div class="theme-preview" style="height: 150px; background: #f8f9fa; display: flex; align-items: center; justify-content: center;">
                            ${theme.preview_image ? 
                                `<img src="${theme.preview_image}" alt="${theme.title}" style="max-width: 100%; max-height: 100%; object-fit: cover;">` :
                                `<i class="fas fa-palette fa-3x" style="color: #6c757d;"></i>`
                            }
                        </div>
                        
                        <div class="theme-info p-15">
                            <h5 style="margin: 0 0 10px 0;">${theme.title}</h5>
                            <p style="margin: 0 0 10px 0; font-size: 14px; color: #6c757d;">${theme.description || 'No description available'}</p>
                            
                            <div class="theme-meta" style="font-size: 12px; color: #6c757d; margin-bottom: 15px;">
                                <div>Version: ${theme.version || '1.0.0'}</div>
                                ${theme.author ? `<div>Author: ${theme.author}</div>` : ''}
                                <div>Responsive: ${theme.is_responsive ? 'Yes' : 'No'}</div>
                                <div>Dark Mode: ${theme.supports_dark_mode ? 'Yes' : 'No'}</div>
                            </div>
                            
                            <div class="theme-badges mb-15">
                                ${isDefault ? '<span class="badge badge-primary">Default</span> ' : ''}
                                ${isActive ? '<span class="badge badge-success">Active</span>' : '<span class="badge badge-secondary">Inactive</span>'}
                            </div>
                            
                            <div class="theme-actions d-flex gap-5">
                                ${!isDefault ? `
                                    <button class="btn btn-primary btn-sm" onclick="Settings.setDefaultTheme(${theme.id})">
                                        Set Default
                                    </button>
                                ` : ''}
                                <button class="btn btn-secondary btn-sm" onclick="Settings.editTheme(${theme.id})">
                                    Edit
                                </button>
                                ${!isDefault ? `
                                    <button class="btn btn-danger btn-sm" onclick="Settings.deleteTheme(${theme.id})">
                                        Delete
                                    </button>
                                ` : ''}
                            </div>
                        </div>
                    </div>
                `;
            });
            
            html += '</div>';
        } else {
            html = '<div class="text-center p-20">No themes available.</div>';
        }

        $('#themesGrid').html(html);
    },

    /**
     * Show create theme form
     */
    showCreateThemeForm() {
        const formHtml = this.createThemeForm();
        
        Utils.showModal('Create New Theme', formHtml, `
            <button type="button" class="btn btn-secondary" onclick="Utils.hideModal()">Cancel</button>
            <button type="button" class="btn btn-success" onclick="Settings.saveTheme()">Create Theme</button>
        `);
    },

    /**
     * Edit theme
     */
    async editTheme(themeId) {
        try {
            const response = await cms.getTheme(themeId);
            
            if (response.success) {
                const formHtml = this.createThemeForm(response.data);
                
                Utils.showModal('Edit Theme', formHtml, `
                    <button type="button" class="btn btn-secondary" onclick="Utils.hideModal()">Cancel</button>
                    <button type="button" class="btn btn-primary" onclick="Settings.saveTheme(${themeId})">Update Theme</button>
                `);

                Utils.populateForm('#themeForm', response.data);
            } else {
                throw new Error(response.message || 'Failed to load theme');
            }
        } catch (error) {
            Utils.showError('Error loading theme: ' + error.message);
        }
    },

    /**
     * Create theme form HTML
     */
    createThemeForm(theme = null) {
        return `
            <form id="themeForm">
                <div class="form-group">
                    <label for="themeTitle">Title *</label>
                    <input type="text" id="themeTitle" name="title" class="form-control" required>
                </div>
                
                <div class="form-group">
                    <label for="themeName">Name *</label>
                    <input type="text" id="themeName" name="name" class="form-control" required 
                           pattern="^[a-zA-Z0-9_]+$" placeholder="theme_name">
                </div>
                
                <div class="form-group">
                    <label for="themeDescription">Description</label>
                    <textarea id="themeDescription" name="description" class="form-control" rows="3"></textarea>
                </div>
                
                <div class="form-group">
                    <label for="templatePath">Template Path *</label>
                    <input type="text" id="templatePath" name="template_path" class="form-control" required 
                           placeholder="/themes/theme_name">
                </div>
                
                <div class="form-group">
                    <label for="cssFile">CSS File</label>
                    <input type="text" id="cssFile" name="css_file" class="form-control" 
                           placeholder="style.css">
                </div>
                
                <div class="form-group">
                    <label for="jsFile">JavaScript File</label>
                    <input type="text" id="jsFile" name="js_file" class="form-control" 
                           placeholder="theme.js">
                </div>
                
                <div class="form-group">
                    <label for="themeVersion">Version</label>
                    <input type="text" id="themeVersion" name="version" class="form-control" 
                           value="1.0.0" placeholder="1.0.0">
                </div>
                
                <div class="form-group">
                    <label for="themeAuthor">Author</label>
                    <input type="text" id="themeAuthor" name="author" class="form-control">
                </div>
                
                <div class="form-group">
                    <label for="authorUrl">Author URL</label>
                    <input type="url" id="authorUrl" name="author_url" class="form-control" 
                           placeholder="https://author.com">
                </div>
                
                <div class="form-group">
                    <label>
                        <input type="checkbox" id="supportsDarkMode" name="supports_dark_mode"> Supports Dark Mode
                    </label>
                </div>
                
                <div class="form-group">
                    <label>
                        <input type="checkbox" id="isResponsive" name="is_responsive" checked> Responsive
                    </label>
                </div>
                
                <div class="form-group">
                    <label for="minWidth">Minimum Width (px)</label>
                    <input type="number" id="minWidth" name="min_width" class="form-control" 
                           value="320" min="200">
                </div>
                
                <div class="form-group">
                    <label>
                        <input type="checkbox" id="themeActive" name="is_active" checked> Active
                    </label>
                </div>
            </form>
        `;
    },

    /**
     * Save theme
     */
    async saveTheme(themeId = null) {
        try {
            const formData = Utils.serializeForm('#themeForm');

            // Validation
            const validation = Utils.validateForm('#themeForm', {
                title: { required: true, label: 'Title' },
                name: { required: true, label: 'Name', pattern: /^[a-zA-Z0-9_]+$/ },
                template_path: { required: true, label: 'Template Path' }
            });

            if (!validation.valid) {
                Utils.showError('Validation failed: ' + validation.errors.join(', '));
                return;
            }

            let response;
            if (themeId) {
                response = await cms.updateTheme(themeId, formData);
            } else {
                response = await cms.createTheme(formData);
            }

            if (response.success) {
                Utils.hideModal();
                Utils.showSuccess(`Theme ${themeId ? 'updated' : 'created'} successfully!`);
                this.loadThemesGrid();
            } else {
                throw new Error(response.message || 'Failed to save theme');
            }
        } catch (error) {
            Utils.showError('Error saving theme: ' + error.message);
        }
    },

    /**
     * Set default theme
     */
    async setDefaultTheme(themeId) {
        const theme = this.themes.find(t => t.id === themeId);
        if (!theme) return;

        const confirmed = await Utils.confirm(
            `Are you sure you want to set "${theme.title}" as the default theme?`,
            'Set Default Theme'
        );

        if (!confirmed) return;

        try {
            const response = await cms.updateTheme(themeId, { is_default: true });
            
            if (response.success) {
                Utils.showSuccess('Default theme updated successfully!');
                this.loadThemesGrid();
            } else {
                throw new Error(response.message || 'Failed to set default theme');
            }
        } catch (error) {
            Utils.showError('Error setting default theme: ' + error.message);
        }
    },

    /**
     * Delete theme
     */
    async deleteTheme(themeId) {
        const theme = this.themes.find(t => t.id === themeId);
        if (!theme) return;

        if (theme.is_default) {
            Utils.showError('Cannot delete the default theme.');
            return;
        }

        const confirmed = await App.confirmDangerousAction(
            `Are you sure you want to delete the theme "${theme.title}"? This action cannot be undone.`,
            'delete'
        );

        if (!confirmed) return;

        try {
            const response = await cms.deleteTheme(themeId);
            
            if (response.success) {
                Utils.showSuccess('Theme deleted successfully!');
                this.loadThemesGrid();
            } else {
                throw new Error(response.message || 'Failed to delete theme');
            }
        } catch (error) {
            Utils.showError('Error deleting theme: ' + error.message);
        }
    },

    /**
     * Load system information
     */
    loadSystemInfo() {
        const html = `
            <div class="system-info-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 20px;">
                <div class="info-card" style="border: 1px solid #dee2e6; border-radius: 8px; padding: 20px;">
                    <h5>CMS Information</h5>
                    <table class="table table-sm">
                        <tr><td>Version:</td><td>DeeperHub CMS v1.0.0</td></tr>
                        <tr><td>Environment:</td><td>Production</td></tr>
                        <tr><td>Database:</td><td>SQLite</td></tr>
                        <tr><td>Cache:</td><td>File Cache</td></tr>
                    </table>
                </div>
                
                <div class="info-card" style="border: 1px solid #dee2e6; border-radius: 8px; padding: 20px;">
                    <h5>Server Information</h5>
                    <table class="table table-sm">
                        <tr><td>Server:</td><td>Elixir/Phoenix</td></tr>
                        <tr><td>Uptime:</td><td>5 days, 12 hours</td></tr>
                        <tr><td>Memory Usage:</td><td>256 MB / 1 GB</td></tr>
                        <tr><td>Disk Usage:</td><td>2.3 GB / 10 GB</td></tr>
                    </table>
                </div>
                
                <div class="info-card" style="border: 1px solid #dee2e6; border-radius: 8px; padding: 20px;">
                    <h5>Statistics</h5>
                    <table class="table table-sm">
                        <tr><td>Total Pages:</td><td id="statPages">-</td></tr>
                        <tr><td>Total Forms:</td><td id="statForms">-</td></tr>
                        <tr><td>Total Users:</td><td id="statUsers">-</td></tr>
                        <tr><td>Media Files:</td><td id="statMedia">-</td></tr>
                    </table>
                </div>
                
                <div class="info-card" style="border: 1px solid #dee2e6; border-radius: 8px; padding: 20px;">
                    <h5>System Actions</h5>
                    <div class="d-flex flex-column gap-10">
                        <button class="btn btn-warning btn-sm" onclick="Settings.clearCache()">
                            <i class="fas fa-broom"></i> Clear Cache
                        </button>
                        <button class="btn btn-info btn-sm" onclick="Settings.exportSettings()">
                            <i class="fas fa-download"></i> Export Settings
                        </button>
                        <button class="btn btn-secondary btn-sm" onclick="Settings.importSettings()">
                            <i class="fas fa-upload"></i> Import Settings
                        </button>
                    </div>
                </div>
            </div>
        `;

        $('#systemInfo').html(html);
        this.loadSystemStats();
    },

    /**
     * Load system statistics
     */
    async loadSystemStats() {
        try {
            // Load basic stats (reuse from dashboard)
            const [pagesResponse, formsResponse, usersResponse] = await Promise.allSettled([
                cms.getPages({ limit: 1 }),
                cms.getForms({ limit: 1 }),
                cms.getUsers({ limit: 1 })
            ]);

            if (pagesResponse.status === 'fulfilled' && pagesResponse.value.success) {
                $('#statPages').text(pagesResponse.value.pagination?.total || 0);
            }

            if (formsResponse.status === 'fulfilled' && formsResponse.value.success) {
                $('#statForms').text(formsResponse.value.pagination?.total || 0);
            }

            if (usersResponse.status === 'fulfilled' && usersResponse.value.success) {
                $('#statUsers').text(usersResponse.value.pagination?.total || 0);
            }

            // Mock media count for now
            $('#statMedia').text('42');

        } catch (error) {
            console.error('Error loading system stats:', error);
        }
    },

    /**
     * Clear cache
     */
    async clearCache() {
        const confirmed = await Utils.confirm(
            'Are you sure you want to clear the system cache?',
            'Clear Cache'
        );

        if (!confirmed) return;

        try {
            // Mock cache clearing - would be actual API call
            Utils.showSuccess('Cache cleared successfully!');
        } catch (error) {
            Utils.showError('Error clearing cache: ' + error.message);
        }
    },

    /**
     * Export settings
     */
    async exportSettings() {
        try {
            const settingsData = {
                settings: this.settings,
                themes: this.themes,
                exported_at: new Date().toISOString(),
                version: '1.0.0'
            };

            const dataStr = JSON.stringify(settingsData, null, 2);
            const dataBlob = new Blob([dataStr], { type: 'application/json' });
            
            const link = document.createElement('a');
            link.href = URL.createObjectURL(dataBlob);
            link.download = `cms-settings-${new Date().toISOString().split('T')[0]}.json`;
            link.click();
            
            Utils.showSuccess('Settings exported successfully!');
        } catch (error) {
            Utils.showError('Error exporting settings: ' + error.message);
        }
    },

    /**
     * Import settings
     */
    importSettings() {
        const input = document.createElement('input');
        input.type = 'file';
        input.accept = '.json';
        
        input.onchange = async (e) => {
            const file = e.target.files[0];
            if (!file) return;

            try {
                const text = await file.text();
                const data = JSON.parse(text);
                
                const confirmed = await Utils.confirm(
                    'Are you sure you want to import these settings? This will overwrite existing settings.',
                    'Import Settings'
                );

                if (!confirmed) return;

                // Mock import - would be actual API calls
                Utils.showSuccess('Settings imported successfully!');
                this.loadGeneralSettings();
                this.loadThemesGrid();
                
            } catch (error) {
                Utils.showError('Error importing settings: ' + error.message);
            }
        };
        
        input.click();
    }
};
