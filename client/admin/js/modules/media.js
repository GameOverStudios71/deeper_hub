/**
 * Media Module
 * Handles all media/file management functionality
 */

const MediaModule = {
    
    /**
     * Load media section
     */
    async load(panel) {
        try {
            const response = await API.media.list();
            const media = response.data || [];

            const html = `
                <div class="tui-window full-width">
                    <fieldset class="tui-fieldset">
                        <legend class="center">MEDIA MANAGEMENT</legend>
                        <div style="padding: 20px;">
                            <div style="margin-bottom: 20px;">
                                <button class="admin-button primary" onclick="MediaModule.uploadFile()">
                                    📤 Upload File
                                </button>
                                <button class="admin-button secondary" onclick="MediaModule.refresh()">
                                    ↻ Refresh
                                </button>
                                <button class="admin-button warning" onclick="MediaModule.createFolder()">
                                    📁 New Folder
                                </button>
                                <button class="admin-button success" onclick="MediaModule.toggleView()">
                                    🔄 Toggle View
                                </button>
                            </div>

                            ${Components.createSearchBox('Search media...', 'MediaModule.search')}

                            <div id="media-view-container">
                                ${media.length > 0 ?
                                    this.createMediaGrid(media) :
                                    Components.createEmptyState('No media files found', 'Upload File', 'MediaModule.uploadFile()')
                                }
                            </div>
                        </div>
                    </fieldset>
                </div>
            `;

            panel.innerHTML = html;
            
        } catch (error) {
            console.error('Failed to load media:', error);
            panel.innerHTML = Components.createError('Failed to load media', error.message);
        }
    },

    /**
     * Create media grid view
     */
    createMediaGrid(media) {
        const gridItems = media.map(item => this.createMediaItem(item)).join('');
        
        return `
            <div class="media-grid" style="display: grid; grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 15px; margin-top: 20px;">
                ${gridItems}
            </div>
        `;
    },

    /**
     * Create individual media item
     */
    createMediaItem(item) {
        const isImage = this.isImageFile(item.filename);
        const fileIcon = this.getFileIcon(item.filename);
        const fileSize = Utils.formatFileSize(item.size || 0);
        
        return `
            <div class="media-item" style="border: 1px solid rgb(168, 168, 168); padding: 10px; text-align: center; background: rgb(0, 0, 100);">
                <div class="media-preview" style="height: 120px; display: flex; align-items: center; justify-content: center; margin-bottom: 10px; background: rgb(0, 0, 50);">
                    ${isImage ? 
                        `<img src="${item.url}" alt="${Utils.escapeHtml(item.filename)}" style="max-width: 100%; max-height: 100%; object-fit: contain;">` :
                        `<div style="font-size: 48px;">${fileIcon}</div>`
                    }
                </div>
                
                <div class="media-info">
                    <div class="media-filename white-168-text" style="font-size: 12px; margin-bottom: 5px; word-break: break-all;">
                        ${Utils.escapeHtml(item.filename)}
                    </div>
                    <div class="media-size secondary-text" style="font-size: 10px; margin-bottom: 10px;">
                        ${fileSize}
                    </div>
                    
                    <div class="media-actions">
                        <button class="admin-button primary" style="font-size: 10px; padding: 2px 6px;" onclick="MediaModule.viewFile(${item.id})">
                            View
                        </button>
                        <button class="admin-button secondary" style="font-size: 10px; padding: 2px 6px;" onclick="MediaModule.copyUrl('${item.url}')">
                            Copy URL
                        </button>
                        <button class="admin-button danger" style="font-size: 10px; padding: 2px 6px;" onclick="MediaModule.delete(${item.id})">
                            Delete
                        </button>
                    </div>
                </div>
            </div>
        `;
    },

    /**
     * Check if file is an image
     */
    isImageFile(filename) {
        const imageExtensions = ['.jpg', '.jpeg', '.png', '.gif', '.bmp', '.webp', '.svg'];
        const ext = filename.toLowerCase().substring(filename.lastIndexOf('.'));
        return imageExtensions.includes(ext);
    },

    /**
     * Get file icon based on extension
     */
    getFileIcon(filename) {
        const ext = filename.toLowerCase().substring(filename.lastIndexOf('.'));
        
        const icons = {
            '.pdf': '📄',
            '.doc': '📝', '.docx': '📝',
            '.xls': '📊', '.xlsx': '📊',
            '.ppt': '📽️', '.pptx': '📽️',
            '.zip': '🗜️', '.rar': '🗜️', '.7z': '🗜️',
            '.mp3': '🎵', '.wav': '🎵', '.ogg': '🎵',
            '.mp4': '🎬', '.avi': '🎬', '.mov': '🎬',
            '.txt': '📄',
            '.html': '🌐', '.htm': '🌐',
            '.css': '🎨',
            '.js': '⚙️',
            '.json': '📋'
        };
        
        return icons[ext] || '📄';
    },

    /**
     * Upload file
     */
    uploadFile() {
        const uploadHtml = `
            <div style="padding: 20px;">
                <div class="upload-area" style="border: 2px dashed rgb(168, 168, 168); padding: 40px; text-align: center; margin-bottom: 20px;">
                    <div style="font-size: 48px; margin-bottom: 10px;">📤</div>
                    <p class="white-168-text">Drag and drop files here or click to select</p>
                    <input type="file" id="file-input" multiple style="display: none;" onchange="MediaModule.handleFileSelect(this)">
                    <button class="admin-button primary" onclick="document.getElementById('file-input').click()">
                        Select Files
                    </button>
                </div>
                
                <div id="upload-progress" style="display: none;">
                    <div class="white-168-text" style="margin-bottom: 10px;">Uploading files...</div>
                    <div style="background: rgb(0, 0, 50); border: 1px solid rgb(168, 168, 168); height: 20px;">
                        <div id="progress-bar" style="background: rgb(0, 255, 0); height: 100%; width: 0%; transition: width 0.3s;"></div>
                    </div>
                </div>
                
                <div id="upload-results"></div>
            </div>
        `;
        
        Components.createModal('Upload Files', uploadHtml, [
            { text: 'Close', onclick: 'Components.closeModal()' }
        ]);

        // Setup drag and drop
        setTimeout(() => {
            const uploadArea = document.querySelector('.upload-area');
            if (uploadArea) {
                uploadArea.addEventListener('dragover', (e) => {
                    e.preventDefault();
                    uploadArea.style.borderColor = 'rgb(0, 255, 255)';
                });
                
                uploadArea.addEventListener('dragleave', (e) => {
                    e.preventDefault();
                    uploadArea.style.borderColor = 'rgb(168, 168, 168)';
                });
                
                uploadArea.addEventListener('drop', (e) => {
                    e.preventDefault();
                    uploadArea.style.borderColor = 'rgb(168, 168, 168)';
                    this.handleFileSelect({ files: e.dataTransfer.files });
                });
            }
        }, 100);
    },

    /**
     * Handle file selection
     */
    async handleFileSelect(input) {
        const files = Array.from(input.files);
        if (files.length === 0) return;

        const progressContainer = document.getElementById('upload-progress');
        const progressBar = document.getElementById('progress-bar');
        const resultsContainer = document.getElementById('upload-results');
        
        progressContainer.style.display = 'block';
        resultsContainer.innerHTML = '';

        let uploaded = 0;
        const results = [];

        for (let i = 0; i < files.length; i++) {
            const file = files[i];
            
            try {
                // Update progress
                const progress = Math.round(((i + 1) / files.length) * 100);
                progressBar.style.width = progress + '%';
                
                // Simulate upload (replace with actual API call)
                await this.uploadSingleFile(file);
                
                results.push(`✅ ${file.name} - Uploaded successfully`);
                uploaded++;
                
            } catch (error) {
                results.push(`❌ ${file.name} - Error: ${error.message}`);
            }
        }

        // Show results
        resultsContainer.innerHTML = `
            <div style="margin-top: 20px;">
                <h5 class="white-168-text">Upload Results</h5>
                <div style="background: rgb(0, 0, 50); padding: 10px; border: 1px solid rgb(168, 168, 168);">
                    ${results.map(result => `<div style="margin: 5px 0;">${result}</div>`).join('')}
                </div>
                <div style="margin-top: 10px;">
                    <strong class="green-168-text">${uploaded} of ${files.length} files uploaded successfully</strong>
                </div>
            </div>
        `;

        if (uploaded > 0) {
            AdminApp.showNotification(`${uploaded} files uploaded successfully!`, 'success');
        }
    },

    /**
     * Upload single file (mock implementation)
     */
    async uploadSingleFile(file) {
        // Simulate upload delay
        await new Promise(resolve => setTimeout(resolve, 500 + Math.random() * 1000));
        
        // Simulate occasional errors
        if (Math.random() < 0.1) {
            throw new Error('Upload failed');
        }
        
        // In real implementation, use API.media.upload(file)
        return { success: true, url: `/uploads/${file.name}` };
    },

    /**
     * View file details
     */
    async viewFile(id) {
        try {
            const response = await API.media.get(id);
            const file = response.data;

            const isImage = this.isImageFile(file.filename);
            
            const detailsHtml = `
                <div style="padding: 20px;">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="file-preview" style="text-align: center; margin-bottom: 20px;">
                                ${isImage ? 
                                    `<img src="${file.url}" alt="${Utils.escapeHtml(file.filename)}" style="max-width: 100%; max-height: 300px; border: 1px solid rgb(168, 168, 168);">` :
                                    `<div style="font-size: 96px; padding: 40px;">${this.getFileIcon(file.filename)}</div>`
                                }
                            </div>
                        </div>
                        
                        <div class="col-md-6">
                            <h4 class="white-168-text">File Details</h4>
                            
                            <div style="margin: 10px 0;">
                                <strong>Filename:</strong><br>
                                <code>${Utils.escapeHtml(file.filename)}</code>
                            </div>
                            
                            <div style="margin: 10px 0;">
                                <strong>Size:</strong><br>
                                ${Utils.formatFileSize(file.size || 0)}
                            </div>
                            
                            <div style="margin: 10px 0;">
                                <strong>Type:</strong><br>
                                ${file.mime_type || 'Unknown'}
                            </div>
                            
                            <div style="margin: 10px 0;">
                                <strong>Uploaded:</strong><br>
                                ${Utils.formatDate(file.created_at)}
                            </div>
                            
                            <div style="margin: 10px 0;">
                                <strong>URL:</strong><br>
                                <input type="text" value="${file.url}" readonly style="width: 100%; font-size: 11px;">
                            </div>
                            
                            <div style="margin-top: 20px;">
                                <button class="admin-button primary" onclick="MediaModule.copyUrl('${file.url}')">
                                    📋 Copy URL
                                </button>
                                <button class="admin-button secondary" onclick="window.open('${file.url}', '_blank')">
                                    🔗 Open File
                                </button>
                                <button class="admin-button danger" onclick="MediaModule.delete(${file.id})">
                                    🗑️ Delete
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            `;
            
            Components.createModal('File Details', detailsHtml, [
                { text: 'Close', onclick: 'Components.closeModal()' }
            ]);
            
        } catch (error) {
            AdminApp.showNotification('Error loading file details: ' + error.message, 'error');
        }
    },

    /**
     * Copy file URL to clipboard
     */
    async copyUrl(url) {
        try {
            await navigator.clipboard.writeText(url);
            AdminApp.showNotification('URL copied to clipboard!', 'success');
        } catch (error) {
            // Fallback for older browsers
            const textArea = document.createElement('textarea');
            textArea.value = url;
            document.body.appendChild(textArea);
            textArea.select();
            document.execCommand('copy');
            document.body.removeChild(textArea);
            AdminApp.showNotification('URL copied to clipboard!', 'success');
        }
    },

    /**
     * Create new folder
     */
    createFolder() {
        const folderHtml = `
            <div style="padding: 20px;">
                <div class="admin-form-group">
                    <label>Folder Name</label>
                    <input type="text" id="folder-name" placeholder="New Folder" required>
                </div>
                <div class="admin-form-group">
                    <label>Parent Folder</label>
                    <select id="parent-folder">
                        <option value="">Root Directory</option>
                        <option value="images">Images</option>
                        <option value="documents">Documents</option>
                        <option value="videos">Videos</option>
                    </select>
                </div>
            </div>
        `;
        
        Components.createModal('Create Folder', folderHtml, [
            { text: 'Cancel', onclick: 'Components.closeModal()' },
            { text: 'Create', class: 'primary', onclick: 'MediaModule.saveFolder()' }
        ]);
    },

    /**
     * Save new folder
     */
    saveFolder() {
        const folderName = document.getElementById('folder-name').value;
        const parentFolder = document.getElementById('parent-folder').value;
        
        if (!folderName) {
            AdminApp.showNotification('Folder name is required', 'error');
            return;
        }
        
        // Mock folder creation
        AdminApp.showNotification(`Folder "${folderName}" created successfully!`, 'success');
        Components.closeModal();
        this.refresh();
    },

    /**
     * Toggle between grid and list view
     */
    toggleView() {
        AdminApp.showNotification('View toggle - Coming soon!', 'info');
        // TODO: Implement list view
    },

    /**
     * Delete media file
     */
    delete(id) {
        Components.confirm(
            'Are you sure you want to delete this file? This action cannot be undone.',
            'Delete File',
            async () => {
                try {
                    await API.media.delete(id);
                    AdminApp.showNotification('File deleted successfully!', 'success');
                    this.refresh();
                } catch (error) {
                    AdminApp.showNotification('Error deleting file: ' + error.message, 'error');
                }
            }
        );
    },

    /**
     * Search media files
     */
    async search(query) {
        try {
            const response = await API.media.list({ search: query });
            const media = response.data || [];
            
            const container = document.getElementById('media-view-container');
            if (container) {
                container.innerHTML = media.length > 0 ?
                    this.createMediaGrid(media) :
                    Components.createEmptyState(`No media found for "${query}"`, 'Upload File', 'MediaModule.uploadFile()');
            }
        } catch (error) {
            AdminApp.showNotification('Error searching media: ' + error.message, 'error');
        }
    },

    /**
     * Refresh media list
     */
    refresh() {
        const panel = document.getElementById('panel-media');
        if (panel) {
            this.load(panel);
        }
    }
};

// Expose to global scope
window.MediaModule = MediaModule;
