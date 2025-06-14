/**
 * Media module
 */
window.Media = {
    
    currentPage: 1,
    searchQuery: '',
    currentFolderId: null,
    mediaFiles: [],
    mediaFolders: [],
    selectedFiles: [],

    /**
     * Initialize media module
     */
    async init() {
        try {
            await this.loadMediaFolders();
            await this.loadMediaFiles();
        } catch (error) {
            App.handleError(error, 'Media');
        }
    },

    /**
     * Load media files
     */
    async loadMediaFiles() {
        const params = {
            page: this.currentPage,
            limit: 24,
            sort: 'created_at',
            order: 'desc'
        };

        if (this.searchQuery) {
            params.search = this.searchQuery;
        }

        if (this.currentFolderId) {
            params.folder_id = this.currentFolderId;
        }

        const html = `
            ${App.createModuleHeader('Media Library', [
                {
                    text: 'Upload Files',
                    icon: 'fas fa-upload',
                    class: 'btn-success',
                    onclick: 'Media.showUploadModal()'
                },
                {
                    text: 'New Folder',
                    icon: 'fas fa-folder-plus',
                    class: 'btn-primary',
                    onclick: 'Media.showCreateFolderForm()'
                }
            ])}
            
            <div class="media-content">
                <!-- Folder Navigation -->
                <div class="folder-nav p-20" style="background: #f8f9fa; border-bottom: 1px solid #dee2e6;">
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="breadcrumb-nav">
                            <button class="btn btn-ghost btn-sm" onclick="Media.navigateToFolder(null)">
                                <i class="fas fa-home"></i> Root
                            </button>
                            <span id="folderBreadcrumb"></span>
                        </div>
                        
                        <div class="search-box">
                            <input type="text" id="mediaSearch" class="form-control" placeholder="Search files..." 
                                   style="width: 300px;">
                        </div>
                    </div>
                </div>
                
                <!-- Folders Grid -->
                <div id="foldersGrid" class="folders-grid p-20" style="border-bottom: 1px solid #dee2e6;">
                    <div class="text-center">
                        <i class="fas fa-spinner fa-spin"></i> Loading folders...
                    </div>
                </div>
                
                <!-- Files Grid -->
                <div class="files-section p-20">
                    <div class="d-flex justify-content-between align-items-center mb-20">
                        <h4>Files</h4>
                        <div class="view-controls">
                            <button class="btn btn-ghost btn-sm" onclick="Media.toggleView('grid')" id="gridViewBtn">
                                <i class="fas fa-th"></i>
                            </button>
                            <button class="btn btn-ghost btn-sm" onclick="Media.toggleView('list')" id="listViewBtn">
                                <i class="fas fa-list"></i>
                            </button>
                        </div>
                    </div>
                    
                    <div id="filesGrid" class="files-grid">
                        <div class="text-center p-20">
                            <i class="fas fa-spinner fa-spin"></i> Loading files...
                        </div>
                    </div>
                    
                    <div id="filesPagination" class="mt-20"></div>
                </div>
            </div>
        `;

        App.showModuleContent(html);
        this.bindEvents();

        try {
            const response = await cms.getMediaFiles(params);
            
            if (response.success) {
                this.mediaFiles = response.data;
                this.renderFoldersGrid();
                this.renderFilesGrid(response.data);
                this.renderPagination(response.pagination);
            } else {
                throw new Error(response.message || 'Failed to load media files');
            }
        } catch (error) {
            $('#filesGrid').html('<div class="text-center p-20">Error loading files: ' + error.message + '</div>');
        }
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
