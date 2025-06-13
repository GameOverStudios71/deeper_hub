/**
 * Settings Module
 * Handles all settings-related functionality
 */

const SettingsModule = {
    
    /**
     * Load settings section
     */
    async load(panel) {
        try {
            const response = await API.settings.list();
            const settings = response.data || [];

            const columns = [
                { key: 'id', title: 'ID', type: 'number' },
                { key: 'name', title: 'Key', formatter: (value) => `<code>${value}</code>` },
                { key: 'title', title: 'Title' },
                { key: 'value', title: 'Value', formatter: (value) => this.formatValue(value) },
                { key: 'type', title: 'Type', formatter: (value) => this.formatType(value) },
                { key: 'is_active', title: 'Active', type: 'boolean' },
                {
                    key: 'actions',
                    title: 'Actions',
                    type: 'actions',
                    actions: [
                        { text: 'Edit', class: 'primary', onclick: 'SettingsModule.edit' },
                        { text: 'Delete', class: 'danger', onclick: 'SettingsModule.delete' }
                    ]
                }
            ];

            const html = `
                <div class="tui-window full-width">
                    <fieldset class="tui-fieldset">
                        <legend class="center">SETTINGS MANAGEMENT</legend>
                        <div style="padding: 20px;">
                            <div style="margin-bottom: 20px;">
                                <button class="admin-button primary" onclick="SettingsModule.create()">
                                    + New Setting
                                </button>
                                <button class="admin-button secondary" onclick="SettingsModule.refresh()">
                                    ↻ Refresh
                                </button>
                                <button class="admin-button warning" onclick="SettingsModule.importDefaults()">
                                    📥 Import Defaults
                                </button>
                                <button class="admin-button success" onclick="SettingsModule.exportSettings()">
                                    📤 Export Settings
                                </button>
                            </div>

                            ${Components.createSearchBox('Search settings...', 'SettingsModule.search')}

                            ${settings.length > 0 ?
                                Components.createTable(settings, columns) :
                                Components.createEmptyState('No settings found', 'Create Setting', 'SettingsModule.create()')
                            }
                        </div>
                    </fieldset>
                </div>
            `;

            panel.innerHTML = html;
            
        } catch (error) {
            console.error('Failed to load settings:', error);
            panel.innerHTML = Components.createError('Failed to load settings', error.message);
        }
    },

    /**
     * Format setting value for display
     */
    formatValue(value) {
        if (!value) return '<em class="secondary-text">empty</em>';
        
        if (value.length > 50) {
            return `<span title="${Utils.escapeHtml(value)}">${Utils.escapeHtml(value.substring(0, 47))}...</span>`;
        }
        
        return Utils.escapeHtml(value);
    },

    /**
     * Format setting type for display
     */
    formatType(type) {
        const typeColors = {
            'string': 'cyan-168-text',
            'number': 'yellow-168-text',
            'boolean': 'green-168-text',
            'json': 'red-168-text',
            'text': 'white-168-text'
        };
        
        const color = typeColors[type] || 'secondary-text';
        return `<span class="${color}">${type || 'string'}</span>`;
    },

    /**
     * Create new setting
     */
    create() {
        const fields = [
            { name: 'name', label: 'Key', type: 'text', required: true, placeholder: 'site_title' },
            { name: 'title', label: 'Title', type: 'text', required: true, placeholder: 'Site Title' },
            { name: 'description', label: 'Description', type: 'textarea', rows: 2, placeholder: 'Setting description...' },
            { 
                name: 'type', 
                label: 'Type', 
                type: 'select', 
                required: true,
                options: [
                    { value: 'string', text: 'String' },
                    { value: 'number', text: 'Number' },
                    { value: 'boolean', text: 'Boolean' },
                    { value: 'text', text: 'Long Text' },
                    { value: 'json', text: 'JSON' }
                ]
            },
            { name: 'value', label: 'Value', type: 'textarea', rows: 3, placeholder: 'Setting value...' },
            { name: 'default_value', label: 'Default Value', type: 'text', placeholder: 'Default value...' },
            { name: 'is_active', label: 'Active', type: 'checkbox', default: true },
            { name: 'is_system', label: 'System Setting', type: 'checkbox' }
        ];

        const formHtml = Components.createForm(fields);
        
        Components.createModal('Create New Setting', formHtml, [
            { text: 'Cancel', onclick: 'Components.closeModal()' },
            { text: 'Create', class: 'primary', onclick: 'SettingsModule.save()' }
        ]);
    },

    /**
     * Edit existing setting
     */
    async edit(id) {
        try {
            const response = await API.settings.get(id);
            const setting = response.data;

            const fields = [
                { name: 'id', type: 'hidden', default: setting.id },
                { name: 'name', label: 'Key', type: 'text', required: true, default: setting.name, readonly: setting.is_system },
                { name: 'title', label: 'Title', type: 'text', required: true, default: setting.title },
                { name: 'description', label: 'Description', type: 'textarea', rows: 2, default: setting.description },
                { 
                    name: 'type', 
                    label: 'Type', 
                    type: 'select', 
                    required: true,
                    default: setting.type,
                    options: [
                        { value: 'string', text: 'String' },
                        { value: 'number', text: 'Number' },
                        { value: 'boolean', text: 'Boolean' },
                        { value: 'text', text: 'Long Text' },
                        { value: 'json', text: 'JSON' }
                    ]
                },
                { name: 'value', label: 'Value', type: 'textarea', rows: 3, default: setting.value },
                { name: 'default_value', label: 'Default Value', type: 'text', default: setting.default_value },
                { name: 'is_active', label: 'Active', type: 'checkbox', default: setting.is_active },
                { name: 'is_system', label: 'System Setting', type: 'checkbox', default: setting.is_system, readonly: true }
            ];

            const formHtml = Components.createForm(fields, setting);
            
            Components.createModal('Edit Setting', formHtml, [
                { text: 'Cancel', onclick: 'Components.closeModal()' },
                { text: 'Update', class: 'primary', onclick: 'SettingsModule.update()' }
            ]);
            
        } catch (error) {
            AdminApp.showNotification('Error loading setting: ' + error.message, 'error');
        }
    },

    /**
     * Delete setting
     */
    delete(id) {
        Components.confirm(
            'Are you sure you want to delete this setting? This action cannot be undone.',
            'Delete Setting',
            async () => {
                try {
                    await API.settings.delete(id);
                    AdminApp.showNotification('Setting deleted successfully!', 'success');
                    this.refresh();
                } catch (error) {
                    AdminApp.showNotification('Error deleting setting: ' + error.message, 'error');
                }
            }
        );
    },

    /**
     * Save new setting
     */
    async save() {
        try {
            const formData = Components.getFormData();
            
            // Validate required fields
            if (!formData.name || !formData.title || !formData.type) {
                AdminApp.showNotification('Key, Title and Type are required', 'error');
                return;
            }

            // Validate value based on type
            if (!this.validateValue(formData.value, formData.type)) {
                AdminApp.showNotification(`Invalid value for type ${formData.type}`, 'error');
                return;
            }

            const response = await API.settings.create(formData);
            
            if (response.status === 'success') {
                AdminApp.showNotification('Setting created successfully!', 'success');
                Components.closeModal();
                this.refresh();
            } else {
                AdminApp.showNotification('Failed to create setting', 'error');
            }
        } catch (error) {
            console.error('Error creating setting:', error);
            AdminApp.showNotification('Error creating setting: ' + error.message, 'error');
        }
    },

    /**
     * Update existing setting
     */
    async update() {
        try {
            const formData = Components.getFormData();
            const id = formData.id;
            delete formData.id; // Remove ID from update data

            // Validate value based on type
            if (!this.validateValue(formData.value, formData.type)) {
                AdminApp.showNotification(`Invalid value for type ${formData.type}`, 'error');
                return;
            }

            const response = await API.settings.update(id, formData);
            
            if (response.status === 'success') {
                AdminApp.showNotification('Setting updated successfully!', 'success');
                Components.closeModal();
                this.refresh();
            } else {
                AdminApp.showNotification('Failed to update setting', 'error');
            }
        } catch (error) {
            console.error('Error updating setting:', error);
            AdminApp.showNotification('Error updating setting: ' + error.message, 'error');
        }
    },

    /**
     * Validate setting value based on type
     */
    validateValue(value, type) {
        if (!value) return true; // Empty values are allowed
        
        switch (type) {
            case 'number':
                return !isNaN(parseFloat(value));
            case 'boolean':
                return ['true', 'false', '1', '0', 'yes', 'no'].includes(value.toLowerCase());
            case 'json':
                try {
                    JSON.parse(value);
                    return true;
                } catch {
                    return false;
                }
            default:
                return true; // string and text are always valid
        }
    },

    /**
     * Import default settings
     */
    async importDefaults() {
        const defaultSettings = [
            { name: 'site_title', title: 'Site Title', value: 'DEEPER HUB CMS', type: 'string', description: 'Main site title' },
            { name: 'site_description', title: 'Site Description', value: 'A powerful CMS system', type: 'text', description: 'Site description for SEO' },
            { name: 'admin_email', title: 'Admin Email', value: 'admin@example.com', type: 'string', description: 'Administrator email address' },
            { name: 'items_per_page', title: 'Items Per Page', value: '20', type: 'number', description: 'Number of items to show per page' },
            { name: 'enable_registration', title: 'Enable Registration', value: 'false', type: 'boolean', description: 'Allow new user registration' },
            { name: 'maintenance_mode', title: 'Maintenance Mode', value: 'false', type: 'boolean', description: 'Enable maintenance mode' },
            { name: 'theme_config', title: 'Theme Configuration', value: '{"primary_color": "#0066cc", "secondary_color": "#666666"}', type: 'json', description: 'Theme configuration JSON' }
        ];

        try {
            let imported = 0;
            for (const setting of defaultSettings) {
                try {
                    await API.settings.create(setting);
                    imported++;
                } catch (error) {
                    console.warn(`Failed to import setting ${setting.name}:`, error);
                }
            }
            
            AdminApp.showNotification(`Imported ${imported} default settings!`, 'success');
            this.refresh();
        } catch (error) {
            AdminApp.showNotification('Error importing defaults: ' + error.message, 'error');
        }
    },

    /**
     * Export settings
     */
    async exportSettings() {
        try {
            const response = await API.settings.list();
            const settings = response.data || [];
            
            const exportData = {
                export_date: new Date().toISOString(),
                settings: settings.map(s => ({
                    name: s.name,
                    title: s.title,
                    description: s.description,
                    type: s.type,
                    value: s.value,
                    default_value: s.default_value,
                    is_active: s.is_active
                }))
            };
            
            const blob = new Blob([JSON.stringify(exportData, null, 2)], { type: 'application/json' });
            const url = URL.createObjectURL(blob);
            
            const a = document.createElement('a');
            a.href = url;
            a.download = `settings_export_${new Date().toISOString().split('T')[0]}.json`;
            document.body.appendChild(a);
            a.click();
            document.body.removeChild(a);
            URL.revokeObjectURL(url);
            
            AdminApp.showNotification('Settings exported successfully!', 'success');
        } catch (error) {
            AdminApp.showNotification('Error exporting settings: ' + error.message, 'error');
        }
    },

    /**
     * Search settings
     */
    async search(query) {
        try {
            const response = await API.settings.list({ search: query });
            const settings = response.data || [];
            
            // Re-render table with filtered results
            const tableContainer = document.querySelector('#panel-settings .tui-fieldset > div');
            if (tableContainer) {
                const columns = [
                    { key: 'id', title: 'ID', type: 'number' },
                    { key: 'name', title: 'Key', formatter: (value) => `<code>${value}</code>` },
                    { key: 'title', title: 'Title' },
                    { key: 'value', title: 'Value', formatter: (value) => this.formatValue(value) },
                    { key: 'type', title: 'Type', formatter: (value) => this.formatType(value) },
                    { key: 'is_active', title: 'Active', type: 'boolean' },
                    {
                        key: 'actions',
                        title: 'Actions',
                        type: 'actions',
                        actions: [
                            { text: 'Edit', class: 'primary', onclick: 'SettingsModule.edit' },
                            { text: 'Delete', class: 'danger', onclick: 'SettingsModule.delete' }
                        ]
                    }
                ];

                const tableHtml = settings.length > 0 ?
                    Components.createTable(settings, columns) :
                    Components.createEmptyState(`No settings found for "${query}"`, 'Create Setting', 'SettingsModule.create()');

                // Update only the table part
                const existingTable = tableContainer.querySelector('.admin-table, .empty-state');
                if (existingTable) {
                    existingTable.outerHTML = tableHtml;
                }
            }
        } catch (error) {
            AdminApp.showNotification('Error searching settings: ' + error.message, 'error');
        }
    },

    /**
     * Refresh settings list
     */
    refresh() {
        const panel = document.getElementById('panel-settings');
        if (panel) {
            this.load(panel);
        }
    }
};

// Expose to global scope
window.SettingsModule = SettingsModule;
