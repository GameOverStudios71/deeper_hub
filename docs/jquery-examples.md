# DeeperHub CMS - jQuery Client Examples

## Base Configuration

### API Client Setup
```javascript
class CMSClient {
    constructor(baseUrl, token = null) {
        this.baseUrl = baseUrl;
        this.token = token;
    }

    setToken(token) {
        this.token = token;
    }

    getHeaders() {
        const headers = {
            'Content-Type': 'application/json'
        };
        if (this.token) {
            headers['Authorization'] = `Bearer ${this.token}`;
        }
        return headers;
    }

    async request(method, endpoint, data = null) {
        const config = {
            method: method,
            headers: this.getHeaders()
        };

        if (data && method !== 'GET') {
            config.body = JSON.stringify(data);
        }

        const url = `${this.baseUrl}${endpoint}`;
        const response = await fetch(url, config);
        
        if (!response.ok) {
            const error = await response.json();
            throw new Error(error.message || 'Request failed');
        }

        return await response.json();
    }

    // Convenience methods
    get(endpoint) { return this.request('GET', endpoint); }
    post(endpoint, data) { return this.request('POST', endpoint, data); }
    put(endpoint, data) { return this.request('PUT', endpoint, data); }
    delete(endpoint) { return this.request('DELETE', endpoint); }
}

// Initialize client
const cms = new CMSClient('/api/cms');
```

## Authentication Examples

### Login Form
```html
<form id="loginForm" class="login-form">
    <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required 
               class="form-control" placeholder="Enter your email">
    </div>
    <div class="form-group">
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required 
               class="form-control" placeholder="Enter your password">
    </div>
    <button type="submit" class="btn btn-primary">Login</button>
    <div id="loginError" class="alert alert-danger" style="display:none;"></div>
</form>
```

```javascript
$('#loginForm').on('submit', async function(e) {
    e.preventDefault();
    
    const formData = {
        email: $('#email').val(),
        password: $('#password').val()
    };

    try {
        const response = await cms.post('/auth/login', formData);
        cms.setToken(response.data.token);
        localStorage.setItem('cms_token', response.data.token);
        window.location.href = '/admin/dashboard';
    } catch (error) {
        $('#loginError').text(error.message).show();
    }
});
```

## Pages Management

### Page List
```html
<div id="pagesList">
    <div class="d-flex justify-content-between mb-3">
        <h2>Pages</h2>
        <button id="addPageBtn" class="btn btn-success">Add New Page</button>
    </div>
    <div class="table-responsive">
        <table class="table table-striped" id="pagesTable">
            <thead>
                <tr>
                    <th>Title</th>
                    <th>URI</th>
                    <th>Type</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>
</div>
```

```javascript
async function loadPages() {
    try {
        const response = await cms.get('/pages');
        const tbody = $('#pagesTable tbody');
        tbody.empty();

        response.data.forEach(page => {
            const row = `
                <tr data-id="${page.id}">
                    <td>${page.title}</td>
                    <td>${page.uri}</td>
                    <td>${page.page_type_title || 'N/A'}</td>
                    <td>
                        <span class="badge ${page.is_active ? 'badge-success' : 'badge-secondary'}">
                            ${page.is_active ? 'Active' : 'Inactive'}
                        </span>
                        ${page.is_home ? '<span class="badge badge-primary">Home</span>' : ''}
                    </td>
                    <td>
                        <button class="btn btn-sm btn-primary edit-page" data-id="${page.id}">Edit</button>
                        <button class="btn btn-sm btn-danger delete-page" data-id="${page.id}">Delete</button>
                    </td>
                </tr>
            `;
            tbody.append(row);
        });
    } catch (error) {
        console.error('Error loading pages:', error);
    }
}
```

