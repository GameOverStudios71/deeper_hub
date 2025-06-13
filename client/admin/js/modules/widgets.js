/**
 * Widgets Module
 * Handles all widgets-related functionality
 */

const WidgetsModule = {
    
    /**
     * Load widgets section
     */
    async load(panel) {
        try {
            const response = await API.widgets.list();
            const widgets = response.data || [];

            const columns = [
                { key: 'id', title: 'ID', type: 'number' },
                { key: 'name', title: 'Name' },
                { key: 'title', title: 'Title' },
                { key: 'type', title: 'Type', formatter: (value) => this.formatType(value) },
                { key: 'position', title: 'Position', formatter: (value) => this.formatPosition(value) },
                { key: 'is_active', title: 'Active', type: 'boolean' },
                { key: 'order_index', title: 'Order', type: 'number' },
                {
                    key: 'actions',
                    title: 'Actions',
                    type: 'actions',
                    actions: [
                        { text: 'Edit', class: 'primary', onclick: 'WidgetsModule.edit' },
                        { text: 'Preview', class: 'secondary', onclick: 'WidgetsModule.preview' },
                        { text: 'Delete', class: 'danger', onclick: 'WidgetsModule.delete' }
                    ]
                }
            ];

            const html = `
                <div class="tui-window full-width">
                    <fieldset class="tui-fieldset">
                        <legend class="center">WIDGETS MANAGEMENT</legend>
                        <div style="padding: 20px;">
                            <div style="margin-bottom: 20px;">
                                <button class="admin-button primary" onclick="WidgetsModule.create()">
                                    + New Widget
                                </button>
                                <button class="admin-button secondary" onclick="WidgetsModule.refresh()">
                                    ↻ Refresh
                                </button>
                                <button class="admin-button warning" onclick="WidgetsModule.reorderWidgets()">
                                    🔄 Reorder
                                </button>
                                <button class="admin-button success" onclick="WidgetsModule.previewAll()">
                                    👁️ Preview All
                                </button>
                            </div>

                            ${Components.createSearchBox('Search widgets...', 'WidgetsModule.search')}

                            ${widgets.length > 0 ?
                                Components.createTable(widgets, columns) :
                                Components.createEmptyState('No widgets found', 'Create Widget', 'WidgetsModule.create()')
                            }
                        </div>
                    </fieldset>
                </div>
            `;

            panel.innerHTML = html;
            
        } catch (error) {
            console.error('Failed to load widgets:', error);
            panel.innerHTML = Components.createError('Failed to load widgets', error.message);
        }
    },

    /**
     * Format widget type for display
     */
    formatType(type) {
        const typeInfo = {
            'text': { label: 'Text', color: 'cyan-168-text', icon: '📝' },
            'html': { label: 'HTML', color: 'yellow-168-text', icon: '🌐' },
            'menu': { label: 'Menu', color: 'green-168-text', icon: '📋' },
            'recent_posts': { label: 'Recent Posts', color: 'blue-168-text', icon: '📰' },
            'search': { label: 'Search', color: 'purple-168-text', icon: '🔍' },
            'custom': { label: 'Custom', color: 'red-168-text', icon: '⚙️' }
        };
        
        const info = typeInfo[type] || { label: type, color: 'white-168-text', icon: '❓' };
        return `<span class="${info.color}">${info.icon} ${info.label}</span>`;
    },

    /**
     * Format widget position for display
     */
    formatPosition(position) {
        const positions = {
            'header': { label: 'Header', color: 'cyan-168-text' },
            'sidebar': { label: 'Sidebar', color: 'yellow-168-text' },
            'footer': { label: 'Footer', color: 'green-168-text' },
            'content': { label: 'Content', color: 'blue-168-text' },
            'floating': { label: 'Floating', color: 'red-168-text' }
        };
        
        const info = positions[position] || { label: position, color: 'white-168-text' };
        return `<span class="${info.color}">${info.label}</span>`;
    },

    /**
     * Create new widget
     */
    create() {
        const fields = [
            { name: 'name', label: 'Name', type: 'text', required: true, placeholder: 'my_widget' },
            { name: 'title', label: 'Title', type: 'text', required: true, placeholder: 'My Widget' },
            { name: 'description', label: 'Description', type: 'textarea', rows: 2, placeholder: 'Widget description...' },
            { 
                name: 'type', 
                label: 'Type', 
                type: 'select', 
                required: true,
                options: [
                    { value: 'text', text: '📝 Text Widget' },
                    { value: 'html', text: '🌐 HTML Widget' },
                    { value: 'menu', text: '📋 Menu Widget' },
                    { value: 'recent_posts', text: '📰 Recent Posts' },
                    { value: 'search', text: '🔍 Search Widget' },
                    { value: 'custom', text: '⚙️ Custom Widget' }
                ]
            },
            { 
                name: 'position', 
                label: 'Position', 
                type: 'select', 
                required: true,
                options: [
                    { value: 'header', text: 'Header' },
                    { value: 'sidebar', text: 'Sidebar' },
                    { value: 'footer', text: 'Footer' },
                    { value: 'content', text: 'Content Area' },
                    { value: 'floating', text: 'Floating' }
                ]
            },
            { name: 'content', label: 'Content', type: 'textarea', rows: 5, placeholder: 'Widget content or configuration...' },
            { name: 'css_class', label: 'CSS Class', type: 'text', placeholder: 'custom-widget-class' },
            { name: 'order_index', label: 'Order', type: 'number', default: 0, placeholder: '0' },
            { name: 'is_active', label: 'Active', type: 'checkbox', default: true },
            { name: 'show_title', label: 'Show Title', type: 'checkbox', default: true }
        ];

        const formHtml = Components.createForm(fields);
        
        Components.createModal('Create New Widget', formHtml, [
            { text: 'Cancel', onclick: 'Components.closeModal()' },
            { text: 'Create', class: 'primary', onclick: 'WidgetsModule.save()' }
        ]);
    },

    /**
     * Edit existing widget
     */
    async edit(id) {
        try {
            const response = await API.widgets.get(id);
            const widget = response.data;

            const fields = [
                { name: 'id', type: 'hidden', default: widget.id },
                { name: 'name', label: 'Name', type: 'text', required: true, default: widget.name },
                { name: 'title', label: 'Title', type: 'text', required: true, default: widget.title },
                { name: 'description', label: 'Description', type: 'textarea', rows: 2, default: widget.description },
                { 
                    name: 'type', 
                    label: 'Type', 
                    type: 'select', 
                    required: true,
                    default: widget.type,
                    options: [
                        { value: 'text', text: '📝 Text Widget' },
                        { value: 'html', text: '🌐 HTML Widget' },
                        { value: 'menu', text: '📋 Menu Widget' },
                        { value: 'recent_posts', text: '📰 Recent Posts' },
                        { value: 'search', text: '🔍 Search Widget' },
                        { value: 'custom', text: '⚙️ Custom Widget' }
                    ]
                },
                { 
                    name: 'position', 
                    label: 'Position', 
                    type: 'select', 
                    required: true,
                    default: widget.position,
                    options: [
                        { value: 'header', text: 'Header' },
                        { value: 'sidebar', text: 'Sidebar' },
                        { value: 'footer', text: 'Footer' },
                        { value: 'content', text: 'Content Area' },
                        { value: 'floating', text: 'Floating' }
                    ]
                },
                { name: 'content', label: 'Content', type: 'textarea', rows: 5, default: widget.content },
                { name: 'css_class', label: 'CSS Class', type: 'text', default: widget.css_class },
                { name: 'order_index', label: 'Order', type: 'number', default: widget.order_index },
                { name: 'is_active', label: 'Active', type: 'checkbox', default: widget.is_active },
                { name: 'show_title', label: 'Show Title', type: 'checkbox', default: widget.show_title }
            ];

            const formHtml = Components.createForm(fields, widget);
            
            Components.createModal('Edit Widget', formHtml, [
                { text: 'Cancel', onclick: 'Components.closeModal()' },
                { text: 'Update', class: 'primary', onclick: 'WidgetsModule.update()' }
            ]);
            
        } catch (error) {
            AdminApp.showNotification('Error loading widget: ' + error.message, 'error');
        }
    },

    /**
     * Preview widget
     */
    async preview(id) {
        try {
            const response = await API.widgets.get(id);
            const widget = response.data;

            const previewHtml = this.generateWidgetPreview(widget);
            
            Components.createModal(`Preview: ${widget.title}`, previewHtml, [
                { text: 'Close', onclick: 'Components.closeModal()' },
                { text: 'Edit', class: 'primary', onclick: `Components.closeModal(); WidgetsModule.edit(${id})` }
            ]);
            
        } catch (error) {
            AdminApp.showNotification('Error loading widget preview: ' + error.message, 'error');
        }
    },

    /**
     * Generate widget preview HTML
     */
    generateWidgetPreview(widget) {
        let content = '';
        
        switch (widget.type) {
            case 'text':
                content = `<p>${Utils.escapeHtml(widget.content || 'No content')}</p>`;
                break;
            case 'html':
                content = widget.content || '<p><em>No HTML content</em></p>';
                break;
            case 'menu':
                content = `
                    <ul style="list-style: none; padding: 0;">
                        <li style="padding: 5px 0;"><a href="#" class="cyan-168-text">Home</a></li>
                        <li style="padding: 5px 0;"><a href="#" class="cyan-168-text">About</a></li>
                        <li style="padding: 5px 0;"><a href="#" class="cyan-168-text">Contact</a></li>
                    </ul>
                `;
                break;
            case 'recent_posts':
                content = `
                    <div>
                        <div style="margin-bottom: 10px; padding: 5px; border-left: 2px solid rgb(0, 255, 255);">
                            <strong class="white-168-text">Sample Post 1</strong><br>
                            <small class="secondary-text">2 days ago</small>
                        </div>
                        <div style="margin-bottom: 10px; padding: 5px; border-left: 2px solid rgb(0, 255, 255);">
                            <strong class="white-168-text">Sample Post 2</strong><br>
                            <small class="secondary-text">1 week ago</small>
                        </div>
                    </div>
                `;
                break;
            case 'search':
                content = `
                    <div>
                        <input type="text" placeholder="Search..." style="width: 100%; margin-bottom: 10px;">
                        <button class="admin-button primary" style="width: 100%;">Search</button>
                    </div>
                `;
                break;
            default:
                content = `<p><em>Custom widget content</em></p>`;
        }

        return `
            <div style="padding: 20px;">
                <div style="margin-bottom: 15px;">
                    <strong>Type:</strong> ${this.formatType(widget.type)}<br>
                    <strong>Position:</strong> ${this.formatPosition(widget.position)}<br>
                    <strong>Order:</strong> ${widget.order_index || 0}<br>
                    <strong>CSS Class:</strong> ${widget.css_class || '<em>none</em>'}
                </div>
                
                <fieldset class="tui-fieldset">
                    <legend>Widget Preview</legend>
                    <div style="padding: 15px; background: rgb(0, 0, 100); border: 1px solid rgb(168, 168, 168);">
                        ${widget.show_title ? `<h4 class="white-168-text" style="margin-top: 0;">${Utils.escapeHtml(widget.title)}</h4>` : ''}
                        ${content}
                    </div>
                </fieldset>
            </div>
        `;
    },

    /**
     * Delete widget
     */
    delete(id) {
        Components.confirm(
            'Are you sure you want to delete this widget? This action cannot be undone.',
            'Delete Widget',
            async () => {
                try {
                    await API.widgets.delete(id);
                    AdminApp.showNotification('Widget deleted successfully!', 'success');
                    this.refresh();
                } catch (error) {
                    AdminApp.showNotification('Error deleting widget: ' + error.message, 'error');
                }
            }
        );
    },

    /**
     * Save new widget
     */
    async save() {
        try {
            const formData = Components.getFormData();
            
            // Validate required fields
            if (!formData.name || !formData.title || !formData.type || !formData.position) {
                AdminApp.showNotification('Name, Title, Type and Position are required', 'error');
                return;
            }

            const response = await API.widgets.create(formData);
            
            if (response.status === 'success') {
                AdminApp.showNotification('Widget created successfully!', 'success');
                Components.closeModal();
                this.refresh();
            } else {
                AdminApp.showNotification('Failed to create widget', 'error');
            }
        } catch (error) {
            console.error('Error creating widget:', error);
            AdminApp.showNotification('Error creating widget: ' + error.message, 'error');
        }
    },

    /**
     * Update existing widget
     */
    async update() {
        try {
            const formData = Components.getFormData();
            const id = formData.id;
            delete formData.id; // Remove ID from update data

            const response = await API.widgets.update(id, formData);
            
            if (response.status === 'success') {
                AdminApp.showNotification('Widget updated successfully!', 'success');
                Components.closeModal();
                this.refresh();
            } else {
                AdminApp.showNotification('Failed to update widget', 'error');
            }
        } catch (error) {
            console.error('Error updating widget:', error);
            AdminApp.showNotification('Error updating widget: ' + error.message, 'error');
        }
    },

    /**
     * Reorder widgets
     */
    reorderWidgets() {
        AdminApp.showNotification('Widget reordering - Coming soon!', 'info');
        // TODO: Implement drag-and-drop reordering
    },

    /**
     * Preview all widgets
     */
    previewAll() {
        AdminApp.showNotification('Full widget preview - Coming soon!', 'info');
        // TODO: Show all widgets in their positions
    },

    /**
     * Search widgets
     */
    async search(query) {
        try {
            const response = await API.widgets.list({ search: query });
            const widgets = response.data || [];
            
            // Re-render table with filtered results
            const tableContainer = document.querySelector('#panel-widgets .tui-fieldset > div');
            if (tableContainer) {
                const columns = [
                    { key: 'id', title: 'ID', type: 'number' },
                    { key: 'name', title: 'Name' },
                    { key: 'title', title: 'Title' },
                    { key: 'type', title: 'Type', formatter: (value) => this.formatType(value) },
                    { key: 'position', title: 'Position', formatter: (value) => this.formatPosition(value) },
                    { key: 'is_active', title: 'Active', type: 'boolean' },
                    { key: 'order_index', title: 'Order', type: 'number' },
                    {
                        key: 'actions',
                        title: 'Actions',
                        type: 'actions',
                        actions: [
                            { text: 'Edit', class: 'primary', onclick: 'WidgetsModule.edit' },
                            { text: 'Preview', class: 'secondary', onclick: 'WidgetsModule.preview' },
                            { text: 'Delete', class: 'danger', onclick: 'WidgetsModule.delete' }
                        ]
                    }
                ];

                const tableHtml = widgets.length > 0 ?
                    Components.createTable(widgets, columns) :
                    Components.createEmptyState(`No widgets found for "${query}"`, 'Create Widget', 'WidgetsModule.create()');

                // Update only the table part
                const existingTable = tableContainer.querySelector('.admin-table, .empty-state');
                if (existingTable) {
                    existingTable.outerHTML = tableHtml;
                }
            }
        } catch (error) {
            AdminApp.showNotification('Error searching widgets: ' + error.message, 'error');
        }
    },

    /**
     * Refresh widgets list
     */
    refresh() {
        const panel = document.getElementById('panel-widgets');
        if (panel) {
            this.load(panel);
        }
    }
};

// Expose to global scope
window.WidgetsModule = WidgetsModule;
