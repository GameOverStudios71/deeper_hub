/**
 * Forms module
 */
window.Forms = {
    
    currentPage: 1,
    searchQuery: '',
    filterStatus: '',
    forms: [],
    fieldTypes: [],
    currentFormId: null,

    /**
     * Initialize forms module
     */
    async init() {
        try {
            await this.loadFieldTypes();
            await this.loadForms();
        } catch (error) {
            App.handleError(error, 'Forms');
        }
    },

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
