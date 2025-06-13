/**
 * Users Module
 * Handles all users-related functionality
 */

const UsersModule = {
    
    /**
     * Load users section
     */
    async load(panel) {
        try {
            const response = await API.users.list();
            const users = response.data || [];

            const columns = [
                { key: 'id', title: 'ID', type: 'number' },
                { key: 'username', title: 'Username' },
                { key: 'email', title: 'Email' },
                { key: 'full_name', title: 'Full Name' },
                { key: 'is_admin', title: 'Admin', type: 'boolean' },
                { key: 'is_active', title: 'Active', type: 'boolean' },
                { key: 'created_at', title: 'Created', type: 'date' },
                {
                    key: 'actions',
                    title: 'Actions',
                    type: 'actions',
                    actions: [
                        { text: 'Edit', class: 'primary', onclick: 'UsersModule.edit' },
                        { text: 'Delete', class: 'danger', onclick: 'UsersModule.delete' }
                    ]
                }
            ];

            const html = `
                <div class="tui-window full-width">
                    <fieldset class="tui-fieldset">
                        <legend class="center">USERS MANAGEMENT</legend>
                        <div style="padding: 20px;">
                            <div style="margin-bottom: 20px;">
                                <button class="admin-button primary" onclick="UsersModule.create()">
                                    + New User
                                </button>
                                <button class="admin-button secondary" onclick="UsersModule.refresh()">
                                    ↻ Refresh
                                </button>
                            </div>

                            ${Components.createSearchBox('Search users...', 'UsersModule.search')}

                            ${users.length > 0 ?
                                Components.createTable(users, columns) :
                                Components.createEmptyState('No users found', 'Create User', 'UsersModule.create()')
                            }
                        </div>
                    </fieldset>
                </div>
            `;

            panel.innerHTML = html;
            
        } catch (error) {
            console.error('Failed to load users:', error);
            panel.innerHTML = Components.createError('Failed to load users', error.message);
        }
    },

    /**
     * Create new user
     */
    create() {
        const fields = [
            { name: 'username', label: 'Username', type: 'text', required: true },
            { name: 'email', label: 'Email', type: 'email', required: true },
            { name: 'full_name', label: 'Full Name', type: 'text', required: true },
            { name: 'password', label: 'Password', type: 'password', required: true },
            { name: 'password_confirm', label: 'Confirm Password', type: 'password', required: true },
            { name: 'is_admin', label: 'Administrator', type: 'checkbox' },
            { name: 'is_active', label: 'Active', type: 'checkbox', default: true }
        ];

        const formHtml = Components.createForm(fields);
        
        Components.createModal('Create New User', formHtml, [
            { text: 'Cancel', onclick: 'Components.closeModal()' },
            { text: 'Create', class: 'primary', onclick: 'UsersModule.save()' }
        ]);
    },

    /**
     * Edit existing user
     */
    async edit(id) {
        try {
            const response = await API.users.get(id);
            const user = response.data;

            const fields = [
                { name: 'id', type: 'hidden', default: user.id },
                { name: 'username', label: 'Username', type: 'text', required: true, default: user.username },
                { name: 'email', label: 'Email', type: 'email', required: true, default: user.email },
                { name: 'full_name', label: 'Full Name', type: 'text', required: true, default: user.full_name },
                { name: 'password', label: 'New Password (leave blank to keep current)', type: 'password' },
                { name: 'password_confirm', label: 'Confirm New Password', type: 'password' },
                { name: 'is_admin', label: 'Administrator', type: 'checkbox', default: user.is_admin },
                { name: 'is_active', label: 'Active', type: 'checkbox', default: user.is_active }
            ];

            const formHtml = Components.createForm(fields, user);
            
            Components.createModal('Edit User', formHtml, [
                { text: 'Cancel', onclick: 'Components.closeModal()' },
                { text: 'Update', class: 'primary', onclick: 'UsersModule.update()' }
            ]);
            
        } catch (error) {
            AdminApp.showNotification('Error loading user: ' + error.message, 'error');
        }
    },

    /**
     * Delete user
     */
    delete(id) {
        Components.confirm(
            'Are you sure you want to delete this user? This action cannot be undone.',
            'Delete User',
            async () => {
                try {
                    await API.users.delete(id);
                    AdminApp.showNotification('User deleted successfully!', 'success');
                    this.refresh();
                } catch (error) {
                    AdminApp.showNotification('Error deleting user: ' + error.message, 'error');
                }
            }
        );
    },

    /**
     * Save new user
     */
    async save() {
        try {
            const formData = Components.getFormData();
            
            // Validate required fields
            if (!formData.username || !formData.email || !formData.full_name || !formData.password) {
                AdminApp.showNotification('All required fields must be filled', 'error');
                return;
            }

            // Validate password confirmation
            if (formData.password !== formData.password_confirm) {
                AdminApp.showNotification('Passwords do not match', 'error');
                return;
            }

            // Remove password confirmation from data
            delete formData.password_confirm;

            // Hash password (simple client-side hashing for demo)
            formData.password_hash = await this.hashPassword(formData.password);
            delete formData.password;

            const response = await API.users.create(formData);
            
            if (response.status === 'success') {
                AdminApp.showNotification('User created successfully!', 'success');
                Components.closeModal();
                this.refresh();
            } else {
                AdminApp.showNotification('Failed to create user', 'error');
            }
        } catch (error) {
            console.error('Error creating user:', error);
            AdminApp.showNotification('Error creating user: ' + error.message, 'error');
        }
    },

    /**
     * Update existing user
     */
    async update() {
        try {
            const formData = Components.getFormData();
            const id = formData.id;
            delete formData.id; // Remove ID from update data

            // Validate password confirmation if password is being changed
            if (formData.password) {
                if (formData.password !== formData.password_confirm) {
                    AdminApp.showNotification('Passwords do not match', 'error');
                    return;
                }

                // Hash new password
                formData.password_hash = await this.hashPassword(formData.password);
                delete formData.password;
            }

            // Remove password confirmation from data
            delete formData.password_confirm;

            const response = await API.users.update(id, formData);
            
            if (response.status === 'success') {
                AdminApp.showNotification('User updated successfully!', 'success');
                Components.closeModal();
                this.refresh();
            } else {
                AdminApp.showNotification('Failed to update user', 'error');
            }
        } catch (error) {
            console.error('Error updating user:', error);
            AdminApp.showNotification('Error updating user: ' + error.message, 'error');
        }
    },

    /**
     * Simple password hashing (for demo purposes)
     * In production, this should be done on the server
     */
    async hashPassword(password) {
        const encoder = new TextEncoder();
        const data = encoder.encode(password);
        const hash = await crypto.subtle.digest('SHA-256', data);
        return Array.from(new Uint8Array(hash))
            .map(b => b.toString(16).padStart(2, '0'))
            .join('');
    },

    /**
     * Search users
     */
    async search(query) {
        try {
            const response = await API.users.list({ search: query });
            const users = response.data || [];
            
            // Re-render table with filtered results
            const tableContainer = document.querySelector('#panel-users .tui-fieldset > div');
            if (tableContainer) {
                const columns = [
                    { key: 'id', title: 'ID', type: 'number' },
                    { key: 'username', title: 'Username' },
                    { key: 'email', title: 'Email' },
                    { key: 'full_name', title: 'Full Name' },
                    { key: 'is_admin', title: 'Admin', type: 'boolean' },
                    { key: 'is_active', title: 'Active', type: 'boolean' },
                    { key: 'created_at', title: 'Created', type: 'date' },
                    {
                        key: 'actions',
                        title: 'Actions',
                        type: 'actions',
                        actions: [
                            { text: 'Edit', class: 'primary', onclick: 'UsersModule.edit' },
                            { text: 'Delete', class: 'danger', onclick: 'UsersModule.delete' }
                        ]
                    }
                ];

                const tableHtml = users.length > 0 ?
                    Components.createTable(users, columns) :
                    Components.createEmptyState(`No users found for "${query}"`, 'Create User', 'UsersModule.create()');

                // Update only the table part
                const existingTable = tableContainer.querySelector('.admin-table, .empty-state');
                if (existingTable) {
                    existingTable.outerHTML = tableHtml;
                }
            }
        } catch (error) {
            AdminApp.showNotification('Error searching users: ' + error.message, 'error');
        }
    },

    /**
     * Refresh users list
     */
    refresh() {
        const panel = document.getElementById('panel-users');
        if (panel) {
            this.load(panel);
        }
    }
};

