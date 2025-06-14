/**
 * Media module - Media Management with 5 tables
 */
window.Media = {

    currentPage: 1,
    searchQuery: '',
    filterStatus: '',
    currentTab: 'storage',
    data: [],

    // Tab configuration
    tabs: {
        storage: {
            title: 'Storage',
            icon: 'fas fa-hdd',
            description: 'Manage storage configurations and settings',
            apiEndpoint: 'cms/media/storage'
        },
        folders: {
            title: 'Folders',
            icon: 'fas fa-folder',
            description: 'Manage media folders and organization',
            apiEndpoint: 'cms/media/folders'
        },
        files: {
            title: 'Files',
            icon: 'fas fa-file',
            description: 'Manage media files and uploads',
            apiEndpoint: 'cms/media/files'
        },
        transformations: {
            title: 'Transformations',
            icon: 'fas fa-magic',
            description: 'Manage media transformation rules',
            apiEndpoint: 'cms/media/transformations'
        },
        fileTransformations: {
            title: 'File Transformations',
            icon: 'fas fa-cogs',
            description: 'Manage applied transformations on files',
            apiEndpoint: 'cms/media/file-transformations'
        }
    },

    /**
     * Initialize media module
     */
    async init() {
        try {
            await this.switchTab(this.currentTab);
        } catch (error) {
            App.handleError(error, 'Media');
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
            ${App.createModuleHeader('Media Management', [
                {
                    text: `Add New ${entityName}`,
                    icon: 'fas fa-plus',
                    class: 'btn-success',
                    onclick: 'Media.showCreateForm()'
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
                <button class="nav-link ${isActive}" onclick="Media.switchTab('${tabKey}')">
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
        if (['storage', 'folders', 'files'].includes(this.currentTab)) {
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
                case 'storage':
                    response = await cms.getMediaStorage(params);
                    break;
                case 'folders':
                    response = await cms.getMediaFolders(params);
                    break;
                case 'files':
                    response = await cms.getMediaFiles(params);
                    break;
                case 'transformations':
                    response = await cms.getMediaTransformations(params);
                    break;
                case 'fileTransformations':
                    response = await cms.getMediaFileTransformations(params);
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
                    <button class="btn btn-primary" onclick="Media.loadTabData()">
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
            edit: 'Media.showEditForm',
            delete: 'Media.deleteRecord'
        };

        // Define columns based on current tab
        switch (this.currentTab) {
            case 'storage':
                columns = [
                    { field: 'id', title: 'ID', width: '60px' },
                    { field: 'name', title: 'Name' },
                    { field: 'title', title: 'Title' },
                    { field: 'storage_type', title: 'Type' },
                    { field: 'base_url', title: 'Base URL' },
                    { field: 'max_file_size', title: 'Max Size', type: 'filesize' },
                    { field: 'quota_used', title: 'Used', type: 'filesize' },
                    { field: 'is_active', title: 'Status', type: 'badge' },
                    { field: 'is_default', title: 'Default', type: 'badge' }
                ];
                actions.custom = [
                    { icon: 'fas fa-cog', class: 'btn-info', onclick: 'Media.configureStorage', tooltip: 'Configure' }
                ];
                break;
            case 'folders':
                columns = [
                    { field: 'id', title: 'ID', width: '60px' },
                    { field: 'name', title: 'Name' },
                    { field: 'full_path', title: 'Path' },
                    { field: 'storage_title', title: 'Storage' },
                    { field: 'description', title: 'Description' },
                    { field: 'is_public', title: 'Public', type: 'badge' },
                    { field: 'is_active', title: 'Status', type: 'badge' },
                    { field: 'created_at', title: 'Created', type: 'date' }
                ];
                actions.custom = [
                    { icon: 'fas fa-folder-open', class: 'btn-warning', onclick: 'Media.browseFolder', tooltip: 'Browse' }
                ];
                break;
            case 'files':
                columns = [
                    { field: 'id', title: 'ID', width: '60px' },
                    { field: 'original_name', title: 'Name' },
                    { field: 'mime_type', title: 'Type' },
                    { field: 'file_size', title: 'Size', type: 'filesize' },
                    { field: 'folder_name', title: 'Folder' },
                    { field: 'storage_title', title: 'Storage' },
                    { field: 'download_count', title: 'Downloads' },
                    { field: 'is_active', title: 'Status', type: 'badge' },
                    { field: 'created_at', title: 'Uploaded', type: 'date' }
                ];
                actions.custom = [
                    { icon: 'fas fa-download', class: 'btn-success', onclick: 'Media.downloadFile', tooltip: 'Download' },
                    { icon: 'fas fa-eye', class: 'btn-info', onclick: 'Media.previewFile', tooltip: 'Preview' }
                ];
                break;
            case 'transformations':
                columns = [
                    { field: 'id', title: 'ID', width: '60px' },
                    { field: 'name', title: 'Name' },
                    { field: 'transformation_type', title: 'Type' },
                    { field: 'target_format', title: 'Format' },
                    { field: 'quality', title: 'Quality' },
                    { field: 'is_active', title: 'Status', type: 'badge' },
                    { field: 'created_at', title: 'Created', type: 'date' }
                ];
                break;
            case 'fileTransformations':
                columns = [
                    { field: 'id', title: 'ID', width: '60px' },
                    { field: 'file_name', title: 'File' },
                    { field: 'transformation_name', title: 'Transformation' },
                    { field: 'output_path', title: 'Output' },
                    { field: 'status', title: 'Status' },
                    { field: 'file_size', title: 'Size', type: 'filesize' },
                    { field: 'created_at', title: 'Applied', type: 'date' }
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
                onclick: 'Media.saveRecord()'
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
                onclick: `Media.saveRecord(${id})`
            }
        ]);

        // Populate form with existing data
        Utils.populateForm('#tabForm', record);
    },

    /**
     * Create form HTML for current tab
     */
    createTabForm(record = null) {
        let formHtml = '<form id="tabForm" class="needs-validation" novalidate>';

        switch (this.currentTab) {
            case 'storage':
                formHtml += this.createStorageForm(record);
                break;
            case 'folders':
                formHtml += this.createFolderForm(record);
                break;
            case 'files':
                formHtml += this.createFileForm(record);
                break;
            case 'transformations':
                formHtml += this.createTransformationForm(record);
                break;
            case 'fileTransformations':
                formHtml += this.createFileTransformationForm(record);
                break;
            default:
                formHtml += '<p>Form not implemented for this tab.</p>';
        }

        formHtml += '</form>';
        return formHtml;
    },

    /**
     * Create form for Storage tab
     */
    createStorageForm(record = null) {
        const name = record?.name || '';
        const title = record?.title || '';
        const description = record?.description || '';
        const storageType = record?.storage_type || 'local';
        const baseUrl = record?.base_url || '';
        const basePath = record?.base_path || '';
        const maxFileSize = record?.max_file_size || 10485760;
        const allowedExtensions = record?.allowed_extensions || '';
        const quotaLimit = record?.quota_limit || 0;
        const isActive = record?.is_active !== false;
        const isDefault = record?.is_default === true;
        const isPublic = record?.is_public !== false;

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
                        <label for="storage_type">Storage Type *</label>
                        <select class="form-control" id="storage_type" name="storage_type" required>
                            <option value="local" ${storageType === 'local' ? 'selected' : ''}>Local</option>
                            <option value="s3" ${storageType === 's3' ? 'selected' : ''}>Amazon S3</option>
                            <option value="ftp" ${storageType === 'ftp' ? 'selected' : ''}>FTP</option>
                            <option value="sftp" ${storageType === 'sftp' ? 'selected' : ''}>SFTP</option>
                            <option value="dropbox" ${storageType === 'dropbox' ? 'selected' : ''}>Dropbox</option>
                        </select>
                        <div class="invalid-feedback">Please select a storage type.</div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="max_file_size">Max File Size (bytes)</label>
                        <input type="number" class="form-control" id="max_file_size" name="max_file_size" value="${maxFileSize}" min="0">
                        <small class="form-text text-muted">0 = unlimited</small>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="base_url">Base URL</label>
                        <input type="url" class="form-control" id="base_url" name="base_url" value="${baseUrl}">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="base_path">Base Path</label>
                        <input type="text" class="form-control" id="base_path" name="base_path" value="${basePath}">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="allowed_extensions">Allowed Extensions (JSON)</label>
                <textarea class="form-control" id="allowed_extensions" name="allowed_extensions" rows="2">${allowedExtensions}</textarea>
                <small class="form-text text-muted">JSON array format: ["jpg", "png", "pdf"]</small>
            </div>
            <div class="form-group">
                <label for="quota_limit">Quota Limit (bytes)</label>
                <input type="number" class="form-control" id="quota_limit" name="quota_limit" value="${quotaLimit}" min="0">
                <small class="form-text text-muted">0 = unlimited</small>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="is_active">Status</label>
                        <select class="form-control" id="is_active" name="is_active">
                            <option value="true" ${isActive ? 'selected' : ''}>Active</option>
                            <option value="false" ${!isActive ? 'selected' : ''}>Inactive</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="is_default">Default Storage</label>
                        <select class="form-control" id="is_default" name="is_default">
                            <option value="false" ${!isDefault ? 'selected' : ''}>No</option>
                            <option value="true" ${isDefault ? 'selected' : ''}>Yes</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="is_public">Public Access</label>
                        <select class="form-control" id="is_public" name="is_public">
                            <option value="true" ${isPublic ? 'selected' : ''}>Yes</option>
                            <option value="false" ${!isPublic ? 'selected' : ''}>No</option>
                        </select>
                    </div>
                </div>
            </div>
        `;
    },

    /**
     * Create form for Folders tab
     */
    createFolderForm(record = null) {
        const parentId = record?.parent_id || '';
        const storageId = record?.storage_id || 1;
        const name = record?.name || '';
        const description = record?.description || '';
        const isPublic = record?.is_public !== false;
        const isActive = record?.is_active !== false;

        return `
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="name">Folder Name *</label>
                        <input type="text" class="form-control" id="name" name="name" value="${name}" required>
                        <div class="invalid-feedback">Please provide a valid folder name.</div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="storage_id">Storage ID *</label>
                        <input type="number" class="form-control" id="storage_id" name="storage_id" value="${storageId}" required>
                        <div class="invalid-feedback">Please provide a valid storage ID.</div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="parent_id">Parent Folder ID</label>
                <input type="number" class="form-control" id="parent_id" name="parent_id" value="${parentId}">
                <small class="form-text text-muted">Leave empty for root folder</small>
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea class="form-control" id="description" name="description" rows="3">${description}</textarea>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="is_public">Public Access</label>
                        <select class="form-control" id="is_public" name="is_public">
                            <option value="true" ${isPublic ? 'selected' : ''}>Yes</option>
                            <option value="false" ${!isPublic ? 'selected' : ''}>No</option>
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
     * Create form for Files tab
     */
    createFileForm(record = null) {
        const folderId = record?.folder_id || '';
        const storageId = record?.storage_id || 1;
        const originalName = record?.original_name || '';
        const title = record?.title || '';
        const description = record?.description || '';
        const altText = record?.alt_text || '';
        const caption = record?.caption || '';
        const seoTitle = record?.seo_title || '';
        const seoDescription = record?.seo_description || '';
        const isPublic = record?.is_public !== false;
        const isActive = record?.is_active !== false;
        const isFeatured = record?.is_featured === true;

        return `
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="original_name">File Name *</label>
                        <input type="text" class="form-control" id="original_name" name="original_name" value="${originalName}" required>
                        <div class="invalid-feedback">Please provide a valid file name.</div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="title">Title</label>
                        <input type="text" class="form-control" id="title" name="title" value="${title}">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="folder_id">Folder ID</label>
                        <input type="number" class="form-control" id="folder_id" name="folder_id" value="${folderId}">
                        <small class="form-text text-muted">Leave empty for root folder</small>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="storage_id">Storage ID *</label>
                        <input type="number" class="form-control" id="storage_id" name="storage_id" value="${storageId}" required>
                        <div class="invalid-feedback">Please provide a valid storage ID.</div>
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
                        <label for="alt_text">Alt Text</label>
                        <input type="text" class="form-control" id="alt_text" name="alt_text" value="${altText}">
                        <small class="form-text text-muted">For accessibility and SEO</small>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="caption">Caption</label>
                        <input type="text" class="form-control" id="caption" name="caption" value="${caption}">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="seo_title">SEO Title</label>
                        <input type="text" class="form-control" id="seo_title" name="seo_title" value="${seoTitle}">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="seo_description">SEO Description</label>
                        <input type="text" class="form-control" id="seo_description" name="seo_description" value="${seoDescription}">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="is_public">Public Access</label>
                        <select class="form-control" id="is_public" name="is_public">
                            <option value="true" ${isPublic ? 'selected' : ''}>Yes</option>
                            <option value="false" ${!isPublic ? 'selected' : ''}>No</option>
                        </select>
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
                <div class="col-md-4">
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
     * Create form for Transformations tab
     */
    createTransformationForm(record = null) {
        const name = record?.name || '';
        const title = record?.title || '';
        const description = record?.description || '';
        const transformationType = record?.transformation_type || 'resize';
        const config = record?.config || '{}';
        const applicableTypes = record?.applicable_types || '["image/*"]';
        const orderIndex = record?.order_index || 0;
        const isActive = record?.is_active !== false;
        const isAutomatic = record?.is_automatic === true;

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
                        <label for="transformation_type">Transformation Type *</label>
                        <select class="form-control" id="transformation_type" name="transformation_type" required>
                            <option value="resize" ${transformationType === 'resize' ? 'selected' : ''}>Resize</option>
                            <option value="crop" ${transformationType === 'crop' ? 'selected' : ''}>Crop</option>
                            <option value="watermark" ${transformationType === 'watermark' ? 'selected' : ''}>Watermark</option>
                            <option value="compress" ${transformationType === 'compress' ? 'selected' : ''}>Compress</option>
                            <option value="format" ${transformationType === 'format' ? 'selected' : ''}>Format Conversion</option>
                            <option value="filter" ${transformationType === 'filter' ? 'selected' : ''}>Filter/Effect</option>
                        </select>
                        <div class="invalid-feedback">Please select a transformation type.</div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="order_index">Order Index</label>
                        <input type="number" class="form-control" id="order_index" name="order_index" value="${orderIndex}" min="0">
                        <small class="form-text text-muted">Lower numbers appear first</small>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="config">Configuration (JSON)</label>
                <textarea class="form-control" id="config" name="config" rows="4">${config}</textarea>
                <small class="form-text text-muted">JSON configuration for the transformation</small>
            </div>
            <div class="form-group">
                <label for="applicable_types">Applicable Types (JSON)</label>
                <textarea class="form-control" id="applicable_types" name="applicable_types" rows="2">${applicableTypes}</textarea>
                <small class="form-text text-muted">JSON array of MIME types: ["image/*", "video/*"]</small>
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
                        <label for="is_automatic">Automatic</label>
                        <select class="form-control" id="is_automatic" name="is_automatic">
                            <option value="false" ${!isAutomatic ? 'selected' : ''}>No</option>
                            <option value="true" ${isAutomatic ? 'selected' : ''}>Yes</option>
                        </select>
                        <small class="form-text text-muted">Apply automatically on upload</small>
                    </div>
                </div>
            </div>
        `;
    },

    /**
     * Create form for File Transformations tab
     */
    createFileTransformationForm(record = null) {
        const originalFileId = record?.original_file_id || '';
        const transformationId = record?.transformation_id || '';
        const status = record?.status || 'pending';

        return `
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="original_file_id">Original File ID *</label>
                        <input type="number" class="form-control" id="original_file_id" name="original_file_id" value="${originalFileId}" required>
                        <div class="invalid-feedback">Please provide a valid file ID.</div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="transformation_id">Transformation ID *</label>
                        <input type="number" class="form-control" id="transformation_id" name="transformation_id" value="${transformationId}" required>
                        <div class="invalid-feedback">Please provide a valid transformation ID.</div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="status">Status</label>
                <select class="form-control" id="status" name="status">
                    <option value="pending" ${status === 'pending' ? 'selected' : ''}>Pending</option>
                    <option value="processing" ${status === 'processing' ? 'selected' : ''}>Processing</option>
                    <option value="completed" ${status === 'completed' ? 'selected' : ''}>Completed</option>
                    <option value="failed" ${status === 'failed' ? 'selected' : ''}>Failed</option>
                </select>
            </div>
            <div class="alert alert-info">
                <strong>Note:</strong> File transformations are typically created automatically when files are uploaded or when transformations are applied. Manual creation is for advanced use cases only.
            </div>
        `;
    },

    /**
     * Load media files (legacy method for compatibility)
     */
    async loadMediaFiles() {
        // Redirect to new tab system
        await this.switchTab('files');
    },

    /**
     * Load media folders
     */
    async loadMediaFolders() {
        try {
            const response = await cms.getMediaFolders();
            if (response.success) {
                this.mediaFolders = response.data;
            }
        } catch (error) {
            console.error('Error loading media folders:', error);
        }
    },

    /**
     * Bind events
     */
    bindEvents() {
        // Search functionality
        $('#mediaSearch').on('input', Utils.debounce(() => {
            this.searchQuery = $('#mediaSearch').val();
            this.currentPage = 1;
            this.loadMediaFiles();
        }, 500));

        // File selection
        $(document).on('change', '.file-checkbox', () => {
            this.updateSelectedFiles();
        });
    },

    /**
     * Render folders grid
     */
    renderFoldersGrid() {
        const currentFolders = this.mediaFolders.filter(folder => 
            folder.parent_id === this.currentFolderId
        );

        let html = '';
        
        if (currentFolders.length > 0) {
            html += '<div class="folders-container" style="display: grid; grid-template-columns: repeat(auto-fill, minmax(150px, 1fr)); gap: 15px;">';
            
            currentFolders.forEach(folder => {
                html += `
                    <div class="folder-item" style="text-align: center; cursor: pointer; padding: 15px; border: 1px solid #ddd; border-radius: 4px;"
                         onclick="Media.navigateToFolder(${folder.id})">
                        <i class="fas fa-folder fa-3x" style="color: #ffc107; margin-bottom: 10px;"></i>
                        <div class="folder-name" style="font-size: 14px; font-weight: 500;">${folder.name}</div>
                        <div class="folder-actions" style="margin-top: 10px;">
                            <button class="btn btn-danger btn-sm" onclick="event.stopPropagation(); Media.deleteFolder(${folder.id})">
                                <i class="fas fa-trash"></i>
                            </button>
                        </div>
                    </div>
                `;
            });
            
            html += '</div>';
        } else {
            html = '<p class="text-center">No folders in this location.</p>';
        }

        $('#foldersGrid').html(html);
    },

    /**
     * Render files grid
     */
    renderFilesGrid(files) {
        let html = '';
        
        if (files.length > 0) {
            html += '<div class="files-container" style="display: grid; grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 15px;">';
            
            files.forEach(file => {
                const isImage = file.mime_type && file.mime_type.startsWith('image/');
                const fileIcon = this.getFileIcon(file.mime_type);
                
                html += `
                    <div class="file-item" style="border: 1px solid #ddd; border-radius: 4px; overflow: hidden;">
                        <div class="file-preview" style="height: 150px; background: #f8f9fa; display: flex; align-items: center; justify-content: center;">
                            ${isImage ? 
                                `<img src="${file.full_path}" alt="${file.original_name}" style="max-width: 100%; max-height: 100%; object-fit: cover;">` :
                                `<i class="${fileIcon} fa-3x" style="color: #6c757d;"></i>`
                            }
                        </div>
                        
                        <div class="file-info p-10">
                            <div class="file-name" style="font-size: 14px; font-weight: 500; margin-bottom: 5px;" title="${file.original_name}">
                                ${Utils.truncate(file.original_name, 25)}
                            </div>
                            
                            <div class="file-meta" style="font-size: 12px; color: #6c757d; margin-bottom: 10px;">
                                <div>${Utils.formatFileSize(file.file_size)}</div>
                                <div>${Utils.formatDate(file.created_at, false)}</div>
                            </div>
                            
                            <div class="file-actions d-flex gap-5">
                                <button class="btn btn-primary btn-sm" onclick="Media.editFile(${file.id})" title="Edit">
                                    <i class="fas fa-edit"></i>
                                </button>
                                <button class="btn btn-info btn-sm" onclick="Media.viewFile(${file.id})" title="View">
                                    <i class="fas fa-eye"></i>
                                </button>
                                <button class="btn btn-success btn-sm" onclick="Media.copyUrl('${file.full_path}')" title="Copy URL">
                                    <i class="fas fa-link"></i>
                                </button>
                                <button class="btn btn-danger btn-sm" onclick="Media.deleteFile(${file.id})" title="Delete">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                `;
            });
            
            html += '</div>';
        } else {
            html = '<div class="text-center p-20">No files found.</div>';
        }

        $('#filesGrid').html(html);
    },

    /**
     * Get file icon based on mime type
     */
    getFileIcon(mimeType) {
        if (!mimeType) return 'fas fa-file';
        
        if (mimeType.startsWith('image/')) return 'fas fa-image';
        if (mimeType.startsWith('video/')) return 'fas fa-video';
        if (mimeType.startsWith('audio/')) return 'fas fa-music';
        if (mimeType.includes('pdf')) return 'fas fa-file-pdf';
        if (mimeType.includes('word') || mimeType.includes('document')) return 'fas fa-file-word';
        if (mimeType.includes('excel') || mimeType.includes('spreadsheet')) return 'fas fa-file-excel';
        if (mimeType.includes('powerpoint') || mimeType.includes('presentation')) return 'fas fa-file-powerpoint';
        if (mimeType.includes('zip') || mimeType.includes('archive')) return 'fas fa-file-archive';
        
        return 'fas fa-file';
    },

    /**
     * Render pagination
     */
    renderPagination(pagination) {
        if (!pagination || pagination.pages <= 1) {
            $('#filesPagination').empty();
            return;
        }

        const paginationHtml = Utils.createPagination(pagination, 'Media.goToPage');
        $('#filesPagination').html(paginationHtml);
    },

    /**
     * Navigate to folder
     */
    navigateToFolder(folderId) {
        this.currentFolderId = folderId;
        this.currentPage = 1;
        this.loadMediaFiles();
        this.updateBreadcrumb();
    },

    /**
     * Update breadcrumb navigation
     */
    updateBreadcrumb() {
        let html = '';
        
        if (this.currentFolderId) {
            const folder = this.mediaFolders.find(f => f.id === this.currentFolderId);
            if (folder) {
                html += ` <i class="fas fa-chevron-right"></i> ${folder.name}`;
            }
        }
        
        $('#folderBreadcrumb').html(html);
    },

    /**
     * Show upload modal
     */
    showUploadModal() {
        const uploadHtml = `
            <div class="upload-container">
                <div class="upload-area" id="uploadArea" style="border: 2px dashed #ddd; border-radius: 8px; padding: 40px; text-align: center; cursor: pointer;">
                    <i class="fas fa-cloud-upload-alt fa-3x" style="color: #6c757d; margin-bottom: 15px;"></i>
                    <p>Drag & drop files here or click to browse</p>
                    <input type="file" id="fileInput" multiple style="display: none;">
                </div>
                
                <div class="upload-progress mt-20" id="uploadProgress" style="display: none;">
                    <div class="progress" style="height: 20px;">
                        <div class="progress-bar" style="width: 0%; background: #007bff; transition: width 0.3s;"></div>
                    </div>
                    <div class="progress-text text-center mt-10"></div>
                </div>
                
                <div class="uploaded-files mt-20" id="uploadedFiles"></div>
            </div>
        `;

        Utils.showModal('Upload Files', uploadHtml, `
            <button type="button" class="btn btn-secondary" onclick="Utils.hideModal()">Close</button>
        `);

        this.initializeUpload();
    },

    /**
     * Initialize file upload functionality
     */
    initializeUpload() {
        const uploadArea = $('#uploadArea');
        const fileInput = $('#fileInput');

        // Click to browse
        uploadArea.on('click', () => fileInput.click());

        // File input change
        fileInput.on('change', (e) => {
            this.handleFiles(e.target.files);
        });

        // Drag & drop
        uploadArea.on('dragover', (e) => {
            e.preventDefault();
            uploadArea.css('border-color', '#007bff');
        });

        uploadArea.on('dragleave', () => {
            uploadArea.css('border-color', '#ddd');
        });

        uploadArea.on('drop', (e) => {
            e.preventDefault();
            uploadArea.css('border-color', '#ddd');
            this.handleFiles(e.originalEvent.dataTransfer.files);
        });
    },

    /**
     * Handle file uploads
     */
    async handleFiles(files) {
        const totalFiles = files.length;
        let uploadedFiles = 0;

        $('#uploadProgress').show();

        for (const file of files) {
            try {
                const response = await cms.uploadMediaFile(file, {
                    folder_id: this.currentFolderId
                });

                if (response.success) {
                    uploadedFiles++;
                    this.displayUploadedFile(response.data);
                } else {
                    throw new Error(response.message || 'Upload failed');
                }
            } catch (error) {
                console.error('Upload failed:', error);
                Utils.showError(`Failed to upload ${file.name}: ${error.message}`);
            }

            // Update progress
            const progress = (uploadedFiles / totalFiles) * 100;
            $('.progress-bar').css('width', progress + '%');
            $('.progress-text').text(`${uploadedFiles}/${totalFiles} files uploaded`);
        }

        if (uploadedFiles > 0) {
            Utils.showSuccess(`Successfully uploaded ${uploadedFiles} file(s)!`);
            setTimeout(() => {
                this.loadMediaFiles();
            }, 2000);
        }
    },

    /**
     * Display uploaded file
     */
    displayUploadedFile(file) {
        const html = `
            <div class="uploaded-file-item d-flex align-items-center p-10" style="border: 1px solid #ddd; border-radius: 4px; margin-bottom: 10px;">
                <i class="${this.getFileIcon(file.mime_type)} fa-2x" style="margin-right: 15px; color: #28a745;"></i>
                <div style="flex: 1;">
                    <div style="font-weight: 500;">${file.original_name}</div>
                    <div style="font-size: 12px; color: #6c757d;">${Utils.formatFileSize(file.file_size)}</div>
                </div>
                <i class="fas fa-check-circle" style="color: #28a745;"></i>
            </div>
        `;
        
        $('#uploadedFiles').append(html);
    },

    /**
     * Show create folder form
     */
    showCreateFolderForm() {
        const formHtml = `
            <form id="folderForm">
                <div class="form-group">
                    <label for="folderName">Folder Name *</label>
                    <input type="text" id="folderName" name="name" class="form-control" required>
                </div>
                
                <div class="form-group">
                    <label for="folderDescription">Description</label>
                    <textarea id="folderDescription" name="description" class="form-control" rows="3"></textarea>
                </div>
            </form>
        `;

        Utils.showModal('Create New Folder', formHtml, `
            <button type="button" class="btn btn-secondary" onclick="Utils.hideModal()">Cancel</button>
            <button type="button" class="btn btn-success" onclick="Media.saveFolder()">Create Folder</button>
        `);
    },

    /**
     * Save folder
     */
    async saveFolder() {
        try {
            const formData = Utils.serializeForm('#folderForm');
            formData.parent_id = this.currentFolderId;
            formData.storage_id = 1; // Default storage
            
            const currentUser = Utils.getCurrentUser();
            formData.created_by = currentUser?.id || 1;

            const validation = Utils.validateForm('#folderForm', {
                name: { required: true, label: 'Folder Name' }
            });

            if (!validation.valid) {
                Utils.showError('Validation failed: ' + validation.errors.join(', '));
                return;
            }

            const response = await cms.createMediaFolder(formData);

            if (response.success) {
                Utils.hideModal();
                Utils.showSuccess('Folder created successfully!');
                await this.loadMediaFolders();
                this.renderFoldersGrid();
            } else {
                throw new Error(response.message || 'Failed to create folder');
            }
        } catch (error) {
            Utils.showError('Error creating folder: ' + error.message);
        }
    },

    /**
     * Copy file URL to clipboard
     */
    async copyUrl(url) {
        try {
            await navigator.clipboard.writeText(url);
            Utils.showSuccess('URL copied to clipboard!');
        } catch (error) {
            // Fallback for older browsers
            const textArea = document.createElement('textarea');
            textArea.value = url;
            document.body.appendChild(textArea);
            textArea.select();
            document.execCommand('copy');
            document.body.removeChild(textArea);
            Utils.showSuccess('URL copied to clipboard!');
        }
    },

    /**
     * View file details
     */
    async viewFile(fileId) {
        try {
            const response = await cms.getMediaFile(fileId);
            
            if (response.success) {
                const file = response.data;
                const isImage = file.mime_type && file.mime_type.startsWith('image/');
                
                const detailsHtml = `
                    <div class="file-details">
                        <div class="file-preview mb-20" style="text-align: center;">
                            ${isImage ? 
                                `<img src="${file.full_path}" alt="${file.original_name}" style="max-width: 100%; max-height: 300px;">` :
                                `<i class="${this.getFileIcon(file.mime_type)} fa-5x" style="color: #6c757d;"></i>`
                            }
                        </div>
                        
                        <table class="table">
                            <tr><td><strong>Name:</strong></td><td>${file.original_name}</td></tr>
                            <tr><td><strong>Size:</strong></td><td>${Utils.formatFileSize(file.file_size)}</td></tr>
                            <tr><td><strong>Type:</strong></td><td>${file.mime_type}</td></tr>
                            <tr><td><strong>Uploaded:</strong></td><td>${Utils.formatDate(file.created_at)}</td></tr>
                            <tr><td><strong>URL:</strong></td><td><a href="${file.full_path}" target="_blank">${file.full_path}</a></td></tr>
                            ${file.image_width ? `<tr><td><strong>Dimensions:</strong></td><td>${file.image_width} x ${file.image_height}px</td></tr>` : ''}
                        </table>
                    </div>
                `;

                Utils.showModal(`File Details - ${file.original_name}`, detailsHtml);
            } else {
                throw new Error(response.message || 'Failed to load file details');
            }
        } catch (error) {
            Utils.showError('Error loading file details: ' + error.message);
        }
    },

    /**
     * Delete file
     */
    async deleteFile(fileId) {
        const file = this.mediaFiles.find(f => f.id === fileId);
        if (!file) return;

        const confirmed = await App.confirmDangerousAction(
            `Are you sure you want to delete "${file.original_name}"? This action cannot be undone.`,
            'delete'
        );

        if (!confirmed) return;

        try {
            const response = await cms.deleteMediaFile(fileId);
            
            if (response.success) {
                Utils.showSuccess('File deleted successfully!');
                this.loadMediaFiles();
            } else {
                throw new Error(response.message || 'Failed to delete file');
            }
        } catch (error) {
            Utils.showError('Error deleting file: ' + error.message);
        }
    },

    /**
     * Go to specific page
     */
    goToPage(page) {
        this.currentPage = page;
        this.loadMediaFiles();
    }
};