### Page Form
```html
<form id="pageForm" class="page-form">
    <div class="row">
        <div class="col-md-8">
            <div class="form-group">
                <label for="pageTitle">Title *</label>
                <input type="text" id="pageTitle" name="title" required 
                       class="form-control" placeholder="Page title">
            </div>
            
            <div class="form-group">
                <label for="pageUri">URI *</label>
                <input type="text" id="pageUri" name="uri" required 
                       class="form-control" placeholder="/page-url">
            </div>
            
            <div class="form-group">
                <label for="pageDescription">Description</label>
                <textarea id="pageDescription" name="description" 
                          class="form-control" rows="3"></textarea>
            </div>
        </div>
        
        <div class="col-md-4">
            <div class="form-group">
                <label for="pageType">Page Type *</label>
                <select id="pageType" name="page_type_id" required class="form-control">
                    <option value="">Select type...</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="pageLayout">Layout *</label>
                <select id="pageLayout" name="layout_id" required class="form-control">
                    <option value="">Select layout...</option>
                </select>
            </div>
            
            <div class="form-check">
                <input type="checkbox" id="pageActive" name="is_active" 
                       class="form-check-input" checked>
                <label class="form-check-label" for="pageActive">Active</label>
            </div>
            
            <div class="form-check">
                <input type="checkbox" id="pageHome" name="is_home" 
                       class="form-check-input">
                <label class="form-check-label" for="pageHome">Home Page</label>
            </div>
        </div>
    </div>
    
    <!-- SEO Section -->
    <div class="card mt-3">
        <div class="card-header">SEO Settings</div>
        <div class="card-body">
            <div class="form-group">
                <label for="metaTitle">Meta Title</label>
                <input type="text" id="metaTitle" name="meta_title" 
                       class="form-control" maxlength="255">
            </div>
            
            <div class="form-group">
                <label for="metaDescription">Meta Description</label>
                <textarea id="metaDescription" name="meta_description" 
                          class="form-control" rows="2" maxlength="500"></textarea>
            </div>
            
            <div class="form-group">
                <label for="metaKeywords">Meta Keywords</label>
                <input type="text" id="metaKeywords" name="meta_keywords" 
                       class="form-control" placeholder="keyword1, keyword2, keyword3">
            </div>
        </div>
    </div>
    
    <div class="form-actions mt-3">
        <button type="submit" class="btn btn-primary">Save Page</button>
        <button type="button" class="btn btn-secondary" onclick="history.back()">Cancel</button>
    </div>
</form>
```

```javascript
// Initialize page form
async function initPageForm(pageId = null) {
    // Load page types and layouts
    await loadPageTypes();
    await loadPageLayouts();
    
    if (pageId) {
        // Edit mode - load existing page
        const response = await cms.get(`/pages/${pageId}`);
        populateForm('#pageForm', response.data);
    }
}

async function loadPageTypes() {
    try {
        const response = await cms.get('/pages/types');
        const select = $('#pageType');
        select.empty().append('<option value="">Select type...</option>');
        
        response.data.forEach(type => {
            select.append(`<option value="${type.id}">${type.title}</option>`);
        });
    } catch (error) {
        console.error('Error loading page types:', error);
    }
}

$('#pageForm').on('submit', async function(e) {
    e.preventDefault();
    
    const formData = $(this).serializeObject();
    formData.is_active = $('#pageActive').is(':checked');
    formData.is_home = $('#pageHome').is(':checked');
    formData.created_by = getCurrentUserId();
    
    try {
        const pageId = $(this).data('page-id');
        let response;
        
        if (pageId) {
            response = await cms.put(`/pages/${pageId}`, formData);
        } else {
            response = await cms.post('/pages', formData);
        }
        
        showSuccess('Page saved successfully!');
        window.location.href = '/admin/pages';
    } catch (error) {
        showError(error.message);
    }
});
```

## Forms Management

### Dynamic Form Builder
```html
<div id="formBuilder">
    <div class="form-header">
        <input type="text" id="formTitle" placeholder="Form Title" class="form-control">
        <input type="text" id="formName" placeholder="form_name" class="form-control">
    </div>
    
    <div class="form-fields" id="formFields">
        <!-- Dynamic fields will be added here -->
    </div>
    
    <div class="field-types">
        <h4>Add Field:</h4>
        <div class="btn-group" role="group">
            <button type="button" class="btn btn-outline-primary add-field" data-type="text">Text</button>
            <button type="button" class="btn btn-outline-primary add-field" data-type="email">Email</button>
            <button type="button" class="btn btn-outline-primary add-field" data-type="textarea">Textarea</button>
            <button type="button" class="btn btn-outline-primary add-field" data-type="select">Select</button>
            <button type="button" class="btn btn-outline-primary add-field" data-type="checkbox">Checkbox</button>
        </div>
    </div>
    
    <button id="saveForm" class="btn btn-success mt-3">Save Form</button>
</div>
```

