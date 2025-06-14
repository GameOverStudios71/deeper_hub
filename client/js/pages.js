/**
 * Pages module - Expanded to handle all page-related tables
 */
window.Pages = {

    // Current state
    currentPage: 1,
    searchQuery: '',
    filterStatus: '',
    currentTab: 'pages',

    // Data storage
    pages: [],
    pageTypes: [],
    pageLayouts: [],
    designBoxes: [],
    pageBlocks: [],
    contentPlaceholders: [],

    // Tab configuration
    tabs: {
        pages: {
            title: 'Pages',
            table: 'cms_pages',
            icon: 'fas fa-file-alt',
            description: 'Manage website pages'
        },
        layouts: {
            title: 'Layouts',
            table: 'cms_page_layouts',
            icon: 'fas fa-th-large',
            description: 'Page layout templates'
        },
        types: {
            title: 'Types',
            table: 'cms_page_types',
            icon: 'fas fa-tags',
            description: 'Page type definitions'
        },
        boxes: {
            title: 'Design Boxes',
            table: 'cms_design_boxes',
            icon: 'fas fa-cube',
            description: 'Design box components'
        },
        blocks: {
            title: 'Page Blocks',
            table: 'cms_page_blocks',
            icon: 'fas fa-th',
            description: 'Content blocks for pages'
        },
        placeholders: {
            title: 'Placeholders',
            table: 'cms_content_placeholders',
            icon: 'fas fa-square',
            description: 'Content placeholder definitions'
        }
    },

    /**
     * Initialize pages module
     */
    async init() {
        try {
            await this.loadRelatedData();
            await this.loadCurrentTab();
        } catch (error) {
            App.handleError(error, 'Pages');
        }
    },

    /**
     * Load all related data
     */
    async loadRelatedData() {
        await Promise.allSettled([
            this.loadPageTypes(),
            this.loadPageLayouts(),
            this.loadDesignBoxes()
        ]);
    },

    /**
     * Load current tab data
     */
    async loadCurrentTab() {
        const tabConfig = this.tabs[this.currentTab];
        if (!tabConfig) return;

        const html = `
            ${App.createModuleHeader('Pages Management', [])}

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
        this.bindEvents();

        // Load data based on current tab
        switch (this.currentTab) {
            case 'pages':
                await this.loadPages();
                break;
            case 'layouts':
                await this.loadPageLayouts();
                break;
            case 'types':
                await this.loadPageTypes();
                break;
            case 'boxes':
                await this.loadDesignBoxes();
                break;
            case 'blocks':
                await this.loadPageBlocks();
                break;
            case 'placeholders':
                await this.loadContentPlaceholders();
                break;
        }
    },

    /**
     * Create tab navigation
     */
    createTabNavigation() {
        let html = '<div class="tab-navigation mb-20">';
        html += '<div class="nav nav-tabs" style="border-bottom: 2px solid #dee2e6;">';

        Object.keys(this.tabs).forEach(tabKey => {
            const tab = this.tabs[tabKey];
            const activeClass = this.currentTab === tabKey ? 'active' : '';

            html += `
                <button class="nav-link ${activeClass}" onclick="Pages.switchTab('${tabKey}')"
                        style="border: none; background: ${activeClass ? '#007bff' : 'transparent'};
                               color: ${activeClass ? 'white' : '#007bff'}; padding: 10px 20px; margin-right: 5px;">
                    <i class="${tab.icon}"></i> ${tab.title}
                </button>
            `;
        });

        html += '</div>';

        // Tab description
        const currentTabConfig = this.tabs[this.currentTab];
        html += `<div class="tab-description mt-10" style="color: #666; font-size: 14px;">
            <i class="${currentTabConfig.icon}"></i> ${currentTabConfig.description}
        </div>`;

        html += '</div>';
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
        if (['pages', 'layouts', 'types', 'boxes'].includes(this.currentTab)) {
            filters.push({
                id: 'statusFilter',
                placeholder: 'Filter by status',
                options: [
                    { value: 'active', text: 'Active' },
                    { value: 'inactive', text: 'Inactive' }
                ]
            });
        }

        return App.createSearchBar(searchPlaceholder, filters, [
            {
                text: `Add New ${tabConfig.title.slice(0, -1)}`, // Remove 's' from plural
                icon: 'fas fa-plus',
                class: 'btn-success',
                onclick: `Pages.showCreateForm()`
            }
        ]);
    },

    /**
     * Switch to different tab
     */
    async switchTab(tabKey) {
        if (this.currentTab === tabKey) return;

        this.currentTab = tabKey;
        this.currentPage = 1;
        this.searchQuery = '';
        this.filterStatus = '';

        await this.loadCurrentTab();
    },

    /**
     * Load pages data
     */
    async loadPages() {
        const params = this.buildParams();

        try {
            const response = await cms.getPages(params);

            if (response.success) {
                this.pages = response.data;
                this.renderPagesTable(response.data);
                this.renderPagination(response.pagination);
            } else {
                throw new Error(response.message || 'Failed to load pages');
            }
        } catch (error) {
            this.showTableError('pages', error.message);
        }
    },

    /**
     * Load page types data
     */
    async loadPageTypes() {
        if (this.currentTab !== 'types') {
            // Loading for dropdown usage
            try {
                const response = await cms.getPageTypes();
                if (response.success) {
                    this.pageTypes = response.data;
                }
            } catch (error) {
                console.error('Error loading page types:', error);
            }
            return;
        }

        // Loading for table display
        const params = this.buildParams();

        try {
            const response = await cms.getPageTypes(params);

            if (response.success) {
                this.pageTypes = response.data;
                this.renderPageTypesTable(response.data);
                this.renderPagination(response.pagination);
            } else {
                throw new Error(response.message || 'Failed to load page types');
            }
        } catch (error) {
            this.showTableError('page types', error.message);
        }
    },

    /**
     * Load page layouts data
     */
    async loadPageLayouts() {
        if (this.currentTab !== 'layouts') {
            // Loading for dropdown usage
            try {
                const response = await cms.getPageLayouts();
                if (response.success) {
                    this.pageLayouts = response.data;
                }
            } catch (error) {
                console.error('Error loading page layouts:', error);
            }
            return;
        }

        // Loading for table display
        const params = this.buildParams();

        try {
            const response = await cms.getPageLayouts(params);

            if (response.success) {
                this.pageLayouts = response.data;
                this.renderPageLayoutsTable(response.data);
                this.renderPagination(response.pagination);
            } else {
                throw new Error(response.message || 'Failed to load page layouts');
            }
        } catch (error) {
            this.showTableError('page layouts', error.message);
        }
    },

    /**
     * Load design boxes data
     */
    async loadDesignBoxes() {
        if (this.currentTab !== 'boxes') {
            // Loading for dropdown usage
            try {
                const response = await cms.getDesignBoxes();
                if (response.success) {
                    this.designBoxes = response.data;
                }
            } catch (error) {
                console.error('Error loading design boxes:', error);
            }
            return;
        }

        // Loading for table display
        const params = this.buildParams();

        try {
            const response = await cms.getDesignBoxes(params);

            if (response.success) {
                this.designBoxes = response.data;
                this.renderDesignBoxesTable(response.data);
                this.renderPagination(response.pagination);
            } else {
                throw new Error(response.message || 'Failed to load design boxes');
            }
        } catch (error) {
            this.showTableError('design boxes', error.message);
        }
    },

    /**
     * Load page blocks data
     */
    async loadPageBlocks() {
        const params = this.buildParams();

        try {
            const response = await cms.getPageBlocks(params);

            if (response.success) {
                this.pageBlocks = response.data;
                this.renderPageBlocksTable(response.data);
                this.renderPagination(response.pagination);
            } else {
                throw new Error(response.message || 'Failed to load page blocks');
            }
        } catch (error) {
            this.showTableError('page blocks', error.message);
        }
    },

    /**
     * Load content placeholders data
     */
    async loadContentPlaceholders() {
        const params = this.buildParams();

        try {
            const response = await cms.getContentPlaceholders(params);

            if (response.success) {
                this.contentPlaceholders = response.data;
                this.renderContentPlaceholdersTable(response.data);
                this.renderPagination(response.pagination);
            } else {
                throw new Error(response.message || 'Failed to load content placeholders');
            }
        } catch (error) {
            this.showTableError('content placeholders', error.message);
        }
    },

    /**
     * Build parameters for API calls
     */
    buildParams() {
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

        return params;
    },

    /**
     * Show table error
     */
    showTableError(entityName, message) {
        $('#tabDataTable').html(`<div class="text-center p-20">Error loading ${entityName}: ${message}</div>`);
    },

    /**
     * Bind events
     */
    bindEvents() {
        // Search functionality
        $('#searchInput').on('input', Utils.debounce(() => {
            this.searchQuery = $('#searchInput').val();
            this.currentPage = 1;
            this.loadCurrentTab();
        }, 500));

        // Status filter
        $('#statusFilter').on('change', () => {
            this.filterStatus = $('#statusFilter').val();
            this.currentPage = 1;
            this.loadCurrentTab();
        });
    },

    /**
     * Render pages table
     */
    renderPagesTable(pages) {
        const columns = [
            { field: 'title', title: 'Title' },
            { field: 'uri', title: 'URI' },
            {
                field: 'page_type_title',
                title: 'Type',
                formatter: (value) => value || 'N/A'
            },
            {
                field: 'is_active',
                title: 'Status',
                type: 'badge'
            },
            {
                field: 'is_home',
                title: 'Home Page',
                formatter: (value) => value ? '<span class="badge badge-info">Home</span>' : ''
            },
            {
                field: 'created_at',
                title: 'Created',
                type: 'date'
            }
        ];

        const actions = {
            edit: 'Pages.showEditForm',
            delete: 'Pages.deleteRecord',
            custom: [
                {
                    icon: 'fas fa-eye',
                    class: 'btn-info',
                    onclick: 'Pages.previewPage',
                    tooltip: 'Preview'
                }
            ]
        };

        const tableHtml = App.createDataTable(columns, pages, actions);
        $('#tabDataTable').html(tableHtml);
    },

    /**
     * Render page layouts table
     */
    renderPageLayoutsTable(layouts) {
        const columns = [
            { field: 'title', title: 'Title' },
            { field: 'name', title: 'Name' },
            { field: 'columns', title: 'Columns' },
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
            edit: 'Pages.showEditForm',
            delete: 'Pages.deleteRecord'
        };

        const tableHtml = App.createDataTable(columns, layouts, actions);
        $('#tabDataTable').html(tableHtml);
    },

    /**
     * Render page types table
     */
    renderPageTypesTable(types) {
        const columns = [
            { field: 'title', title: 'Title' },
            { field: 'name', title: 'Name' },
            { field: 'description', title: 'Description' },
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
            edit: 'Pages.showEditForm',
            delete: 'Pages.deleteRecord'
        };

        const tableHtml = App.createDataTable(columns, types, actions);
        $('#tabDataTable').html(tableHtml);
    },

    /**
     * Render design boxes table
     */
    renderDesignBoxesTable(boxes) {
        const columns = [
            { field: 'title', title: 'Title' },
            { field: 'name', title: 'Name' },
            { field: 'css_class', title: 'CSS Class' },
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
            edit: 'Pages.showEditForm',
            delete: 'Pages.deleteRecord'
        };

        const tableHtml = App.createDataTable(columns, boxes, actions);
        $('#tabDataTable').html(tableHtml);
    },

    /**
     * Render page blocks table
     */
    renderPageBlocksTable(blocks) {
        const columns = [
            { field: 'page_title', title: 'Page' },
            { field: 'placeholder_name', title: 'Placeholder' },
            { field: 'order_index', title: 'Order' },
            { field: 'content_type', title: 'Content Type' },
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
            edit: 'Pages.showEditForm',
            delete: 'Pages.deleteRecord'
        };

        const tableHtml = App.createDataTable(columns, blocks, actions);
        $('#tabDataTable').html(tableHtml);
    },

    /**
     * Render content placeholders table
     */
    renderContentPlaceholdersTable(placeholders) {
        const columns = [
            { field: 'name', title: 'Name' },
            { field: 'title', title: 'Title' },
            { field: 'description', title: 'Description' },
            { field: 'default_content', title: 'Default Content' },
            {
                field: 'created_at',
                title: 'Created',
                type: 'date'
            }
        ];

        const actions = {
            edit: 'Pages.showEditForm',
            delete: 'Pages.deleteRecord'
        };

        const tableHtml = App.createDataTable(columns, placeholders, actions);
        $('#tabDataTable').html(tableHtml);
    },

    /**
     * Render pagination
     */
    renderPagination(pagination) {
        if (!pagination || pagination.pages <= 1) {
            $('#tabPagination').empty();
            return;
        }

        const paginationHtml = Utils.createPagination(pagination, 'Pages.goToPage');
        $('#tabPagination').html(paginationHtml);
    },

    /**
     * Go to specific page
     */
    goToPage(page) {
        this.currentPage = page;
        this.loadCurrentTab();
    },

    /**
     * Search current tab data
     */
    search() {
        this.searchQuery = $('#searchInput').val();
        this.filterStatus = $('#statusFilter').val();
        this.currentPage = 1;
        this.loadCurrentTab();
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
        this.loadCurrentTab();
    },

    /**
     * Show create form
     */
    showCreateForm() {
        const tabConfig = this.tabs[this.currentTab];
        const entityName = tabConfig.title.slice(0, -1); // Remove 's' from plural
        const formHtml = this.createForm();

        Utils.showModal(`Create New ${entityName}`, formHtml, `
            <button type="button" class="btn btn-secondary" onclick="Utils.hideModal()">Cancel</button>
            <button type="button" class="btn btn-success" onclick="Pages.saveRecord()">Create ${entityName}</button>
        `);

        this.populateFormSelects();
    },

    /**
     * Show edit form
     */
    async showEditForm(recordId) {
        try {
            const tabConfig = this.tabs[this.currentTab];
            const entityName = tabConfig.title.slice(0, -1); // Remove 's' from plural

            let response;
            switch (this.currentTab) {
                case 'pages':
                    response = await cms.getPage(recordId);
                    break;
                case 'layouts':
                    response = await cms.getPageLayout(recordId);
                    break;
                case 'types':
                    response = await cms.getPageType(recordId);
                    break;
                case 'boxes':
                    response = await cms.getDesignBox(recordId);
                    break;
                case 'blocks':
                    response = await cms.getPageBlock(recordId);
                    break;
                case 'placeholders':
                    response = await cms.getContentPlaceholder(recordId);
                    break;
                default:
                    throw new Error('Unknown tab');
            }

            if (response.success) {
                const formHtml = this.createForm(response.data);

                Utils.showModal(`Edit ${entityName}`, formHtml, `
                    <button type="button" class="btn btn-secondary" onclick="Utils.hideModal()">Cancel</button>
                    <button type="button" class="btn btn-primary" onclick="Pages.saveRecord(${recordId})">Update ${entityName}</button>
                `);

                this.populateFormSelects();
                Utils.populateForm('#recordForm', response.data);
            } else {
                throw new Error(response.message || `Failed to load ${entityName.toLowerCase()}`);
            }
        } catch (error) {
            Utils.showError(`Error loading record: ${error.message}`);
        }
    },

    /**
     * Create form HTML based on current tab
     */
    createForm(record = null) {
        switch (this.currentTab) {
            case 'pages':
                return this.createPageForm(record);
            case 'layouts':
                return this.createLayoutForm(record);
            case 'types':
                return this.createTypeForm(record);
            case 'boxes':
                return this.createBoxForm(record);
            case 'blocks':
                return this.createBlockForm(record);
            case 'placeholders':
                return this.createPlaceholderForm(record);
            default:
                return '<p>Form not implemented for this tab.</p>';
        }
    },

    /**
     * Create page form HTML
     */
    createPageForm(page = null) {
        return `
            <form id="recordForm">
                <div class="form-group">
                    <label for="pageTitle">Title *</label>
                    <input type="text" id="pageTitle" name="title" class="form-control" required>
                </div>

                <div class="form-group">
                    <label for="pageUri">URI *</label>
                    <input type="text" id="pageUri" name="uri" class="form-control" required
                           placeholder="/page-url" pattern="^/.*">
                </div>

                <div class="form-group">
                    <label for="pageDescription">Description</label>
                    <textarea id="pageDescription" name="description" class="form-control" rows="3"></textarea>
                </div>

                <div class="form-group">
                    <label for="pageType">Page Type *</label>
                    <select id="pageType" name="page_type_id" class="form-control" required>
                        <option value="">Select page type...</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="pageLayout">Layout *</label>
                    <select id="pageLayout" name="layout_id" class="form-control" required>
                        <option value="">Select layout...</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>
                        <input type="checkbox" id="pageActive" name="is_active" checked> Active
                    </label>
                </div>

                <div class="form-group">
                    <label>
                        <input type="checkbox" id="pageHome" name="is_home"> Home Page
                    </label>
                </div>

                <!-- SEO Section -->
                <h4>SEO Settings</h4>

                <div class="form-group">
                    <label for="metaTitle">Meta Title</label>
                    <input type="text" id="metaTitle" name="meta_title" class="form-control" maxlength="255">
                </div>

                <div class="form-group">
                    <label for="metaDescription">Meta Description</label>
                    <textarea id="metaDescription" name="meta_description" class="form-control"
                              rows="2" maxlength="500"></textarea>
                </div>

                <div class="form-group">
                    <label for="metaKeywords">Meta Keywords</label>
                    <input type="text" id="metaKeywords" name="meta_keywords" class="form-control"
                           placeholder="keyword1, keyword2, keyword3">
                </div>
            </form>
        `;
    },

    /**
     * Create layout form HTML
     */
    createLayoutForm(layout = null) {
        return `
            <form id="recordForm">
                <div class="form-group">
                    <label for="layoutTitle">Title *</label>
                    <input type="text" id="layoutTitle" name="title" class="form-control" required>
                </div>

                <div class="form-group">
                    <label for="layoutName">Name *</label>
                    <input type="text" id="layoutName" name="name" class="form-control" required
                           pattern="^[a-zA-Z0-9_]+$" placeholder="layout_name">
                </div>

                <div class="form-group">
                    <label for="layoutDescription">Description</label>
                    <textarea id="layoutDescription" name="description" class="form-control" rows="3"></textarea>
                </div>

                <div class="form-group">
                    <label for="layoutColumns">Columns *</label>
                    <select id="layoutColumns" name="columns" class="form-control" required>
                        <option value="1">1 Column</option>
                        <option value="2">2 Columns</option>
                        <option value="3">3 Columns</option>
                        <option value="4">4 Columns</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="layoutTemplate">Template Code</label>
                    <textarea id="layoutTemplate" name="template" class="form-control" rows="8"
                              placeholder="HTML template code..."></textarea>
                </div>

                <div class="form-group">
                    <label for="layoutCss">CSS Classes</label>
                    <input type="text" id="layoutCss" name="css_classes" class="form-control"
                           placeholder="container row col-md-6">
                </div>

                <div class="form-group">
                    <label>
                        <input type="checkbox" id="layoutActive" name="is_active" checked> Active
                    </label>
                </div>
            </form>
        `;
    },

    /**
     * Create type form HTML
     */
    createTypeForm(type = null) {
        return `
            <form id="recordForm">
                <div class="form-group">
                    <label for="typeTitle">Title *</label>
                    <input type="text" id="typeTitle" name="title" class="form-control" required>
                </div>

                <div class="form-group">
                    <label for="typeName">Name *</label>
                    <input type="text" id="typeName" name="name" class="form-control" required
                           pattern="^[a-zA-Z0-9_]+$" placeholder="page_type_name">
                </div>

                <div class="form-group">
                    <label for="typeDescription">Description</label>
                    <textarea id="typeDescription" name="description" class="form-control" rows="3"></textarea>
                </div>

                <div class="form-group">
                    <label for="typeIcon">Icon Class</label>
                    <input type="text" id="typeIcon" name="icon_class" class="form-control"
                           placeholder="fas fa-file-alt">
                </div>

                <div class="form-group">
                    <label for="typeColor">Color</label>
                    <input type="color" id="typeColor" name="color" class="form-control">
                </div>

                <div class="form-group">
                    <label>
                        <input type="checkbox" id="typeActive" name="is_active" checked> Active
                    </label>
                </div>
            </form>
        `;
    },

    /**
     * Create design box form HTML
     */
    createBoxForm(box = null) {
        return `
            <form id="recordForm">
                <div class="form-group">
                    <label for="boxTitle">Title *</label>
                    <input type="text" id="boxTitle" name="title" class="form-control" required>
                </div>

                <div class="form-group">
                    <label for="boxName">Name *</label>
                    <input type="text" id="boxName" name="name" class="form-control" required
                           pattern="^[a-zA-Z0-9_]+$" placeholder="box_name">
                </div>

                <div class="form-group">
                    <label for="boxDescription">Description</label>
                    <textarea id="boxDescription" name="description" class="form-control" rows="3"></textarea>
                </div>

                <div class="form-group">
                    <label for="boxCssClass">CSS Class *</label>
                    <input type="text" id="boxCssClass" name="css_class" class="form-control" required
                           placeholder="card panel alert">
                </div>

                <div class="form-group">
                    <label for="boxTemplate">Template</label>
                    <textarea id="boxTemplate" name="template" class="form-control" rows="6"
                              placeholder="HTML template..."></textarea>
                </div>

                <div class="form-group">
                    <label>
                        <input type="checkbox" id="boxActive" name="is_active" checked> Active
                    </label>
                </div>
            </form>
        `;
    },

    /**
     * Create block form HTML
     */
    createBlockForm(block = null) {
        return `
            <form id="recordForm">
                <div class="form-group">
                    <label for="blockPage">Page *</label>
                    <select id="blockPage" name="page_id" class="form-control" required>
                        <option value="">Select page...</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="blockPlaceholder">Placeholder *</label>
                    <input type="text" id="blockPlaceholder" name="placeholder_name" class="form-control" required
                           placeholder="main_content">
                </div>

                <div class="form-group">
                    <label for="blockOrder">Order Index</label>
                    <input type="number" id="blockOrder" name="order_index" class="form-control"
                           min="0" value="0">
                </div>

                <div class="form-group">
                    <label for="blockContentType">Content Type *</label>
                    <select id="blockContentType" name="content_type" class="form-control" required>
                        <option value="html">HTML</option>
                        <option value="text">Text</option>
                        <option value="widget">Widget</option>
                        <option value="form">Form</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>
                        <input type="checkbox" id="blockActive" name="is_active" checked> Active
                    </label>
                </div>
            </form>
        `;
    },

    /**
     * Create placeholder form HTML
     */
    createPlaceholderForm(placeholder = null) {
        return `
            <form id="recordForm">
                <div class="form-group">
                    <label for="placeholderName">Name *</label>
                    <input type="text" id="placeholderName" name="name" class="form-control" required
                           pattern="^[a-zA-Z0-9_]+$" placeholder="placeholder_name">
                </div>

                <div class="form-group">
                    <label for="placeholderTitle">Title *</label>
                    <input type="text" id="placeholderTitle" name="title" class="form-control" required>
                </div>

                <div class="form-group">
                    <label for="placeholderDescription">Description</label>
                    <textarea id="placeholderDescription" name="description" class="form-control" rows="3"></textarea>
                </div>

                <div class="form-group">
                    <label for="placeholderDefault">Default Content</label>
                    <textarea id="placeholderDefault" name="default_content" class="form-control" rows="6"
                              placeholder="Default HTML content..."></textarea>
                </div>

                <div class="form-group">
                    <label for="placeholderCss">CSS Classes</label>
                    <input type="text" id="placeholderCss" name="css_classes" class="form-control"
                           placeholder="content-area main-section">
                </div>
            </form>
        `;
    },

    /**
     * Populate form selects
     */
    populateFormSelects() {
        // Populate page types (for pages tab)
        if (this.currentTab === 'pages') {
            const pageTypeSelect = $('#pageType');
            pageTypeSelect.empty().append('<option value="">Select page type...</option>');
            this.pageTypes.forEach(type => {
                pageTypeSelect.append(`<option value="${type.id}">${type.title}</option>`);
            });

            // Populate page layouts
            const pageLayoutSelect = $('#pageLayout');
            pageLayoutSelect.empty().append('<option value="">Select layout...</option>');
            this.pageLayouts.forEach(layout => {
                pageLayoutSelect.append(`<option value="${layout.id}">${layout.title}</option>`);
            });
        }

        // Populate pages (for blocks tab)
        if (this.currentTab === 'blocks') {
            const pageSelect = $('#blockPage');
            pageSelect.empty().append('<option value="">Select page...</option>');
            this.pages.forEach(page => {
                pageSelect.append(`<option value="${page.id}">${page.title}</option>`);
            });
        }
    },

    /**
     * Save record (create or update) - Universal method for all tabs
     */
    async saveRecord(recordId = null) {
        try {
            const formData = Utils.serializeForm('#recordForm');
            const tabConfig = this.tabs[this.currentTab];
            const entityName = tabConfig.title.slice(0, -1); // Remove 's' from plural

            // Add current user for new records
            if (!recordId) {
                const currentUser = Utils.getCurrentUser();
                if (this.currentTab === 'pages') {
                    formData.author_id = currentUser?.id || 1;
                } else {
                    formData.created_by = currentUser?.id || 1;
                }
            }

            // Validation rules based on tab
            const validationRules = this.getValidationRules();
            const validation = Utils.validateForm('#recordForm', validationRules);

            if (!validation.valid) {
                Utils.showError('Validation failed: ' + validation.errors.join(', '));
                return;
            }

            // Call appropriate API method
            let response;
            if (recordId) {
                response = await this.updateRecord(recordId, formData);
            } else {
                response = await this.createRecord(formData);
            }

            if (response.success) {
                Utils.hideModal();
                Utils.showSuccess(`${entityName} ${recordId ? 'updated' : 'created'} successfully!`);
                this.loadCurrentTab();
            } else {
                throw new Error(response.message || `Failed to save ${entityName.toLowerCase()}`);
            }
        } catch (error) {
            Utils.showError(`Error saving record: ${error.message}`);
        }
    },

    /**
     * Get validation rules for current tab
     */
    getValidationRules() {
        switch (this.currentTab) {
            case 'pages':
                return {
                    title: { required: true, label: 'Title' },
                    uri: { required: true, label: 'URI', pattern: /^\/.*/ },
                    page_type_id: { required: true, label: 'Page Type' },
                    layout_id: { required: true, label: 'Layout' }
                };
            case 'layouts':
                return {
                    title: { required: true, label: 'Title' },
                    name: { required: true, label: 'Name', pattern: /^[a-zA-Z0-9_]+$/ },
                    columns: { required: true, label: 'Columns' }
                };
            case 'types':
                return {
                    title: { required: true, label: 'Title' },
                    name: { required: true, label: 'Name', pattern: /^[a-zA-Z0-9_]+$/ }
                };
            case 'boxes':
                return {
                    title: { required: true, label: 'Title' },
                    name: { required: true, label: 'Name', pattern: /^[a-zA-Z0-9_]+$/ },
                    css_class: { required: true, label: 'CSS Class' }
                };
            case 'blocks':
                return {
                    page_id: { required: true, label: 'Page' },
                    placeholder_name: { required: true, label: 'Placeholder' },
                    content_type: { required: true, label: 'Content Type' }
                };
            case 'placeholders':
                return {
                    name: { required: true, label: 'Name', pattern: /^[a-zA-Z0-9_]+$/ },
                    title: { required: true, label: 'Title' }
                };
            default:
                return {};
        }
    },

    /**
     * Create record via API
     */
    async createRecord(formData) {
        switch (this.currentTab) {
            case 'pages':
                return await cms.createPage(formData);
            case 'layouts':
                return await cms.createPageLayout(formData);
            case 'types':
                return await cms.createPageType(formData);
            case 'boxes':
                return await cms.createDesignBox(formData);
            case 'blocks':
                return await cms.createPageBlock(formData);
            case 'placeholders':
                return await cms.createContentPlaceholder(formData);
            default:
                throw new Error('Unknown tab for create operation');
        }
    },

    /**
     * Update record via API
     */
    async updateRecord(recordId, formData) {
        switch (this.currentTab) {
            case 'pages':
                return await cms.updatePage(recordId, formData);
            case 'layouts':
                return await cms.updatePageLayout(recordId, formData);
            case 'types':
                return await cms.updatePageType(recordId, formData);
            case 'boxes':
                return await cms.updateDesignBox(recordId, formData);
            case 'blocks':
                return await cms.updatePageBlock(recordId, formData);
            case 'placeholders':
                return await cms.updateContentPlaceholder(recordId, formData);
            default:
                throw new Error('Unknown tab for update operation');
        }
    },

    /**
     * Delete record - Universal method for all tabs
     */
    async deleteRecord(recordId) {
        try {
            const tabConfig = this.tabs[this.currentTab];
            const entityName = tabConfig.title.slice(0, -1); // Remove 's' from plural

            // Get current data array
            let currentData;
            switch (this.currentTab) {
                case 'pages':
                    currentData = this.pages;
                    break;
                case 'layouts':
                    currentData = this.pageLayouts;
                    break;
                case 'types':
                    currentData = this.pageTypes;
                    break;
                case 'boxes':
                    currentData = this.designBoxes;
                    break;
                case 'blocks':
                    currentData = this.pageBlocks;
                    break;
                case 'placeholders':
                    currentData = this.contentPlaceholders;
                    break;
                default:
                    currentData = [];
            }

            const record = currentData.find(r => r.id === recordId);
            if (!record) return;

            const confirmed = await App.confirmDangerousAction(
                `Are you sure you want to delete the ${entityName.toLowerCase()} "${record.title || record.name}"? This action cannot be undone.`,
                'delete'
            );

            if (!confirmed) return;

            // Call appropriate delete API method
            let response;
            switch (this.currentTab) {
                case 'pages':
                    response = await cms.deletePage(recordId);
                    break;
                case 'layouts':
                    response = await cms.deletePageLayout(recordId);
                    break;
                case 'types':
                    response = await cms.deletePageType(recordId);
                    break;
                case 'boxes':
                    response = await cms.deleteDesignBox(recordId);
                    break;
                case 'blocks':
                    response = await cms.deletePageBlock(recordId);
                    break;
                case 'placeholders':
                    response = await cms.deleteContentPlaceholder(recordId);
                    break;
                default:
                    throw new Error('Unknown tab for delete operation');
            }

            if (response.success) {
                Utils.showSuccess(`${entityName} deleted successfully!`);
                this.loadCurrentTab();
            } else {
                throw new Error(response.message || `Failed to delete ${entityName.toLowerCase()}`);
            }
        } catch (error) {
            Utils.showError(`Error deleting record: ${error.message}`);
        }
    },

    /**
     * Preview page (only for pages tab)
     */
    previewPage(pageId) {
        if (this.currentTab !== 'pages') return;

        const page = this.pages.find(p => p.id === pageId);
        if (!page) return;

        // Open page in new tab
        const previewUrl = page.uri;
        window.open(previewUrl, '_blank');
    }
};
