/**
 * Menus module - Expanded with 3 tables
 */
window.Menus = {

    currentPage: 1,
    searchQuery: '',
    filterStatus: '',
    currentTab: 'menuSets',
    data: [],

    // Tab configuration
    tabs: {
        menuSets: {
            title: 'Menu Sets',
            icon: 'fas fa-sitemap',
            description: 'Manage menu sets and their configurations',
            apiEndpoint: 'menus'
        },
        menuTemplates: {
            title: 'Menu Templates',
            icon: 'fas fa-th-large',
            description: 'Manage menu templates and styles',
            apiEndpoint: 'menus/templates'
        },
        menuItems: {
            title: 'Menu Items',
            icon: 'fas fa-list',
            description: 'Manage individual menu items',
            apiEndpoint: 'menus/items'
        }
    },

    /**
     * Initialize menus module
     */
    async init() {
        try {
            await this.switchTab(this.currentTab);
        } catch (error) {
            App.handleError(error, 'Menus');
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
            ${App.createModuleHeader('Menus Management', [
                {
                    text: `Add New ${entityName}`,
                    icon: 'fas fa-plus',
                    class: 'btn-success',
                    onclick: 'Menus.showCreateForm()'
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
                <button class="nav-link ${isActive}" onclick="Menus.switchTab('${tabKey}')">
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
        if (['menuSets', 'menuTemplates', 'menuItems'].includes(this.currentTab)) {
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
                case 'menuSets':
                    response = await cms.getMenuSets(params);
                    break;
                case 'menuTemplates':
                    response = await cms.getMenuTemplates(params);
                    break;
                case 'menuItems':
                    response = await cms.getMenuItems(params);
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
                    <button class="btn btn-primary" onclick="Menus.loadTabData()">
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
            edit: 'Menus.showEditForm',
            delete: 'Menus.deleteRecord'
        };

        // Define columns based on current tab
        switch (this.currentTab) {
            case 'menuSets':
                columns = [
                    { field: 'id', title: 'ID', width: '60px' },
                    { field: 'title', title: 'Title' },
                    { field: 'name', title: 'Name' },
                    { field: 'template_title', title: 'Template' },
                    { field: 'max_depth', title: 'Max Depth' },
                    { field: 'show_icons', title: 'Icons', type: 'badge' },
                    { field: 'is_active', title: 'Status', type: 'badge' },
                    { field: 'created_at', title: 'Created', type: 'date' }
                ];
                actions.custom = [
                    { icon: 'fas fa-list', class: 'btn-info', onclick: 'Menus.manageMenuItems', tooltip: 'Manage Items' },
                    { icon: 'fas fa-eye', class: 'btn-warning', onclick: 'Menus.previewMenu', tooltip: 'Preview Menu' }
                ];
                break;
            case 'menuTemplates':
                columns = [
                    { field: 'id', title: 'ID', width: '60px' },
                    { field: 'name', title: 'Name' },
                    { field: 'title', title: 'Title' },
                    { field: 'template_file', title: 'Template File' },
                    { field: 'supports_icons', title: 'Icons', type: 'badge' },
                    { field: 'supports_dropdown', title: 'Dropdown', type: 'badge' },
                    { field: 'max_levels', title: 'Max Levels' },
                    { field: 'is_active', title: 'Status', type: 'badge' }
                ];
                break;
            case 'menuItems':
                columns = [
                    { field: 'id', title: 'ID', width: '60px' },
                    { field: 'title', title: 'Title' },
                    { field: 'name', title: 'Name' },
                    { field: 'link_type', title: 'Link Type' },
                    { field: 'link_url', title: 'URL' },
                    { field: 'icon', title: 'Icon' },
                    { field: 'order_index', title: 'Order' },
                    { field: 'is_active', title: 'Status', type: 'badge' }
                ];
                actions.custom = [
                    { icon: 'fas fa-eye', class: 'btn-info', onclick: 'Menus.previewMenuItem', tooltip: 'Preview Item' }
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
                onclick: 'Menus.saveRecord()'
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
                onclick: `Menus.saveRecord(${id})`
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
            case 'menuSets':
                formHtml += this.createMenuSetForm(record);
                break;
            case 'menuTemplates':
                formHtml += this.createMenuTemplateForm(record);
                break;
            case 'menuItems':
                formHtml += this.createMenuItemForm(record);
                break;
            default:
                formHtml += '<p>Form not implemented for this tab.</p>';
        }

        formHtml += '</form>';
        return formHtml;
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
                    case 'menuSets':
                        response = await cms.updateMenuSet(id, formData);
                        break;
                    case 'menuTemplates':
                        response = await cms.updateMenuTemplate(id, formData);
                        break;
                    case 'menuItems':
                        response = await cms.updateMenuItem(id, formData);
                        break;
                    default:
                        throw new Error(`Update not implemented for ${this.currentTab}`);
                }
            } else {
                // Create new record
                switch (this.currentTab) {
                    case 'menuSets':
                        response = await cms.createMenuSet(formData);
                        break;
                    case 'menuTemplates':
                        response = await cms.createMenuTemplate(formData);
                        break;
                    case 'menuItems':
                        response = await cms.createMenuItem(formData);
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
                case 'menuSets':
                    response = await cms.deleteMenuSet(id);
                    break;
                case 'menuTemplates':
                    response = await cms.deleteMenuTemplate(id);
                    break;
                case 'menuItems':
                    response = await cms.deleteMenuItem(id);
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
     * Load menu sets (legacy method for compatibility)
     */
    async loadMenuSets() {
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
            ${App.createModuleHeader('Menus', [
                {
                    text: 'Add New Menu Set',
                    icon: 'fas fa-plus',
                    class: 'btn-success',
                    onclick: 'Menus.showCreateForm()'
                }
            ])}
            
            ${App.createSearchBar('Search menu sets...', [
                {
                    id: 'statusFilter',
                    placeholder: 'Filter by status',
                    options: [
                        { value: 'active', text: 'Active' },
                        { value: 'inactive', text: 'Inactive' }
                    ]
                }
            ])}
            
            <div class="menus-content p-20">
                <div id="menuSetsTable">
                    <div class="text-center p-20">
                        <i class="fas fa-spinner fa-spin"></i> Loading menu sets...
                    </div>
                </div>
                
                <div id="menusPagination" class="mt-20"></div>
            </div>
        `;

        App.showModuleContent(html);
        this.bindEvents();

        try {
            const response = await cms.getMenuSets(params);
            
            if (response.success) {
                this.menuSets = response.data;
                this.renderMenuSetsTable(response.data);
                this.renderPagination(response.pagination);
            } else {
                throw new Error(response.message || 'Failed to load menu sets');
            }
        } catch (error) {
            $('#menuSetsTable').html('<div class="text-center p-20">Error loading menu sets: ' + error.message + '</div>');
        }
    },

    /**
     * Load menu templates
     */
    async loadMenuTemplates() {
        try {
            const response = await cms.getMenuTemplates();
            if (response.success) {
                this.menuTemplates = response.data;
            }
        } catch (error) {
            console.error('Error loading menu templates:', error);
        }
    },

    /**
     * Load pages for menu items
     */
    async loadPages() {
        try {
            const response = await cms.getPages({ limit: 1000 });
            if (response.success) {
                this.pages = response.data;
            }
        } catch (error) {
            console.error('Error loading pages:', error);
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
            this.loadMenuSets();
        }, 500));

        // Status filter
        $('#statusFilter').on('change', () => {
            this.filterStatus = $('#statusFilter').val();
            this.currentPage = 1;
            this.loadMenuSets();
        });
    },

    /**
     * Render menu sets table
     */
    renderMenuSetsTable(menuSets) {
        const columns = [
            { field: 'title', title: 'Title' },
            { field: 'name', title: 'Name' },
            { 
                field: 'template_title', 
                title: 'Template',
                formatter: (value) => value || 'N/A'
            },
            { 
                field: 'max_depth', 
                title: 'Max Depth'
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
            edit: 'Menus.showEditForm',
            delete: 'Menus.deleteMenuSet',
            custom: [
                {
                    icon: 'fas fa-list',
                    class: 'btn-info',
                    onclick: 'Menus.manageMenuItems',
                    tooltip: 'Manage Items'
                },
                {
                    icon: 'fas fa-eye',
                    class: 'btn-warning',
                    onclick: 'Menus.previewMenu',
                    tooltip: 'Preview'
                }
            ]
        };

        const tableHtml = App.createDataTable(columns, menuSets, actions);
        $('#menuSetsTable').html(tableHtml);
    },

    /**
     * Render pagination
     */
    renderPagination(pagination) {
        if (!pagination || pagination.pages <= 1) {
            $('#menusPagination').empty();
            return;
        }

        const paginationHtml = Utils.createPagination(pagination, 'Menus.goToPage');
        $('#menusPagination').html(paginationHtml);
    },

    /**
     * Go to specific page
     */
    goToPage(page) {
        this.currentPage = page;
        this.loadMenuSets();
    },

    /**
     * Search menu sets
     */
    search() {
        this.searchQuery = $('#searchInput').val();
        this.filterStatus = $('#statusFilter').val();
        this.currentPage = 1;
        this.loadMenuSets();
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
        this.loadMenuSets();
    },

    /**
     * Show create form
     */
    showCreateForm() {
        const formHtml = this.createMenuSetForm();
        
        Utils.showModal('Create New Menu Set', formHtml, `
            <button type="button" class="btn btn-secondary" onclick="Utils.hideModal()">Cancel</button>
            <button type="button" class="btn btn-success" onclick="Menus.saveMenuSet()">Create Menu Set</button>
        `);

        this.populateTemplateSelect();
    },

    /**
     * Show edit form
     */
    async showEditForm(menuSetId) {
        try {
            const response = await cms.getMenuSet(menuSetId);
            
            if (response.success) {
                const formHtml = this.createMenuSetForm(response.data);
                
                Utils.showModal('Edit Menu Set', formHtml, `
                    <button type="button" class="btn btn-secondary" onclick="Utils.hideModal()">Cancel</button>
                    <button type="button" class="btn btn-primary" onclick="Menus.saveMenuSet(${menuSetId})">Update Menu Set</button>
                `);

                this.populateTemplateSelect();
                Utils.populateForm('#menuSetForm', response.data);
            } else {
                throw new Error(response.message || 'Failed to load menu set');
            }
        } catch (error) {
            Utils.showError('Error loading menu set: ' + error.message);
        }
    },

    /**
     * Create form for Menu Sets tab
     */
    createMenuSetForm(record = null) {
        const name = record?.name || '';
        const title = record?.title || '';
        const description = record?.description || '';
        const templateId = record?.template_id || '';
        const cssClass = record?.css_class || '';
        const customCss = record?.custom_css || '';
        const maxDepth = record?.max_depth || 3;
        const showIcons = record?.show_icons !== false;
        const showBadges = record?.show_badges !== false;
        const responsive = record?.responsive !== false;
        const visibleForLevels = record?.visible_for_levels || 2147483647;
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
                        <label for="template_id">Template *</label>
                        <select class="form-control" id="template_id" name="template_id" required>
                            <option value="">Select template...</option>
                        </select>
                        <div class="invalid-feedback">Please select a template.</div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="max_depth">Maximum Depth</label>
                        <input type="number" class="form-control" id="max_depth" name="max_depth" value="${maxDepth}" min="1" max="10">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="css_class">CSS Class</label>
                        <input type="text" class="form-control" id="css_class" name="css_class" value="${cssClass}" placeholder="navbar-nav">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="visible_for_levels">Visible For Levels</label>
                        <input type="number" class="form-control" id="visible_for_levels" name="visible_for_levels" value="${visibleForLevels}">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="custom_css">Custom CSS</label>
                <textarea class="form-control" id="custom_css" name="custom_css" rows="3">${customCss}</textarea>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="show_icons">Show Icons</label>
                        <select class="form-control" id="show_icons" name="show_icons">
                            <option value="true" ${showIcons ? 'selected' : ''}>Yes</option>
                            <option value="false" ${!showIcons ? 'selected' : ''}>No</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="show_badges">Show Badges</label>
                        <select class="form-control" id="show_badges" name="show_badges">
                            <option value="true" ${showBadges ? 'selected' : ''}>Yes</option>
                            <option value="false" ${!showBadges ? 'selected' : ''}>No</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="responsive">Responsive</label>
                        <select class="form-control" id="responsive" name="responsive">
                            <option value="true" ${responsive ? 'selected' : ''}>Yes</option>
                            <option value="false" ${!responsive ? 'selected' : ''}>No</option>
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
        `;
    },

    /**
     * Create form for Menu Templates tab
     */
    createMenuTemplateForm(record = null) {
        const name = record?.name || '';
        const title = record?.title || '';
        const description = record?.description || '';
        const templateFile = record?.template_file || '';
        const cssClass = record?.css_class || '';
        const jsFile = record?.js_file || '';
        const supportsIcons = record?.supports_icons !== false;
        const supportsBadges = record?.supports_badges !== false;
        const supportsDropdown = record?.supports_dropdown !== false;
        const supportsMegaMenu = record?.supports_mega_menu === true;
        const maxLevels = record?.max_levels || 3;
        const isResponsive = record?.is_responsive !== false;
        const mobileBreakpoint = record?.mobile_breakpoint || 768;
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
                        <label for="template_file">Template File *</label>
                        <input type="text" class="form-control" id="template_file" name="template_file" value="${templateFile}" required>
                        <div class="invalid-feedback">Please provide a template file.</div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="css_class">CSS Class</label>
                        <input type="text" class="form-control" id="css_class" name="css_class" value="${cssClass}">
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
                        <label for="max_levels">Maximum Levels</label>
                        <input type="number" class="form-control" id="max_levels" name="max_levels" value="${maxLevels}" min="1" max="10">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="mobile_breakpoint">Mobile Breakpoint (px)</label>
                        <input type="number" class="form-control" id="mobile_breakpoint" name="mobile_breakpoint" value="${mobileBreakpoint}" min="320">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="order_index">Order Index</label>
                        <input type="number" class="form-control" id="order_index" name="order_index" value="${orderIndex}" min="0">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="supports_icons">Supports Icons</label>
                        <select class="form-control" id="supports_icons" name="supports_icons">
                            <option value="true" ${supportsIcons ? 'selected' : ''}>Yes</option>
                            <option value="false" ${!supportsIcons ? 'selected' : ''}>No</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="supports_badges">Supports Badges</label>
                        <select class="form-control" id="supports_badges" name="supports_badges">
                            <option value="true" ${supportsBadges ? 'selected' : ''}>Yes</option>
                            <option value="false" ${!supportsBadges ? 'selected' : ''}>No</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="supports_dropdown">Supports Dropdown</label>
                        <select class="form-control" id="supports_dropdown" name="supports_dropdown">
                            <option value="true" ${supportsDropdown ? 'selected' : ''}>Yes</option>
                            <option value="false" ${!supportsDropdown ? 'selected' : ''}>No</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="supports_mega_menu">Supports Mega Menu</label>
                        <select class="form-control" id="supports_mega_menu" name="supports_mega_menu">
                            <option value="false" ${!supportsMegaMenu ? 'selected' : ''}>No</option>
                            <option value="true" ${supportsMegaMenu ? 'selected' : ''}>Yes</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="is_responsive">Is Responsive</label>
                        <select class="form-control" id="is_responsive" name="is_responsive">
                            <option value="true" ${isResponsive ? 'selected' : ''}>Yes</option>
                            <option value="false" ${!isResponsive ? 'selected' : ''}>No</option>
                        </select>
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
     * Populate template select
     */
    populateTemplateSelect() {
        const select = $('#menuTemplate');
        this.menuTemplates.forEach(template => {
            select.append(`<option value="${template.id}">${template.title}</option>`);
        });
    },

    /**
     * Save menu set (create or update)
     */
    async saveMenuSet(menuSetId = null) {
        try {
            const formData = Utils.serializeForm('#menuSetForm');
            
            // Add current user as creator for new menu sets
            if (!menuSetId) {
                const currentUser = Utils.getCurrentUser();
                formData.created_by = currentUser?.id || 1;
            }

            // Validation
            const validation = Utils.validateForm('#menuSetForm', {
                title: { required: true, label: 'Title' },
                name: { required: true, label: 'Name', pattern: /^[a-zA-Z0-9_]+$/ },
                template_id: { required: true, label: 'Template' }
            });

            if (!validation.valid) {
                Utils.showError('Validation failed: ' + validation.errors.join(', '));
                return;
            }

            let response;
            if (menuSetId) {
                response = await cms.updateMenuSet(menuSetId, formData);
            } else {
                response = await cms.createMenuSet(formData);
            }

            if (response.success) {
                Utils.hideModal();
                Utils.showSuccess(`Menu set ${menuSetId ? 'updated' : 'created'} successfully!`);
                this.loadMenuSets();
            } else {
                throw new Error(response.message || 'Failed to save menu set');
            }
        } catch (error) {
            Utils.showError('Error saving menu set: ' + error.message);
        }
    },

    /**
     * Delete menu set
     */
    async deleteMenuSet(menuSetId) {
        const menuSet = this.menuSets.find(m => m.id === menuSetId);
        if (!menuSet) return;

        const confirmed = await App.confirmDangerousAction(
            `Are you sure you want to delete the menu set "${menuSet.title}"? This will also delete all menu items.`,
            'delete'
        );

        if (!confirmed) return;

        try {
            const response = await cms.deleteMenuSet(menuSetId);
            
            if (response.success) {
                Utils.showSuccess('Menu set deleted successfully!');
                this.loadMenuSets();
            } else {
                throw new Error(response.message || 'Failed to delete menu set');
            }
        } catch (error) {
            Utils.showError('Error deleting menu set: ' + error.message);
        }
    },

    /**
     * Manage menu items
     */
    async manageMenuItems(menuSetId) {
        this.currentMenuSetId = menuSetId;
        const menuSet = this.menuSets.find(m => m.id === menuSetId);
        
        try {
            const response = await cms.getMenuItems(menuSetId);
            const items = response.success ? response.data : [];
            
            const itemsHtml = this.createItemsManager(menuSet, items);
            
            Utils.showModal(`Manage Items - ${menuSet.title}`, itemsHtml, `
                <button type="button" class="btn btn-secondary" onclick="Utils.hideModal()">Close</button>
                <button type="button" class="btn btn-success" onclick="Menus.showAddItemForm()">Add Item</button>
            `);
            
        } catch (error) {
            Utils.showError('Error loading menu items: ' + error.message);
        }
    },

    /**
     * Create items manager HTML
     */
    createItemsManager(menuSet, items) {
        let html = `
            <div class="items-manager">
                <p><strong>Menu Set:</strong> ${menuSet.title}</p>
                <div id="itemsList">
        `;

        if (items.length > 0) {
            // Sort items by order_index and create hierarchy
            const sortedItems = this.buildMenuHierarchy(items);
            html += this.renderMenuItemsTree(sortedItems);
        } else {
            html += '<p class="text-center">No menu items added yet.</p>';
        }

        html += `
                </div>
            </div>
        `;

        return html;
    },

    /**
     * Build menu hierarchy
     */
    buildMenuHierarchy(items) {
        const itemMap = {};
        const rootItems = [];

        // Create item map
        items.forEach(item => {
            itemMap[item.id] = { ...item, children: [] };
        });

        // Build hierarchy
        items.forEach(item => {
            if (item.parent_id && itemMap[item.parent_id]) {
                itemMap[item.parent_id].children.push(itemMap[item.id]);
            } else {
                rootItems.push(itemMap[item.id]);
            }
        });

        // Sort by order_index
        const sortItems = (items) => {
            items.sort((a, b) => (a.order_index || 0) - (b.order_index || 0));
            items.forEach(item => {
                if (item.children.length > 0) {
                    sortItems(item.children);
                }
            });
        };

        sortItems(rootItems);
        return rootItems;
    },

    /**
     * Render menu items tree
     */
    renderMenuItemsTree(items, level = 0) {
        let html = '';
        
        items.forEach(item => {
            const indent = level * 20;
            html += `
                <div class="menu-item" style="border: 1px solid #ddd; padding: 15px; margin-bottom: 10px; margin-left: ${indent}px; border-radius: 4px;">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <strong>${item.title}</strong>
                            <br>
                            <small>
                                Type: ${item.link_type} | 
                                ${item.link_type === 'page' ? `Page: ${item.page_title || 'N/A'}` : `URL: ${item.link_url || 'N/A'}`}
                            </small>
                        </div>
                        <div>
                            <button class="btn btn-primary btn-sm" onclick="Menus.editMenuItem(${item.id})">Edit</button>
                            <button class="btn btn-danger btn-sm" onclick="Menus.deleteMenuItem(${item.id})">Delete</button>
                        </div>
                    </div>
                </div>
            `;
            
            if (item.children.length > 0) {
                html += this.renderMenuItemsTree(item.children, level + 1);
            }
        });
        
        return html;
    },

    /**
     * Show add item form
     */
    showAddItemForm() {
        const itemHtml = this.createMenuItemForm();
        
        Utils.showModal('Add Menu Item', itemHtml, `
            <button type="button" class="btn btn-secondary" onclick="Menus.manageMenuItems(${this.currentMenuSetId})">Back</button>
            <button type="button" class="btn btn-success" onclick="Menus.saveMenuItem()">Add Item</button>
        `);

        this.populateItemFormSelects();
        this.bindItemFormEvents();
    },

    /**
     * Create menu item form HTML
     */
    createMenuItemForm(item = null) {
        return `
            <form id="menuItemForm">
                <div class="form-group">
                    <label for="itemTitle">Title *</label>
                    <input type="text" id="itemTitle" name="title" class="form-control" required>
                </div>
                
                <div class="form-group">
                    <label for="itemName">Name *</label>
                    <input type="text" id="itemName" name="name" class="form-control" required 
                           pattern="^[a-zA-Z0-9_]+$" placeholder="item_name">
                </div>
                
                <div class="form-group">
                    <label for="linkType">Link Type *</label>
                    <select id="linkType" name="link_type" class="form-control" required>
                        <option value="">Select link type...</option>
                        <option value="page">Page</option>
                        <option value="url">Custom URL</option>
                        <option value="separator">Separator</option>
                    </select>
                </div>
                
                <div class="form-group" id="pageSelectGroup" style="display: none;">
                    <label for="pageSelect">Select Page</label>
                    <select id="pageSelect" name="page_id" class="form-control">
                        <option value="">Select page...</option>
                    </select>
                </div>
                
                <div class="form-group" id="urlInputGroup" style="display: none;">
                    <label for="linkUrl">URL</label>
                    <input type="text" id="linkUrl" name="link_url" class="form-control" placeholder="https://example.com">
                </div>
                
                <div class="form-group">
                    <label for="itemIcon">Icon (CSS class)</label>
                    <input type="text" id="itemIcon" name="icon" class="form-control" placeholder="fas fa-home">
                </div>
                
                <div class="form-group">
                    <label for="itemTarget">Target</label>
                    <select id="itemTarget" name="target" class="form-control">
                        <option value="_self">Same Window</option>
                        <option value="_blank">New Window</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="itemOrder">Order</label>
                    <input type="number" id="itemOrder" name="order_index" class="form-control" min="0" value="0">
                </div>
                
                <div class="form-group">
                    <label>
                        <input type="checkbox" id="itemActive" name="is_active" checked> Active
                    </label>
                </div>
            </form>
        `;
    },

    /**
     * Populate item form selects
     */
    populateItemFormSelects() {
        // Populate pages select
        const pageSelect = $('#pageSelect');
        this.pages.forEach(page => {
            pageSelect.append(`<option value="${page.id}">${page.title}</option>`);
        });
    },

    /**
     * Bind item form events
     */
    bindItemFormEvents() {
        $('#linkType').on('change', function() {
            const linkType = $(this).val();
            
            $('#pageSelectGroup, #urlInputGroup').hide();
            
            if (linkType === 'page') {
                $('#pageSelectGroup').show();
            } else if (linkType === 'url') {
                $('#urlInputGroup').show();
            }
        });
    },

    /**
     * Save menu item
     */
    async saveMenuItem(itemId = null) {
        try {
            const formData = Utils.serializeForm('#menuItemForm');
            formData.menu_set_id = this.currentMenuSetId;

            // Validation
            const validation = Utils.validateForm('#menuItemForm', {
                title: { required: true, label: 'Title' },
                name: { required: true, label: 'Name', pattern: /^[a-zA-Z0-9_]+$/ },
                link_type: { required: true, label: 'Link Type' }
            });

            if (!validation.valid) {
                Utils.showError('Validation failed: ' + validation.errors.join(', '));
                return;
            }

            let response;
            if (itemId) {
                response = await cms.updateMenuItem(this.currentMenuSetId, itemId, formData);
            } else {
                response = await cms.createMenuItem(this.currentMenuSetId, formData);
            }

            if (response.success) {
                Utils.showSuccess(`Menu item ${itemId ? 'updated' : 'added'} successfully!`);
                this.manageMenuItems(this.currentMenuSetId);
            } else {
                throw new Error(response.message || 'Failed to save menu item');
            }
        } catch (error) {
            Utils.showError('Error saving menu item: ' + error.message);
        }
    },

    /**
     * Preview menu
     */
    previewMenu(menuSetId) {
        const menuSet = this.menuSets.find(m => m.id === menuSetId);
        if (!menuSet) return;

        Utils.showModal(`Preview - ${menuSet.title}`, `
            <div class="menu-preview">
                <p><em>This is a preview of how the menu will appear on the website.</em></p>
                <div style="border: 1px solid #ddd; padding: 20px; background: #f9f9f9;">
                    <nav class="${menuSet.css_class || 'navbar'}">
                        <p><em>Menu items will be displayed here based on the configured items and template.</em></p>
                        <ul style="list-style: none; padding: 0;">
                            <li style="padding: 5px 0;"><a href="#" style="text-decoration: none;">Sample Menu Item 1</a></li>
                            <li style="padding: 5px 0;"><a href="#" style="text-decoration: none;">Sample Menu Item 2</a></li>
                            <li style="padding: 5px 0;"><a href="#" style="text-decoration: none;">Sample Menu Item 3</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        `);
    }
};
