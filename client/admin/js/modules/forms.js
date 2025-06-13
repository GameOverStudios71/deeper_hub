/**
 * Forms Module
 * Handles all forms-related functionality
 */

const FormsModule = {
    
    /**
     * Load forms section
     */
    async load(panel) {
        try {
            const response = await API.forms.list();
            const forms = response.data || [];

            const columns = [
                { key: 'id', title: 'ID', type: 'number' },
                { key: 'name', title: 'Name' },
                { key: 'title', title: 'Title' },
                { key: 'description', title: 'Description', formatter: (value) => Utils.truncate(value, 50) },
                { key: 'is_active', title: 'Active', type: 'boolean' },
                { key: 'submissions_count', title: 'Submissions', type: 'number' },
                { key: 'created_at', title: 'Created', type: 'date' },
                {
                    key: 'actions',
                    title: 'Actions',
                    type: 'actions',
                    actions: [
                        { text: 'Edit', class: 'primary', onclick: 'FormsModule.edit' },
                        { text: 'Fields', class: 'secondary', onclick: 'FormsModule.manageFields' },
                        { text: 'Submissions', class: 'warning', onclick: 'FormsModule.viewSubmissions' },
                        { text: 'Delete', class: 'danger', onclick: 'FormsModule.delete' }
                    ]
                }
            ];

            const html = `
                <div class="tui-window full-width">
                    <fieldset class="tui-fieldset">
                        <legend class="center">FORMS MANAGEMENT</legend>
                        <div style="padding: 20px;">
                            <div style="margin-bottom: 20px;">
                                <button class="admin-button primary" onclick="FormsModule.create()">
                                    + New Form
                                </button>
                                <button class="admin-button secondary" onclick="FormsModule.refresh()">
                                    ↻ Refresh
                                </button>
                                <button class="admin-button success" onclick="FormsModule.exportForms()">
                                    📤 Export Forms
                                </button>
                                <button class="admin-button warning" onclick="FormsModule.viewAllSubmissions()">
                                    📋 All Submissions
                                </button>
                            </div>

                            ${Components.createSearchBox('Search forms...', 'FormsModule.search')}

                            ${forms.length > 0 ?
                                Components.createTable(forms, columns) :
                                Components.createEmptyState('No forms found', 'Create Form', 'FormsModule.create()')
                            }
                        </div>
                    </fieldset>
                </div>
            `;

            panel.innerHTML = html;
            
        } catch (error) {
            console.error('Failed to load forms:', error);
            panel.innerHTML = Components.createError('Failed to load forms', error.message);
        }
    },

    /**
     * Create new form
     */
    create() {
        const fields = [
            { name: 'name', label: 'Name', type: 'text', required: true, placeholder: 'contact_form' },
            { name: 'title', label: 'Title', type: 'text', required: true, placeholder: 'Contact Form' },
            { name: 'description', label: 'Description', type: 'textarea', rows: 3, placeholder: 'Form description...' },
            { name: 'submit_text', label: 'Submit Button Text', type: 'text', default: 'Submit', placeholder: 'Submit' },
            { name: 'success_message', label: 'Success Message', type: 'textarea', rows: 2, default: 'Thank you for your submission!', placeholder: 'Thank you message...' },
            { name: 'redirect_url', label: 'Redirect URL (optional)', type: 'text', placeholder: '/thank-you' },
            { name: 'email_to', label: 'Send Email To', type: 'email', placeholder: 'admin@example.com' },
            { name: 'email_subject', label: 'Email Subject', type: 'text', placeholder: 'New form submission' },
            { name: 'is_active', label: 'Active', type: 'checkbox', default: true },
            { name: 'allow_multiple', label: 'Allow Multiple Submissions', type: 'checkbox', default: true },
            { name: 'require_login', label: 'Require Login', type: 'checkbox' }
        ];

        const formHtml = Components.createForm(fields);
        
        Components.createModal('Create New Form', formHtml, [
            { text: 'Cancel', onclick: 'Components.closeModal()' },
            { text: 'Create', class: 'primary', onclick: 'FormsModule.save()' }
        ]);
    },

    /**
     * Edit existing form
     */
    async edit(id) {
        try {
            const response = await API.forms.get(id);
            const form = response.data;

            const fields = [
                { name: 'id', type: 'hidden', default: form.id },
                { name: 'name', label: 'Name', type: 'text', required: true, default: form.name },
                { name: 'title', label: 'Title', type: 'text', required: true, default: form.title },
                { name: 'description', label: 'Description', type: 'textarea', rows: 3, default: form.description },
                { name: 'submit_text', label: 'Submit Button Text', type: 'text', default: form.submit_text },
                { name: 'success_message', label: 'Success Message', type: 'textarea', rows: 2, default: form.success_message },
                { name: 'redirect_url', label: 'Redirect URL (optional)', type: 'text', default: form.redirect_url },
                { name: 'email_to', label: 'Send Email To', type: 'email', default: form.email_to },
                { name: 'email_subject', label: 'Email Subject', type: 'text', default: form.email_subject },
                { name: 'is_active', label: 'Active', type: 'checkbox', default: form.is_active },
                { name: 'allow_multiple', label: 'Allow Multiple Submissions', type: 'checkbox', default: form.allow_multiple },
                { name: 'require_login', label: 'Require Login', type: 'checkbox', default: form.require_login }
            ];

            const formHtml = Components.createForm(fields, form);
            
            Components.createModal('Edit Form', formHtml, [
                { text: 'Cancel', onclick: 'Components.closeModal()' },
                { text: 'Update', class: 'primary', onclick: 'FormsModule.update()' }
            ]);
            
        } catch (error) {
            AdminApp.showNotification('Error loading form: ' + error.message, 'error');
        }
    },

    /**
     * Manage form fields
     */
    async manageFields(formId) {
        try {
            const response = await API.forms.get(formId);
            const form = response.data;

            const fieldsHtml = `
                <div style="padding: 20px;">
                    <h4 class="white-168-text">Form: ${Utils.escapeHtml(form.title)}</h4>
                    <p class="secondary-text">Manage form fields and their properties</p>
                    
                    <div style="margin: 20px 0;">
                        <button class="admin-button primary" onclick="FormsModule.addField(${formId})">
                            + Add Field
                        </button>
                        <button class="admin-button secondary" onclick="FormsModule.previewForm(${formId})">
                            👁️ Preview Form
                        </button>
                    </div>
                    
                    <div id="form-fields-list">
                        ${Components.createLoader('Loading form fields...')}
                    </div>
                </div>
            `;
            
            Components.createModal('Manage Form Fields', fieldsHtml, [
                { text: 'Close', onclick: 'Components.closeModal()' }
            ]);

            // Load fields after modal is shown
            setTimeout(() => this.loadFormFields(formId), 100);
            
        } catch (error) {
            AdminApp.showNotification('Error loading form: ' + error.message, 'error');
        }
    },

    /**
     * Load form fields
     */
    async loadFormFields(formId) {
        try {
            // Mock form fields for now
            const fields = [
                { id: 1, name: 'name', label: 'Full Name', type: 'text', required: true, order: 1 },
                { id: 2, name: 'email', label: 'Email Address', type: 'email', required: true, order: 2 },
                { id: 3, name: 'message', label: 'Message', type: 'textarea', required: true, order: 3 }
            ];

            const fieldsHtml = fields.length > 0 ? `
                <div class="admin-table-container">
                    <table class="admin-table">
                        <thead>
                            <tr>
                                <th>Order</th>
                                <th>Name</th>
                                <th>Label</th>
                                <th>Type</th>
                                <th>Required</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            ${fields.map(field => `
                                <tr>
                                    <td>${field.order}</td>
                                    <td><code>${field.name}</code></td>
                                    <td>${Utils.escapeHtml(field.label)}</td>
                                    <td><span class="cyan-168-text">${field.type}</span></td>
                                    <td>${field.required ? '<span class="green-168-text">✓</span>' : '<span class="secondary-text">-</span>'}</td>
                                    <td>
                                        <button class="admin-button primary" onclick="FormsModule.editField(${field.id})">Edit</button>
                                        <button class="admin-button danger" onclick="FormsModule.deleteField(${field.id})">Delete</button>
                                    </td>
                                </tr>
                            `).join('')}
                        </tbody>
                    </table>
                </div>
            ` : '<p class="secondary-text">No fields defined for this form.</p>';

            document.getElementById('form-fields-list').innerHTML = fieldsHtml;
            
        } catch (error) {
            document.getElementById('form-fields-list').innerHTML = 
                Components.createError('Failed to load form fields', error.message);
        }
    },

    /**
     * Add new field to form
     */
    addField(formId) {
        AdminApp.showNotification('Add form field - Coming soon!', 'info');
        // TODO: Implement field creation
    },

    /**
     * Edit form field
     */
    editField(fieldId) {
        AdminApp.showNotification('Edit form field - Coming soon!', 'info');
        // TODO: Implement field editing
    },

    /**
     * Delete form field
     */
    deleteField(fieldId) {
        AdminApp.showNotification('Delete form field - Coming soon!', 'info');
        // TODO: Implement field deletion
    },

    /**
     * Preview form
     */
    async previewForm(formId) {
        try {
            const response = await API.forms.get(formId);
            const form = response.data;

            const previewHtml = `
                <div style="padding: 20px;">
                    <h4 class="white-168-text">${Utils.escapeHtml(form.title)}</h4>
                    ${form.description ? `<p class="secondary-text">${Utils.escapeHtml(form.description)}</p>` : ''}
                    
                    <form style="margin-top: 20px;">
                        <div class="admin-form-group">
                            <label>Full Name *</label>
                            <input type="text" required>
                        </div>
                        <div class="admin-form-group">
                            <label>Email Address *</label>
                            <input type="email" required>
                        </div>
                        <div class="admin-form-group">
                            <label>Message *</label>
                            <textarea rows="4" required></textarea>
                        </div>
                        <div style="margin-top: 20px;">
                            <button type="button" class="admin-button primary">
                                ${Utils.escapeHtml(form.submit_text || 'Submit')}
                            </button>
                        </div>
                    </form>
                </div>
            `;
            
            Components.createModal('Form Preview', previewHtml, [
                { text: 'Close', onclick: 'Components.closeModal()' },
                { text: 'Edit Form', class: 'primary', onclick: `Components.closeModal(); FormsModule.edit(${formId})` }
            ]);
            
        } catch (error) {
            AdminApp.showNotification('Error loading form preview: ' + error.message, 'error');
        }
    },

    /**
     * View form submissions
     */
    async viewSubmissions(formId) {
        try {
            const response = await API.forms.get(formId);
            const form = response.data;

            // Mock submissions data
            const submissions = [
                { id: 1, name: 'John Doe', email: 'john@example.com', message: 'Hello world!', created_at: '2024-01-15T10:30:00Z' },
                { id: 2, name: 'Jane Smith', email: 'jane@example.com', message: 'Great website!', created_at: '2024-01-14T15:45:00Z' }
            ];

            const submissionsHtml = `
                <div style="padding: 20px;">
                    <h4 class="white-168-text">Submissions: ${Utils.escapeHtml(form.title)}</h4>
                    <p class="secondary-text">${submissions.length} submissions found</p>
                    
                    ${submissions.length > 0 ? `
                        <div class="admin-table-container" style="margin-top: 20px;">
                            <table class="admin-table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Message</th>
                                        <th>Date</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    ${submissions.map(sub => `
                                        <tr>
                                            <td>${sub.id}</td>
                                            <td>${Utils.escapeHtml(sub.name)}</td>
                                            <td>${Utils.escapeHtml(sub.email)}</td>
                                            <td>${Utils.truncate(sub.message, 30)}</td>
                                            <td>${Utils.formatDate(sub.created_at)}</td>
                                            <td>
                                                <button class="admin-button secondary" onclick="FormsModule.viewSubmission(${sub.id})">View</button>
                                                <button class="admin-button danger" onclick="FormsModule.deleteSubmission(${sub.id})">Delete</button>
                                            </td>
                                        </tr>
                                    `).join('')}
                                </tbody>
                            </table>
                        </div>
                    ` : '<p class="secondary-text">No submissions yet.</p>'}
                </div>
            `;
            
            Components.createModal('Form Submissions', submissionsHtml, [
                { text: 'Close', onclick: 'Components.closeModal()' },
                { text: 'Export CSV', class: 'success', onclick: `FormsModule.exportSubmissions(${formId})` }
            ]);
            
        } catch (error) {
            AdminApp.showNotification('Error loading submissions: ' + error.message, 'error');
        }
    },

    /**
     * View single submission
     */
    viewSubmission(submissionId) {
        AdminApp.showNotification('View submission details - Coming soon!', 'info');
        // TODO: Implement submission details view
    },

    /**
     * Delete submission
     */
    deleteSubmission(submissionId) {
        AdminApp.showNotification('Delete submission - Coming soon!', 'info');
        // TODO: Implement submission deletion
    },

    /**
     * Export submissions
     */
    exportSubmissions(formId) {
        AdminApp.showNotification('Export submissions - Coming soon!', 'info');
        // TODO: Implement CSV export
    },

    /**
     * View all submissions
     */
    viewAllSubmissions() {
        AdminApp.showNotification('View all submissions - Coming soon!', 'info');
        // TODO: Implement all submissions view
    },

    /**
     * Export forms
     */
    exportForms() {
        AdminApp.showNotification('Export forms - Coming soon!', 'info');
        // TODO: Implement forms export
    },

    /**
     * Delete form
     */
    delete(id) {
        Components.confirm(
            'Are you sure you want to delete this form? This will also delete all submissions. This action cannot be undone.',
            'Delete Form',
            async () => {
                try {
                    await API.forms.delete(id);
                    AdminApp.showNotification('Form deleted successfully!', 'success');
                    this.refresh();
                } catch (error) {
                    AdminApp.showNotification('Error deleting form: ' + error.message, 'error');
                }
            }
        );
    },

    /**
     * Save new form
     */
    async save() {
        try {
            const formData = Components.getFormData();
            
            // Validate required fields
            if (!formData.name || !formData.title) {
                AdminApp.showNotification('Name and Title are required', 'error');
                return;
            }

            const response = await API.forms.create(formData);
            
            if (response.status === 'success') {
                AdminApp.showNotification('Form created successfully!', 'success');
                Components.closeModal();
                this.refresh();
            } else {
                AdminApp.showNotification('Failed to create form', 'error');
            }
        } catch (error) {
            console.error('Error creating form:', error);
            AdminApp.showNotification('Error creating form: ' + error.message, 'error');
        }
    },

    /**
     * Update existing form
     */
    async update() {
        try {
            const formData = Components.getFormData();
            const id = formData.id;
            delete formData.id; // Remove ID from update data

            const response = await API.forms.update(id, formData);
            
            if (response.status === 'success') {
                AdminApp.showNotification('Form updated successfully!', 'success');
                Components.closeModal();
                this.refresh();
            } else {
                AdminApp.showNotification('Failed to update form', 'error');
            }
        } catch (error) {
            console.error('Error updating form:', error);
            AdminApp.showNotification('Error updating form: ' + error.message, 'error');
        }
    },

    /**
     * Search forms
     */
    async search(query) {
        try {
            const response = await API.forms.list({ search: query });
            const forms = response.data || [];
            
            // Re-render table with filtered results
            const tableContainer = document.querySelector('#panel-forms .tui-fieldset > div');
            if (tableContainer) {
                const columns = [
                    { key: 'id', title: 'ID', type: 'number' },
                    { key: 'name', title: 'Name' },
                    { key: 'title', title: 'Title' },
                    { key: 'description', title: 'Description', formatter: (value) => Utils.truncate(value, 50) },
                    { key: 'is_active', title: 'Active', type: 'boolean' },
                    { key: 'submissions_count', title: 'Submissions', type: 'number' },
                    { key: 'created_at', title: 'Created', type: 'date' },
                    {
                        key: 'actions',
                        title: 'Actions',
                        type: 'actions',
                        actions: [
                            { text: 'Edit', class: 'primary', onclick: 'FormsModule.edit' },
                            { text: 'Fields', class: 'secondary', onclick: 'FormsModule.manageFields' },
                            { text: 'Submissions', class: 'warning', onclick: 'FormsModule.viewSubmissions' },
                            { text: 'Delete', class: 'danger', onclick: 'FormsModule.delete' }
                        ]
                    }
                ];

                const tableHtml = forms.length > 0 ?
                    Components.createTable(forms, columns) :
                    Components.createEmptyState(`No forms found for "${query}"`, 'Create Form', 'FormsModule.create()');

                // Update only the table part
                const existingTable = tableContainer.querySelector('.admin-table, .empty-state');
                if (existingTable) {
                    existingTable.outerHTML = tableHtml;
                }
            }
        } catch (error) {
            AdminApp.showNotification('Error searching forms: ' + error.message, 'error');
        }
    },

    /**
     * Refresh forms list
     */
    refresh() {
        const panel = document.getElementById('panel-forms');
        if (panel) {
            this.load(panel);
        }
    }
};

// Expose to global scope
window.FormsModule = FormsModule;