```javascript
class FormBuilder {
    constructor() {
        this.fields = [];
        this.fieldCounter = 0;
        this.init();
    }

    init() {
        $('.add-field').on('click', (e) => {
            const fieldType = $(e.target).data('type');
            this.addField(fieldType);
        });

        $('#saveForm').on('click', () => {
            this.saveForm();
        });
    }

    addField(type) {
        const fieldId = `field_${++this.fieldCounter}`;
        const field = {
            id: fieldId,
            type: type,
            name: `field_${this.fieldCounter}`,
            title: `Field ${this.fieldCounter}`,
            required: false,
            options: {}
        };

        this.fields.push(field);
        this.renderField(field);
    }

    renderField(field) {
        const fieldHtml = `
            <div class="field-editor" data-field-id="${field.id}">
                <div class="field-header">
                    <input type="text" class="field-title" value="${field.title}" 
                           placeholder="Field Title">
                    <input type="text" class="field-name" value="${field.name}" 
                           placeholder="field_name">
                    <button class="btn btn-sm btn-danger remove-field">Remove</button>
                </div>
                
                <div class="field-settings">
                    <label>
                        <input type="checkbox" class="field-required" ${field.required ? 'checked' : ''}>
                        Required
                    </label>
                    
                    ${this.getFieldTypeSettings(field.type)}
                </div>
                
                <div class="field-preview">
                    ${this.getFieldPreview(field)}
                </div>
            </div>
        `;

        $('#formFields').append(fieldHtml);
        this.bindFieldEvents(field.id);
    }

    getFieldTypeSettings(type) {
        switch (type) {
            case 'select':
                return `
                    <div class="form-group">
                        <label>Options (one per line):</label>
                        <textarea class="field-options" rows="3" placeholder="Option 1\nOption 2\nOption 3"></textarea>
                    </div>
                `;
            case 'text':
            case 'email':
                return `
                    <div class="form-group">
                        <label>Placeholder:</label>
                        <input type="text" class="field-placeholder" placeholder="Enter placeholder text">
                    </div>
                `;
            default:
                return '';
        }
    }

    async saveForm() {
        const formData = {
            name: $('#formName').val(),
            title: $('#formTitle').val(),
            created_by: getCurrentUserId(),
            fields: this.fields
        };

        try {
            const response = await cms.post('/forms', formData);
            showSuccess('Form created successfully!');
            
            // Save fields
            for (const field of this.fields) {
                await cms.post(`/forms/${response.data.id}/fields`, {
                    ...field,
                    form_id: response.data.id
                });
            }
            
            window.location.href = '/admin/forms';
        } catch (error) {
            showError(error.message);
        }
    }
}

// Initialize form builder
const formBuilder = new FormBuilder();
```

## Media Management

### File Upload with Preview
```html
<div id="mediaUpload">
    <div class="upload-area" id="uploadArea">
        <div class="upload-content">
            <i class="fas fa-cloud-upload-alt fa-3x"></i>
            <p>Drag & drop files here or click to browse</p>
            <input type="file" id="fileInput" multiple accept="image/*,video/*,audio/*,.pdf,.doc,.docx">
        </div>
    </div>

    <div class="upload-progress" id="uploadProgress" style="display:none;">
        <div class="progress">
            <div class="progress-bar" role="progressbar" style="width: 0%"></div>
        </div>
    </div>

    <div class="uploaded-files" id="uploadedFiles"></div>
</div>
```

```javascript
class MediaUploader {
    constructor() {
        this.init();
    }

    init() {
        const uploadArea = $('#uploadArea');
        const fileInput = $('#fileInput');

        // Click to browse
        uploadArea.on('click', () => fileInput.click());

        // Drag & drop
        uploadArea.on('dragover', (e) => {
            e.preventDefault();
            uploadArea.addClass('drag-over');
        });

        uploadArea.on('dragleave', () => {
            uploadArea.removeClass('drag-over');
        });

        uploadArea.on('drop', (e) => {
            e.preventDefault();
            uploadArea.removeClass('drag-over');
            const files = e.originalEvent.dataTransfer.files;
            this.handleFiles(files);
        });

        fileInput.on('change', (e) => {
            this.handleFiles(e.target.files);
        });
    }

    async handleFiles(files) {
        for (const file of files) {
            await this.uploadFile(file);
        }
    }

    async uploadFile(file) {
        const formData = new FormData();
        formData.append('file', file);
        formData.append('folder_id', getCurrentFolderId());

        try {
            $('#uploadProgress').show();

            const response = await fetch('/api/cms/media/upload', {
                method: 'POST',
                headers: {
                    'Authorization': `Bearer ${cms.token}`
                },
                body: formData
            });

            if (!response.ok) throw new Error('Upload failed');

            const result = await response.json();
            this.displayUploadedFile(result.data);

        } catch (error) {
            showError(`Failed to upload ${file.name}: ${error.message}`);
        } finally {
            $('#uploadProgress').hide();
        }
    }

    displayUploadedFile(file) {
        const fileHtml = `
            <div class="uploaded-file" data-file-id="${file.id}">
                <div class="file-preview">
                    ${this.getFilePreview(file)}
                </div>
                <div class="file-info">
                    <h5>${file.original_name}</h5>
                    <p>Size: ${this.formatFileSize(file.file_size)}</p>
                    <p>Type: ${file.mime_type}</p>
                </div>
                <div class="file-actions">
                    <button class="btn btn-sm btn-primary edit-file" data-id="${file.id}">Edit</button>
                    <button class="btn btn-sm btn-danger delete-file" data-id="${file.id}">Delete</button>
                </div>
            </div>
        `;

        $('#uploadedFiles').append(fileHtml);
    }

    getFilePreview(file) {
        if (file.mime_type.startsWith('image/')) {
            return `<img src="${file.full_path}" alt="${file.original_name}" class="img-thumbnail">`;
        } else if (file.mime_type.startsWith('video/')) {
            return `<video controls class="video-thumbnail"><source src="${file.full_path}"></video>`;
        } else {
            return `<i class="fas fa-file fa-3x"></i>`;
        }
    }

    formatFileSize(bytes) {
        if (bytes === 0) return '0 Bytes';
        const k = 1024;
        const sizes = ['Bytes', 'KB', 'MB', 'GB'];
        const i = Math.floor(Math.log(bytes) / Math.log(k));
        return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + ' ' + sizes[i];
    }
}

const mediaUploader = new MediaUploader();
```

