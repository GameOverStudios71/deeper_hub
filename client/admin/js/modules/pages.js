/**
 * Pages Module
 * Handles all pages-related functionality
 */

const PagesModule = {
    
    /**
     * Load pages section
     */
    async load(panel) {
        try {
            const response = await API.pages.list();
            const pages = response.data || [];

            const columns = [
                { key: 'id', title: 'ID', type: 'number' },
                { key: 'title', title: 'Title' },
                { key: 'uri', title: 'URI' },
                { key: 'is_active', title: 'Active', type: 'boolean' },
                { key: 'is_home', title: 'Homepage', type: 'boolean' },
                { key: 'created_at', title: 'Created', type: 'date' },
                {
                    key: 'actions',
                    title: 'Actions',
                    type: 'actions',
                    actions: [
                        { text: 'Edit', class: 'primary', onclick: 'PagesModule.edit' },
                        { text: 'Delete', class: 'danger', onclick: 'PagesModule.delete' }
                    ]
                }
            ];

            const html = `
                <div class="tui-window full-width">
                    <fieldset class="tui-fieldset">
                        <legend class="center">PAGES MANAGEMENT</legend>
                        <div style="padding: 20px;">
                            <div style="margin-bottom: 20px;">
                                <button class="admin-button primary" onclick="PagesModule.create()">
                                    + New Page
                                </button>
                                <button class="admin-button secondary" onclick="PagesModule.refresh()">
                                    ↻ Refresh
                                </button>
                            </div>

                            ${Components.createSearchBox('Search pages...', 'PagesModule.search')}

                            ${pages.length > 0 ?
                                Components.createTable(pages, columns) :
                                Components.createEmptyState('No pages found', 'Create Page', 'PagesModule.create()')
                            }
                        </div>
                    </fieldset>
                </div>
            `;

            panel.innerHTML = html;
            
        } catch (error) {
            console.error('Failed to load pages:', error);
            panel.innerHTML = Components.createError('Failed to load pages', error.message);
        }
    },

    /**
     * Create new page
     */
    create() {
        const fields = [
            { name: 'name', label: 'Name (Internal)', type: 'text', required: true, placeholder: 'my_page' },
            { name: 'title', label: 'Title', type: 'text', required: true },
            { name: 'uri', label: 'URI', type: 'text', required: true, placeholder: '/my-page' },
            { name: 'title_system', label: 'System Title', type: 'text' },
            { name: 'description', label: 'Description', type: 'textarea', rows: 3 },
            { name: 'meta_title', label: 'Meta Title', type: 'text' },
            { name: 'meta_description', label: 'Meta Description', type: 'textarea', rows: 2 },
            { name: 'is_active', label: 'Active', type: 'checkbox', default: true },
            { name: 'is_home', label: 'Set as Homepage', type: 'checkbox' }
        ];

        const formHtml = Components.createForm(fields);
        
        Components.createModal('Create New Page', formHtml, [
            { text: 'Cancel', onclick: 'Components.closeModal()' },
            { text: 'Create', class: 'primary', onclick: 'PagesModule.save()' }
        ]);
    },

    /**
     * Edit existing page
     */
    async edit(id) {
        try {
            const response = await API.pages.get(id);
            const page = response.data;

            const fields = [
                { name: 'id', type: 'hidden', default: page.id },
                { name: 'name', label: 'Name (Internal)', type: 'text', required: true, default: page.name },
                { name: 'title', label: 'Title', type: 'text', required: true, default: page.title },
                { name: 'uri', label: 'URI', type: 'text', required: true, default: page.uri },
                { name: 'title_system', label: 'System Title', type: 'text', default: page.title_system },
                { name: 'description', label: 'Description', type: 'textarea', rows: 3, default: page.description },
                { name: 'meta_title', label: 'Meta Title', type: 'text', default: page.meta_title },
                { name: 'meta_description', label: 'Meta Description', type: 'textarea', rows: 2, default: page.meta_description },
                { name: 'is_active', label: 'Active', type: 'checkbox', default: page.is_active },
                { name: 'is_home', label: 'Set as Homepage', type: 'checkbox', default: page.is_home }
            ];

            const formHtml = Components.createForm(fields, page);
            
            Components.createModal('Edit Page', formHtml, [
                { text: 'Cancel', onclick: 'Components.closeModal()' },
                { text: 'Update', class: 'primary', onclick: 'PagesModule.update()' }
            ]);
            
        } catch (error) {
            AdminApp.showNotification('Error loading page: ' + error.message, 'error');
        }
    },

    /**
     * Delete page
     */
    delete(id) {
        Components.confirm(
            'Are you sure you want to delete this page? This action cannot be undone.',
            'Delete Page',
            async () => {
                try {
                    await API.pages.delete(id);
                    AdminApp.showNotification('Page deleted successfully!', 'success');
                    this.refresh();
                } catch (error) {
                    AdminApp.showNotification('Error deleting page: ' + error.message, 'error');
                }
            }
        );
    },

    /**
     * Save new page
     */
    async save() {
        try {
            const formData = Components.getFormData();
            
            // Validate required fields
            if (!formData.name || !formData.title || !formData.uri) {
                AdminApp.showNotification('Name, Title and URI are required', 'error');
                return;
            }

            // Ensure URI starts with /
            if (!formData.uri.startsWith('/')) {
                formData.uri = '/' + formData.uri;
            }

            // Generate name from title if not provided
            if (!formData.name && formData.title) {
                formData.name = formData.title.toLowerCase()
                    .replace(/[^a-z0-9]/g, '_')
                    .replace(/_+/g, '_')
                    .replace(/^_|_$/g, '');
            }

            const response = await API.pages.create(formData);
            
            if (response.status === 'success') {
                AdminApp.showNotification('Page created successfully!', 'success');
                Components.closeModal();
                this.refresh();
            } else {
                AdminApp.showNotification('Failed to create page', 'error');
            }
        } catch (error) {
            console.error('Error creating page:', error);
            AdminApp.showNotification('Error creating page: ' + error.message, 'error');
        }
    },

    /**
     * Update existing page
     */
    async update() {
        try {
            const formData = Components.getFormData();
            const id = formData.id;
            delete formData.id; // Remove ID from update data

            const response = await API.pages.update(id, formData);
            
            if (response.status === 'success') {
                AdminApp.showNotification('Page updated successfully!', 'success');
                Components.closeModal();
                this.refresh();
            } else {
                AdminApp.showNotification('Failed to update page', 'error');
            }
        } catch (error) {
            console.error('Error updating page:', error);
            AdminApp.showNotification('Error updating page: ' + error.message, 'error');
        }
    },

    /**
     * Search pages
     */
    async search(query) {
        try {
            const response = await API.pages.list({ search: query });
            const pages = response.data || [];
            
            // Re-render table with filtered results
            const tableContainer = document.querySelector('#panel-pages .tui-fieldset > div');
            if (tableContainer) {
                const columns = [
                    { key: 'id', title: 'ID', type: 'number' },
                    { key: 'title', title: 'Title' },
                    { key: 'uri', title: 'URI' },
                    { key: 'is_active', title: 'Active', type: 'boolean' },
                    { key: 'is_home', title: 'Homepage', type: 'boolean' },
                    { key: 'created_at', title: 'Created', type: 'date' },
                    {
                        key: 'actions',
                        title: 'Actions',
                        type: 'actions',
                        actions: [
                            { text: 'Edit', class: 'primary', onclick: 'PagesModule.edit' },
                            { text: 'Delete', class: 'danger', onclick: 'PagesModule.delete' }
                        ]
                    }
                ];

                const tableHtml = pages.length > 0 ?
                    Components.createTable(pages, columns) :
                    Components.createEmptyState(`No pages found for "${query}"`, 'Create Page', 'PagesModule.create()');

                // Update only the table part
                const existingTable = tableContainer.querySelector('.admin-table, .empty-state');
                if (existingTable) {
                    existingTable.outerHTML = tableHtml;
                }
            }
        } catch (error) {
            AdminApp.showNotification('Error searching pages: ' + error.message, 'error');
        }
    },

    /**
     * Refresh pages list
     */
    refresh() {
        const panel = document.getElementById('panel-pages');
        if (panel) {
            this.load(panel);
        }
    }
};

// Expose to global scope
window.PagesModule = PagesModule;
