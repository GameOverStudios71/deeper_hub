/**
 * Widgets module - Expanded with 5 tables
 */
window.Widgets = {

    currentPage: 1,
    searchQuery: '',
    filterStatus: '',
    currentTab: 'widgets',
    data: [],

    // Tab configuration
    tabs: {
        widgets: {
            title: 'Widgets',
            icon: 'fas fa-puzzle-piece',
            description: 'Manage widgets and their configurations',
            apiEndpoint: 'widgets'
        },
        widgetTypes: {
            title: 'Widget Types',
            icon: 'fas fa-th-large',
            description: 'Manage widget types and categories',
            apiEndpoint: 'widgets/types'
        },
        instances: {
            title: 'Widget Instances',
            icon: 'fas fa-clone',
            description: 'Manage widget instances on pages',
            apiEndpoint: 'widgets/instances'
        },
        settings: {
            title: 'Widget Settings',
            icon: 'fas fa-cogs',
            description: 'Manage widget and instance settings',
            apiEndpoint: 'widgets/settings'
        },
        bookmarks: {
            title: 'Widget Bookmarks',
            icon: 'fas fa-bookmark',
            description: 'Manage user widget bookmarks',
            apiEndpoint: 'widgets/bookmarks'
        }
    },

    /**
     * Initialize widgets module
     */
    async init() {
        try {
            await this.switchTab(this.currentTab);
        } catch (error) {
            App.handleError(error, 'Widgets');
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
            ${App.createModuleHeader('Widgets Management', [
                {
                    text: `Add New ${entityName}`,
                    icon: 'fas fa-plus',
                    class: 'btn-success',
                    onclick: 'Widgets.showCreateForm()'
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
                <button class="nav-link ${isActive}" onclick="Widgets.switchTab('${tabKey}')">
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
        if (['widgets', 'widgetTypes', 'instances', 'settings'].includes(this.currentTab)) {
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
        const startTime = performance.now();

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

            // Debug logging
            if (window.CMSDebug) {
                window.CMSDebug.logStateChange('Widgets', 'loadTabData', null, { tab: this.currentTab, params });
            }

            let response;
            switch (this.currentTab) {
                case 'widgets':
                    response = await cms.getWidgets(params);
                    break;
                case 'widgetTypes':
                    response = await cms.getWidgetTypes(params);
                    break;
                case 'instances':
                    response = await cms.getWidgetInstances(params);
                    break;
                case 'settings':
                    response = await cms.getWidgetSettings(params);
                    break;
                case 'bookmarks':
                    response = await cms.getWidgetBookmarks(params);
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
                    <button class="btn btn-primary" onclick="Widgets.loadTabData()">
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
            edit: 'Widgets.showEditForm',
            delete: 'Widgets.deleteRecord'
        };

        // Define columns based on current tab
        switch (this.currentTab) {
            case 'widgets':
                columns = [
                    { field: 'id', title: 'ID', width: '60px' },
                    { field: 'title', title: 'Title' },
                    { field: 'name', title: 'Name' },
                    { field: 'widget_type_title', title: 'Type' },
                    { field: 'module', title: 'Module' },
                    { field: 'is_active', title: 'Status', type: 'badge' },
                    { field: 'is_featured', title: 'Featured', type: 'badge' },
                    { field: 'created_at', title: 'Created', type: 'date' }
                ];
                actions.custom = [
                    { icon: 'fas fa-eye', class: 'btn-info', onclick: 'Widgets.previewWidget', tooltip: 'Preview Widget' },
                    { icon: 'fas fa-clone', class: 'btn-secondary', onclick: 'Widgets.cloneWidget', tooltip: 'Clone Widget' }
                ];
                break;
            case 'widgetTypes':
                columns = [
                    { field: 'id', title: 'ID', width: '60px' },
                    { field: 'name', title: 'Name' },
                    { field: 'title', title: 'Title' },
                    { field: 'category', title: 'Category' },
                    { field: 'template', title: 'Template' },
                    { field: 'has_settings', title: 'Has Settings', type: 'badge' },
                    { field: 'is_active', title: 'Status', type: 'badge' },
                    { field: 'order_index', title: 'Order' }
                ];
                break;
            case 'instances':
                columns = [
                    { field: 'id', title: 'ID', width: '60px' },
                    { field: 'widget_id', title: 'Widget ID' },
                    { field: 'page_id', title: 'Page ID' },
                    { field: 'position', title: 'Position' },
                    { field: 'instance_title', title: 'Instance Title' },
                    { field: 'show_title', title: 'Show Title', type: 'badge' },
                    { field: 'is_active', title: 'Status', type: 'badge' },
                    { field: 'order_index', title: 'Order' }
                ];
                actions.custom = [
                    { icon: 'fas fa-eye', class: 'btn-info', onclick: 'Widgets.previewInstance', tooltip: 'Preview Instance' }
                ];
                break;
            case 'settings':
                columns = [
                    { field: 'id', title: 'ID', width: '60px' },
                    { field: 'widget_id', title: 'Widget ID' },
                    { field: 'instance_id', title: 'Instance ID' },
                    { field: 'setting_key', title: 'Setting Key' },
                    { field: 'setting_value', title: 'Value' },
                    { field: 'setting_type', title: 'Type' },
                    { field: 'created_at', title: 'Created', type: 'date' }
                ];
                break;
            case 'bookmarks':
                columns = [
                    { field: 'id', title: 'ID', width: '60px' },
                    { field: 'widget_id', title: 'Widget ID' },
                    { field: 'user_id', title: 'User ID' },
                    { field: 'bookmark_title', title: 'Title' },
                    { field: 'is_bookmarked', title: 'Bookmarked', type: 'badge' },
                    { field: 'created_at', title: 'Created', type: 'date' }
                ];
                actions.delete = null; // Don't allow deletion of bookmarks through this interface
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
                onclick: 'Widgets.saveRecord()'
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
                onclick: `Widgets.saveRecord(${id})`
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
            case 'widgets':
                formHtml += this.createWidgetForm(record);
                break;
            case 'widgetTypes':
                formHtml += this.createWidgetTypeForm(record);
                break;
            case 'instances':
                formHtml += this.createInstanceForm(record);
                break;
            case 'settings':
                formHtml += this.createSettingForm(record);
                break;
            case 'bookmarks':
                formHtml += this.createBookmarkForm(record);
                break;
            default:
                formHtml += '<p>Form not implemented for this tab.</p>';
        }

        formHtml += '</form>';
        return formHtml;
    },

    /**
     * Create form for Widgets tab
     */
    createWidgetForm(record = null) {
        const name = record?.name || '';
        const title = record?.title || '';
        const description = record?.description || '';
        const widgetTypeId = record?.widget_type_id || '';
        const module = record?.module || 'cms';
        const template = record?.template || '';
        const cssClass = record?.css_class || '';
        const content = record?.content || '';
        const contentType = record?.content_type || 'html';
        const apiEndpoint = record?.api_endpoint || '';
        const refreshInterval = record?.refresh_interval || 0;
        const configData = record?.config_data || '';
        const isActive = record?.is_active !== false;
        const isFeatured = record?.is_featured === true;

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
                        <label for="widget_type_id">Widget Type *</label>
                        <select class="form-control" id="widget_type_id" name="widget_type_id" required>
                            <option value="">Select widget type...</option>
                        </select>
                        <div class="invalid-feedback">Please select a widget type.</div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="module">Module</label>
                        <input type="text" class="form-control" id="module" name="module" value="${module}">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="template">Template</label>
                        <input type="text" class="form-control" id="template" name="template" value="${template}">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="css_class">CSS Class</label>
                        <input type="text" class="form-control" id="css_class" name="css_class" value="${cssClass}">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="content_type">Content Type</label>
                        <select class="form-control" id="content_type" name="content_type">
                            <option value="html" ${contentType === 'html' ? 'selected' : ''}>HTML</option>
                            <option value="markdown" ${contentType === 'markdown' ? 'selected' : ''}>Markdown</option>
                            <option value="text" ${contentType === 'text' ? 'selected' : ''}>Plain Text</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="content">Content</label>
                <textarea class="form-control" id="content" name="content" rows="5">${content}</textarea>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="api_endpoint">API Endpoint</label>
                        <input type="text" class="form-control" id="api_endpoint" name="api_endpoint" value="${apiEndpoint}">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="refresh_interval">Refresh Interval (seconds)</label>
                        <input type="number" class="form-control" id="refresh_interval" name="refresh_interval" value="${refreshInterval}" min="0">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="config_data">Configuration Data (JSON)</label>
                <textarea class="form-control" id="config_data" name="config_data" rows="3">${configData}</textarea>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="is_active">Status</label>
                        <select class="form-control" id="is_active" name="is_active">
                            <option value="true" ${isActive ? 'selected' : ''}>Active</option>
                            <option value="false" ${!isActive ? 'selected' : ''}>Inactive</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="is_featured">Featured</label>
                        <select class="form-control" id="is_featured" name="is_featured">
                            <option value="false" ${!isFeatured ? 'selected' : ''}>No</option>
                            <option value="true" ${isFeatured ? 'selected' : ''}>Yes</option>
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
                    case 'widgets':
                        response = await cms.updateWidget(id, formData);
                        break;
                    case 'widgetTypes':
                        response = await cms.updateWidgetType(id, formData);
                        break;
                    case 'instances':
                        response = await cms.updateWidgetInstance(id, formData);
                        break;
                    case 'settings':
                        response = await cms.updateWidgetSetting(id, formData);
                        break;
                    case 'bookmarks':
                        response = await cms.updateWidgetBookmark(id, formData);
                        break;
                    default:
                        throw new Error(`Update not implemented for ${this.currentTab}`);
                }
            } else {
                // Create new record
                switch (this.currentTab) {
                    case 'widgets':
                        response = await cms.createWidget(formData);
                        break;
                    case 'widgetTypes':
                        response = await cms.createWidgetType(formData);
                        break;
                    case 'instances':
                        response = await cms.createWidgetInstance(formData);
                        break;
                    case 'settings':
                        response = await cms.createWidgetSetting(formData);
                        break;
                    case 'bookmarks':
                        response = await cms.createWidgetBookmark(formData);
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
                case 'widgets':
                    response = await cms.deleteWidget(id);
                    break;
                case 'widgetTypes':
                    response = await cms.deleteWidgetType(id);
                    break;
                case 'instances':
                    response = await cms.deleteWidgetInstance(id);
                    break;
                case 'settings':
                    response = await cms.deleteWidgetSetting(id);
                    break;
                case 'bookmarks':
                    response = await cms.deleteWidgetBookmark(id);
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
     * Bind events
     */
    bindEvents() {
        // Search functionality
        $('#searchInput').on('input', Utils.debounce(() => {
            this.searchQuery = $('#searchInput').val();
            this.currentPage = 1;
            this.loadWidgets();
        }, 500));

        // Status filter
        $('#statusFilter').on('change', () => {
            this.filterStatus = $('#statusFilter').val();
            this.currentPage = 1;
            this.loadWidgets();
        });
    },

    /**
     * Render widgets table
     */
    renderWidgetsTable(widgets) {
        const columns = [
            { field: 'title', title: 'Title' },
            { field: 'name', title: 'Name' },
            { 
                field: 'widget_type_title', 
                title: 'Type',
                formatter: (value) => value || 'N/A'
            },
            { 
                field: 'is_active', 
                title: 'Status',
                type: 'badge'
            },
            { 
                field: 'is_featured', 
                title: 'Featured',
                formatter: (value) => value ? '<span class="badge badge-warning">Featured</span>' : ''
            },
            { 
                field: 'created_at', 
                title: 'Created',
                type: 'date'
            }
        ];

        const actions = {
            edit: 'Widgets.showEditForm',
            delete: 'Widgets.deleteWidget',
            custom: [
                {
                    icon: 'fas fa-eye',
                    class: 'btn-info',
                    onclick: 'Widgets.previewWidget',
                    tooltip: 'Preview'
                }
            ]
        };

        const tableHtml = App.createDataTable(columns, widgets, actions);
        $('#widgetsTable').html(tableHtml);
    },

    /**
     * Render pagination
     */
    renderPagination(pagination) {
        if (!pagination || pagination.pages <= 1) {
            $('#widgetsPagination').empty();
            return;
        }

        const paginationHtml = Utils.createPagination(pagination, 'Widgets.goToPage');
        $('#widgetsPagination').html(paginationHtml);
    },

    /**
     * Go to specific page
     */
    goToPage(page) {
        this.currentPage = page;
        this.loadWidgets();
    },

    /**
     * Search widgets
     */
    search() {
        this.searchQuery = $('#searchInput').val();
        this.filterStatus = $('#statusFilter').val();
        this.currentPage = 1;
        this.loadWidgets();
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
        this.loadWidgets();
    },

    /**
     * Create form for Widget Types tab
     */
    createWidgetTypeForm(record = null) {
        const name = record?.name || '';
        const title = record?.title || '';
        const description = record?.description || '';
        const category = record?.category || 'general';
        const template = record?.template || '';
        const icon = record?.icon || '';
        const previewImage = record?.preview_image || '';
        const hasSettings = record?.has_settings !== false;
        const hasContent = record?.has_content !== false;
        const isCacheable = record?.is_cacheable !== false;
        const cacheLifetime = record?.cache_lifetime || 3600;
        const supportedPositions = record?.supported_positions || '';
        const minWidth = record?.min_width || 0;
        const maxWidth = record?.max_width || 0;
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
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="category">Category</label>
                        <select class="form-control" id="category" name="category">
                            <option value="general" ${category === 'general' ? 'selected' : ''}>General</option>
                            <option value="content" ${category === 'content' ? 'selected' : ''}>Content</option>
                            <option value="navigation" ${category === 'navigation' ? 'selected' : ''}>Navigation</option>
                            <option value="social" ${category === 'social' ? 'selected' : ''}>Social</option>
                            <option value="tools" ${category === 'tools' ? 'selected' : ''}>Tools</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="template">Template *</label>
                        <input type="text" class="form-control" id="template" name="template" value="${template}" required>
                        <div class="invalid-feedback">Please provide a template.</div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="icon">Icon</label>
                        <input type="text" class="form-control" id="icon" name="icon" value="${icon}" placeholder="fas fa-puzzle-piece">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="preview_image">Preview Image URL</label>
                <input type="text" class="form-control" id="preview_image" name="preview_image" value="${previewImage}">
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="cache_lifetime">Cache Lifetime (seconds)</label>
                        <input type="number" class="form-control" id="cache_lifetime" name="cache_lifetime" value="${cacheLifetime}" min="0">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="min_width">Min Width (px)</label>
                        <input type="number" class="form-control" id="min_width" name="min_width" value="${minWidth}" min="0">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="max_width">Max Width (px)</label>
                        <input type="number" class="form-control" id="max_width" name="max_width" value="${maxWidth}" min="0">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="supported_positions">Supported Positions (JSON Array)</label>
                <textarea class="form-control" id="supported_positions" name="supported_positions" rows="2" placeholder='["sidebar", "header", "footer"]'>${supportedPositions}</textarea>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="has_settings">Has Settings</label>
                        <select class="form-control" id="has_settings" name="has_settings">
                            <option value="true" ${hasSettings ? 'selected' : ''}>Yes</option>
                            <option value="false" ${!hasSettings ? 'selected' : ''}>No</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="has_content">Has Content</label>
                        <select class="form-control" id="has_content" name="has_content">
                            <option value="true" ${hasContent ? 'selected' : ''}>Yes</option>
                            <option value="false" ${!hasContent ? 'selected' : ''}>No</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="is_cacheable">Is Cacheable</label>
                        <select class="form-control" id="is_cacheable" name="is_cacheable">
                            <option value="true" ${isCacheable ? 'selected' : ''}>Yes</option>
                            <option value="false" ${!isCacheable ? 'selected' : ''}>No</option>
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
     * Create form for Widget Instances tab
     */
    createInstanceForm(record = null) {
        const widgetId = record?.widget_id || '';
        const pageId = record?.page_id || '';
        const position = record?.position || 'sidebar';
        const cellId = record?.cell_id || 1;
        const orderIndex = record?.order_index || 0;
        const instanceTitle = record?.instance_title || '';
        const instanceConfig = record?.instance_config || '';
        const customCss = record?.custom_css || '';
        const designBoxId = record?.design_box_id || 1;
        const showTitle = record?.show_title !== false;
        const isActive = record?.is_active !== false;
        const isCollapsed = record?.is_collapsed === true;
        const hiddenOn = record?.hidden_on || '';
        const cacheLifetime = record?.cache_lifetime || '';

        return `
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="widget_id">Widget ID *</label>
                        <input type="number" class="form-control" id="widget_id" name="widget_id" value="${widgetId}" required>
                        <div class="invalid-feedback">Please provide a valid widget ID.</div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="page_id">Page ID</label>
                        <input type="number" class="form-control" id="page_id" name="page_id" value="${pageId}">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="position">Position *</label>
                        <select class="form-control" id="position" name="position" required>
                            <option value="sidebar" ${position === 'sidebar' ? 'selected' : ''}>Sidebar</option>
                            <option value="header" ${position === 'header' ? 'selected' : ''}>Header</option>
                            <option value="footer" ${position === 'footer' ? 'selected' : ''}>Footer</option>
                            <option value="content" ${position === 'content' ? 'selected' : ''}>Content</option>
                            <option value="left" ${position === 'left' ? 'selected' : ''}>Left</option>
                            <option value="right" ${position === 'right' ? 'selected' : ''}>Right</option>
                        </select>
                        <div class="invalid-feedback">Please select a position.</div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="cell_id">Cell ID</label>
                        <input type="number" class="form-control" id="cell_id" name="cell_id" value="${cellId}" min="1">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="order_index">Order Index</label>
                        <input type="number" class="form-control" id="order_index" name="order_index" value="${orderIndex}" min="0">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="instance_title">Instance Title</label>
                <input type="text" class="form-control" id="instance_title" name="instance_title" value="${instanceTitle}">
            </div>
            <div class="form-group">
                <label for="instance_config">Instance Configuration (JSON)</label>
                <textarea class="form-control" id="instance_config" name="instance_config" rows="3">${instanceConfig}</textarea>
            </div>
            <div class="form-group">
                <label for="custom_css">Custom CSS</label>
                <textarea class="form-control" id="custom_css" name="custom_css" rows="3">${customCss}</textarea>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="design_box_id">Design Box ID</label>
                        <input type="number" class="form-control" id="design_box_id" name="design_box_id" value="${designBoxId}" min="1">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="hidden_on">Hidden On</label>
                        <select class="form-control" id="hidden_on" name="hidden_on">
                            <option value="" ${hiddenOn === '' ? 'selected' : ''}>Never</option>
                            <option value="mobile" ${hiddenOn === 'mobile' ? 'selected' : ''}>Mobile</option>
                            <option value="tablet" ${hiddenOn === 'tablet' ? 'selected' : ''}>Tablet</option>
                            <option value="desktop" ${hiddenOn === 'desktop' ? 'selected' : ''}>Desktop</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="cache_lifetime">Cache Lifetime (seconds)</label>
                        <input type="number" class="form-control" id="cache_lifetime" name="cache_lifetime" value="${cacheLifetime}" min="0">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="show_title">Show Title</label>
                        <select class="form-control" id="show_title" name="show_title">
                            <option value="true" ${showTitle ? 'selected' : ''}>Yes</option>
                            <option value="false" ${!showTitle ? 'selected' : ''}>No</option>
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
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="is_collapsed">Collapsed</label>
                        <select class="form-control" id="is_collapsed" name="is_collapsed">
                            <option value="false" ${!isCollapsed ? 'selected' : ''}>No</option>
                            <option value="true" ${isCollapsed ? 'selected' : ''}>Yes</option>
                        </select>
                    </div>
                </div>
            </div>
        `;
    },

    /**
     * Create form for Widget Settings tab
     */
    createSettingForm(record = null) {
        const widgetId = record?.widget_id || '';
        const instanceId = record?.instance_id || '';
        const settingKey = record?.setting_key || '';
        const settingValue = record?.setting_value || '';
        const settingType = record?.setting_type || 'text';
        const settingGroup = record?.setting_group || 'general';
        const settingOrder = record?.setting_order || 0;

        return `
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="widget_id">Widget ID</label>
                        <input type="number" class="form-control" id="widget_id" name="widget_id" value="${widgetId}">
                        <small class="form-text text-muted">Leave empty if this is an instance setting</small>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="instance_id">Instance ID</label>
                        <input type="number" class="form-control" id="instance_id" name="instance_id" value="${instanceId}">
                        <small class="form-text text-muted">Leave empty if this is a widget setting</small>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="setting_key">Setting Key *</label>
                        <input type="text" class="form-control" id="setting_key" name="setting_key" value="${settingKey}" required>
                        <div class="invalid-feedback">Please provide a setting key.</div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="setting_type">Setting Type</label>
                        <select class="form-control" id="setting_type" name="setting_type">
                            <option value="text" ${settingType === 'text' ? 'selected' : ''}>Text</option>
                            <option value="number" ${settingType === 'number' ? 'selected' : ''}>Number</option>
                            <option value="boolean" ${settingType === 'boolean' ? 'selected' : ''}>Boolean</option>
                            <option value="json" ${settingType === 'json' ? 'selected' : ''}>JSON</option>
                            <option value="array" ${settingType === 'array' ? 'selected' : ''}>Array</option>
                            <option value="url" ${settingType === 'url' ? 'selected' : ''}>URL</option>
                            <option value="email" ${settingType === 'email' ? 'selected' : ''}>Email</option>
                            <option value="color" ${settingType === 'color' ? 'selected' : ''}>Color</option>
                            <option value="date" ${settingType === 'date' ? 'selected' : ''}>Date</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="setting_value">Setting Value *</label>
                <textarea class="form-control" id="setting_value" name="setting_value" rows="3" required>${settingValue}</textarea>
                <div class="invalid-feedback">Please provide a setting value.</div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="setting_group">Setting Group</label>
                        <select class="form-control" id="setting_group" name="setting_group">
                            <option value="general" ${settingGroup === 'general' ? 'selected' : ''}>General</option>
                            <option value="appearance" ${settingGroup === 'appearance' ? 'selected' : ''}>Appearance</option>
                            <option value="behavior" ${settingGroup === 'behavior' ? 'selected' : ''}>Behavior</option>
                            <option value="content" ${settingGroup === 'content' ? 'selected' : ''}>Content</option>
                            <option value="advanced" ${settingGroup === 'advanced' ? 'selected' : ''}>Advanced</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="setting_order">Setting Order</label>
                        <input type="number" class="form-control" id="setting_order" name="setting_order" value="${settingOrder}" min="0">
                    </div>
                </div>
            </div>
        `;
    },

    /**
     * Create form for Widget Bookmarks tab
     */
    createBookmarkForm(record = null) {
        const widgetId = record?.widget_id || '';
        const userId = record?.user_id || '';
        const isBookmarked = record?.is_bookmarked !== false;

        return `
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="widget_id">Widget ID *</label>
                        <input type="number" class="form-control" id="widget_id" name="widget_id" value="${widgetId}" required>
                        <div class="invalid-feedback">Please provide a valid widget ID.</div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="user_id">User ID *</label>
                        <input type="number" class="form-control" id="user_id" name="user_id" value="${userId}" required>
                        <div class="invalid-feedback">Please provide a valid user ID.</div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="is_bookmarked">Bookmarked Status</label>
                <select class="form-control" id="is_bookmarked" name="is_bookmarked">
                    <option value="true" ${isBookmarked ? 'selected' : ''}>Bookmarked</option>
                    <option value="false" ${!isBookmarked ? 'selected' : ''}>Not Bookmarked</option>
                </select>
            </div>
            <div class="alert alert-info">
                <small><strong>Note:</strong> This form creates or updates a bookmark relationship between a user and a widget.</small>
            </div>
        `;
    }
};