## Utility Functions

### Common Helper Functions
```javascript
// Serialize form to object
$.fn.serializeObject = function() {
    const o = {};
    const a = this.serializeArray();
    $.each(a, function() {
        if (o[this.name]) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};

// Populate form from object
function populateForm(formSelector, data) {
    const form = $(formSelector);

    Object.keys(data).forEach(key => {
        const field = form.find(`[name="${key}"]`);
        const value = data[key];

        if (field.length) {
            if (field.is(':checkbox')) {
                field.prop('checked', !!value);
            } else if (field.is(':radio')) {
                field.filter(`[value="${value}"]`).prop('checked', true);
            } else {
                field.val(value);
            }
        }
    });
}

// Show success message
function showSuccess(message) {
    const alert = `
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            ${message}
            <button type="button" class="close" data-dismiss="alert">
                <span>&times;</span>
            </button>
        </div>
    `;
    $('#alerts').html(alert);
    setTimeout(() => $('.alert').fadeOut(), 5000);
}

// Show error message
function showError(message) {
    const alert = `
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            ${message}
            <button type="button" class="close" data-dismiss="alert">
                <span>&times;</span>
            </button>
        </div>
    `;
    $('#alerts').html(alert);
}

// Get current user ID from token or session
function getCurrentUserId() {
    // Implement based on your auth system
    return localStorage.getItem('current_user_id') || 1;
}

// Format date for display
function formatDate(dateString) {
    if (!dateString) return 'N/A';
    const date = new Date(dateString);
    return date.toLocaleDateString() + ' ' + date.toLocaleTimeString();
}

// Confirm delete action
function confirmDelete(message = 'Are you sure you want to delete this item?') {
    return confirm(message);
}

// Initialize tooltips and other UI components
$(document).ready(function() {
    // Initialize Bootstrap tooltips
    $('[data-toggle="tooltip"]').tooltip();

    // Initialize Bootstrap popovers
    $('[data-toggle="popover"]').popover();

    // Auto-hide alerts after 5 seconds
    setTimeout(() => {
        $('.alert').fadeOut();
    }, 5000);
});
```

## CSS Classes for Styling

### Recommended CSS Structure
```css
/* Form Styling */
.form-group {
    margin-bottom: 1rem;
}

.form-control {
    border-radius: 4px;
    border: 1px solid #ddd;
    padding: 8px 12px;
}

.form-control:focus {
    border-color: #007bff;
    box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
}

/* Upload Area */
.upload-area {
    border: 2px dashed #ddd;
    border-radius: 8px;
    padding: 40px;
    text-align: center;
    cursor: pointer;
    transition: all 0.3s ease;
}

.upload-area:hover,
.upload-area.drag-over {
    border-color: #007bff;
    background-color: #f8f9fa;
}

/* File Preview */
.uploaded-file {
    display: flex;
    align-items: center;
    padding: 15px;
    border: 1px solid #ddd;
    border-radius: 4px;
    margin-bottom: 10px;
}

.file-preview img,
.file-preview video {
    max-width: 100px;
    max-height: 100px;
    margin-right: 15px;
}

/* Status Badges */
.badge-success { background-color: #28a745; }
.badge-danger { background-color: #dc3545; }
.badge-warning { background-color: #ffc107; }
.badge-info { background-color: #17a2b8; }
.badge-primary { background-color: #007bff; }
.badge-secondary { background-color: #6c757d; }

/* Responsive Tables */
.table-responsive {
    overflow-x: auto;
}

@media (max-width: 768px) {
    .table-responsive table {
        font-size: 0.875rem;
    }
}
```
```