// Create placeholder modules for other sections
const SettingsModule = {
    async load(panel) {
        try {
            const response = await API.settings.list();
            const settings = response.data || [];

            const columns = [
                { key: 'id', title: 'ID', type: 'number' },
                { key: 'name', title: 'Key' },
                { key: 'title', title: 'Title' },
                { key: 'value', title: 'Value', formatter: (value) => Utils.truncate(value, 50) },
                { key: 'is_active', title: 'Active', type: 'boolean' },
                {
                    key: 'actions',
                    title: 'Actions',
                    type: 'actions',
                    actions: [
                        { text: 'Edit', class: 'primary', onclick: 'SettingsModule.edit' }
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
                            </div>

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

    create() {
        AdminApp.showNotification('Settings creation - Coming soon!', 'info');
    },

    edit(id) {
        AdminApp.showNotification('Settings editing - Coming soon!', 'info');
    },

    refresh() {
        const panel = document.getElementById('panel-settings');
        if (panel) {
            this.load(panel);
        }
    }
};

// Placeholder modules for other sections
const WidgetsModule = {
    async load(panel) {
        panel.innerHTML = Components.createEmptyState('Widgets module - Coming soon!', 'Go to Dashboard', 'AdminApp.showSection("dashboard")');
    }
};

const FormsModule = {
    async load(panel) {
        panel.innerHTML = Components.createEmptyState('Forms module - Coming soon!', 'Go to Dashboard', 'AdminApp.showSection("dashboard")');
    }
};

const MenusModule = {
    async load(panel) {
        panel.innerHTML = Components.createEmptyState('Menus module - Coming soon!', 'Go to Dashboard', 'AdminApp.showSection("dashboard")');
    }
};

const MediaModule = {
    async load(panel) {
        panel.innerHTML = Components.createEmptyState('Media module - Coming soon!', 'Go to Dashboard', 'AdminApp.showSection("dashboard")');
    }
};

const ThemesModule = {
    async load(panel) {
        panel.innerHTML = Components.createEmptyState('Themes module - Coming soon!', 'Go to Dashboard', 'AdminApp.showSection("dashboard")');
    }
};

const AuditModule = {
    async load(panel) {
        panel.innerHTML = Components.createEmptyState('Audit module - Coming soon!', 'Go to Dashboard', 'AdminApp.showSection("dashboard")');
    }
};

// Expose to global scope
window.UsersModule = UsersModule;
window.SettingsModule = SettingsModule;
window.WidgetsModule = WidgetsModule;
window.FormsModule = FormsModule;
window.MenusModule = MenusModule;
window.MediaModule = MediaModule;
window.ThemesModule = ThemesModule;
window.AuditModule = AuditModule;
