/**
 * DEEPER HUB CMS - Admin Application
 * Main application logic for the admin interface
 */

class AdminApplication {
    constructor() {
        this.currentSection = 'dashboard';
        this.openTabs = new Map();
        this.isDirty = false;
        this.autoSaveInterval = null;
        this.connectionCheckInterval = null;
        
        // Keyboard shortcuts
        this.shortcuts = {
            'F1': () => this.showHelp(),
            'F2': () => this.saveItem(),
            'F3': () => this.openItem(),
            'F5': () => this.refreshView(),
            'F10': () => this.logout(),
            'F11': () => this.toggleFullscreen(),
            'Ctrl+N': () => this.newItem(),
            'Ctrl+O': () => this.openItem(),
            'Ctrl+S': () => this.saveItem(),
            'Ctrl+Z': () => this.undo(),
            'Ctrl+Y': () => this.redo(),
            'Escape': () => this.handleEscape()
        };
    }

    /**
     * Initialize the application
     */
    async init() {
        try {
            this.showNotification('Initializing admin interface...', 'info', 2000);
            
            // Setup event listeners
            this.setupEventListeners();
            
            // Setup keyboard shortcuts
            this.setupKeyboardShortcuts();
            
            // Check authentication
            await this.checkAuthentication();
            
            // Load initial data
            await this.loadDashboard();
            
            // Start background tasks
            this.startBackgroundTasks();
            
            // Update status
            this.updateStatus('Ready');
            this.showNotification('Admin interface loaded successfully', 'success', 3000);
            
        } catch (error) {
            console.error('Failed to initialize admin interface:', error);
            this.showNotification('Failed to initialize admin interface', 'error');
            this.showError('Initialization Error', error.message);
        }
    }

    /**
     * Setup event listeners
     */
    setupEventListeners() {
        // Menu toggle for mobile
        const menuToggle = document.getElementById('menu-toggle');
        if (menuToggle) {
            menuToggle.addEventListener('click', () => {
                const sideMenu = document.getElementById('side-menu');
                sideMenu.classList.toggle('open');
            });
        }

        // Window resize handler
        window.addEventListener('resize', Utils.debounce(() => {
            this.handleResize();
        }, 250));

        // Before unload handler
        window.addEventListener('beforeunload', (e) => {
            if (this.isDirty) {
                e.preventDefault();
                e.returnValue = 'You have unsaved changes. Are you sure you want to leave?';
                return e.returnValue;
            }
        });

        // Online/offline detection
        window.addEventListener('online', () => {
            this.updateConnectionStatus(true);
            this.showNotification('Connection restored', 'success', 3000);
        });

        window.addEventListener('offline', () => {
            this.updateConnectionStatus(false);
            this.showNotification('Connection lost', 'warning');
        });
    }

    /**
     * Setup keyboard shortcuts
     */
    setupKeyboardShortcuts() {
        document.addEventListener('keydown', (e) => {
            const key = this.getKeyCombo(e);
            const handler = this.shortcuts[key];
            
            if (handler) {
                e.preventDefault();
                handler();
            }
        });
    }

    /**
     * Get key combination string
     */
    getKeyCombo(event) {
        const parts = [];
        
        if (event.ctrlKey) parts.push('Ctrl');
        if (event.altKey) parts.push('Alt');
        if (event.shiftKey) parts.push('Shift');
        
        // Special keys
        if (event.key.startsWith('F') && event.key.length <= 3) {
            parts.push(event.key);
        } else if (['Escape', 'Enter', 'Tab'].includes(event.key)) {
            parts.push(event.key);
        } else if (event.key.length === 1) {
            parts.push(event.key.toUpperCase());
        }
        
        return parts.join('+');
    }

    /**
     * Check authentication status
     */
    async checkAuthentication() {
        const token = Utils.storage.get('auth_token');
        if (!token) {
            // For now, we'll skip authentication
            // In production, redirect to login page
            console.log('No authentication token found');
        }
        
        // Set current user info
        const currentUser = document.getElementById('current-user');
        if (currentUser) {
            currentUser.innerHTML = '<span class="green-168-text">●</span> Administrator';
        }
    }

    /**
     * Load dashboard data
     */
    async loadDashboard() {
        const dashboardContent = document.getElementById('dashboard-content');
        const dashboardLoading = document.getElementById('dashboard-loading');
        
        try {
            // Show loading
            dashboardLoading.style.display = 'block';
            dashboardContent.style.display = 'none';
            
            // Load statistics in parallel
            const [
                pagesStats,
                widgetsStats,
                usersStats,
                auditStats,
                recentActivity
            ] = await Promise.all([
                API.pages.list({ limit: 1 }).catch(() => ({ count: 0 })),
                API.widgets.list({ limit: 1 }).catch(() => ({ count: 0 })),
                API.users.list({ limit: 1 }).catch(() => ({ count: 0 })),
                API.audit.statistics().catch(() => ({ data: { total_logs: 0 } })),
                API.audit.recent(24).catch(() => ({ data: [] }))
            ]);
            
            // Render dashboard
            this.renderDashboard({
                pages: pagesStats.count || 0,
                widgets: widgetsStats.count || 0,
                users: usersStats.count || 0,
                auditLogs: auditStats.data?.total_logs || 0,
                recentActivity: recentActivity.data || []
            });
            
            // Hide loading, show content
            dashboardLoading.style.display = 'none';
            dashboardContent.style.display = 'block';
            
        } catch (error) {
            console.error('Failed to load dashboard:', error);
            dashboardLoading.innerHTML = Components.createError(
                'Failed to load dashboard data',
                error.message
            );
        }
    }

    /**
     * Render dashboard content
     */
    renderDashboard(stats) {
        const dashboardContent = document.getElementById('dashboard-content');
        
        const html = `
            <div class="dashboard-stats">
                ${Components.createStatCard('Total Pages', stats.pages, null, 'info')}
                ${Components.createStatCard('Active Widgets', stats.widgets, null, 'success')}
                ${Components.createStatCard('System Users', stats.users, null, 'warning')}
                ${Components.createStatCard('Audit Logs', stats.auditLogs, null, 'secondary')}
            </div>
            
            <div class="row">
                <div class="col-md-8">
                    <fieldset class="tui-fieldset">
                        <legend>System Overview</legend>
                        <div style="padding: 15px;">
                            <h4 class="white-168-text">Welcome to DEEPER HUB CMS</h4>
                            <p class="secondary-text">
                                This is your administration panel. Use the navigation menu to manage your content,
                                users, and system settings.
                            </p>
                            
                            <div style="margin-top: 20px;">
                                <h5 class="cyan-168-text">Quick Actions</h5>
                                <div style="margin-top: 10px;">
                                    <button class="admin-button primary" onclick="AdminApp.showSection('pages')">
                                        📄 Manage Pages
                                    </button>
                                    <button class="admin-button success" onclick="AdminApp.showSection('widgets')">
                                        ⚙ Manage Widgets
                                    </button>
                                    <button class="admin-button warning" onclick="AdminApp.showSection('users')">
                                        👤 Manage Users
                                    </button>
                                    <button class="admin-button secondary" onclick="AdminApp.showSection('settings')">
                                        ⚙ System Settings
                                    </button>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>
                
                <div class="col-md-4">
                    <fieldset class="tui-fieldset">
                        <legend>Recent Activity</legend>
                        <div class="recent-activity">
                            <div class="activity-list">
                                ${this.renderRecentActivity(stats.recentActivity)}
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        `;
        
        dashboardContent.innerHTML = html;
    }

    /**
     * Render recent activity list
     */
    renderRecentActivity(activities) {
        if (!activities || activities.length === 0) {
            return '<div class="activity-item">No recent activity</div>';
        }
        
        return activities.slice(0, 10).map(activity => `
            <div class="activity-item">
                <span class="activity-time">${Utils.timeAgo(activity.created_at)}</span>
                <span class="activity-user">${activity.username || 'System'}</span>
                <span class="activity-action">${activity.action} ${activity.table_name}</span>
            </div>
        `).join('');
    }

    /**
     * Show a specific section
     */
    async showSection(sectionName) {
        try {
            this.updateStatus(`Loading ${sectionName}...`);
            
            // Update navigation
            this.updateNavigation(sectionName);
            
            // Add or switch to tab
            this.addTab(sectionName);
            
            // Load section content
            await this.loadSection(sectionName);
            
            this.currentSection = sectionName;
            this.updateStatus('Ready');
            
        } catch (error) {
            console.error(`Failed to load section ${sectionName}:`, error);
            this.showNotification(`Failed to load ${sectionName}`, 'error');
            this.updateStatus('Error');
        }
    }

    /**
     * Update navigation state
     */
    updateNavigation(sectionName) {
        // Update side menu
        const sideMenu = document.getElementById('side-menu');
        const menuItems = sideMenu.querySelectorAll('a');
        
        menuItems.forEach(item => {
            item.classList.remove('active');
            if (item.getAttribute('onclick')?.includes(sectionName)) {
                item.classList.add('active');
            }
        });
    }

    /**
     * Add or switch to tab
     */
    addTab(sectionName) {
        const tabsContainer = document.getElementById('content-tabs');
        const panelsContainer = document.getElementById('content-panels');
        
        // Check if tab already exists
        let existingTab = tabsContainer.querySelector(`[data-section="${sectionName}"]`);
        
        if (!existingTab) {
            // Create new tab
            const tab = Utils.dom.create('div', {
                className: 'admin-tab',
                'data-section': sectionName,
                innerHTML: `
                    <span class="cyan-168-text">■</span> ${Utils.capitalize(sectionName)}
                    <span class="close-tab" onclick="AdminApp.closeTab('${sectionName}')">×</span>
                `
            });
            
            tab.addEventListener('click', (e) => {
                if (!e.target.classList.contains('close-tab')) {
                    this.switchToTab(sectionName);
                }
            });
            
            tabsContainer.appendChild(tab);
            
            // Create new panel
            const panel = Utils.dom.create('div', {
                className: 'admin-panel',
                id: `panel-${sectionName}`
            });
            
            panelsContainer.appendChild(panel);
            
            this.openTabs.set(sectionName, {
                tab: tab,
                panel: panel,
                isDirty: false
            });
        }
        
        // Switch to tab
        this.switchToTab(sectionName);
    }

    /**
     * Switch to existing tab
     */
    switchToTab(sectionName) {
        const tabsContainer = document.getElementById('content-tabs');
        const panelsContainer = document.getElementById('content-panels');

        // Update tab states
        tabsContainer.querySelectorAll('.admin-tab').forEach(tab => {
            tab.classList.remove('active');
        });

        const targetTab = tabsContainer.querySelector(`[data-section="${sectionName}"]`);
        if (targetTab) {
            targetTab.classList.add('active');
        }

        // Update panel states
        panelsContainer.querySelectorAll('.admin-panel').forEach(panel => {
            panel.classList.remove('active');
        });

        const targetPanel = document.getElementById(`panel-${sectionName}`);
        if (targetPanel) {
            targetPanel.classList.add('active');
        }

        this.currentSection = sectionName;
    }

    /**
     * Close tab
     */
    closeTab(sectionName) {
        const tabInfo = this.openTabs.get(sectionName);

        if (tabInfo && tabInfo.isDirty) {
            const confirmed = confirm('You have unsaved changes. Are you sure you want to close this tab?');
            if (!confirmed) return;
        }

        // Remove tab and panel
        if (tabInfo) {
            tabInfo.tab.remove();
            tabInfo.panel.remove();
            this.openTabs.delete(sectionName);
        }

        // Switch to dashboard if current tab was closed
        if (this.currentSection === sectionName) {
            this.switchToTab('dashboard');
        }
    }

    /**
     * Load section content
     */
    async loadSection(sectionName) {
        const panel = document.getElementById(`panel-${sectionName}`);
        if (!panel) return;

        // Show loading
        panel.innerHTML = Components.createLoader(`Loading ${sectionName}...`);

        try {
            switch (sectionName) {
                case 'pages':
                    await this.loadPagesSection(panel);
                    break;
                case 'widgets':
                    await this.loadWidgetsSection(panel);
                    break;
                case 'forms':
                    await this.loadFormsSection(panel);
                    break;
                case 'menus':
                    await this.loadMenusSection(panel);
                    break;
                case 'media':
                    await this.loadMediaSection(panel);
                    break;
                case 'users':
                    await this.loadUsersSection(panel);
                    break;
                case 'permissions':
                    await this.loadPermissionsSection(panel);
                    break;
                case 'audit':
                    await this.loadAuditSection(panel);
                    break;
                case 'settings':
                    await this.loadSettingsSection(panel);
                    break;
                case 'themes':
                    await this.loadThemesSection(panel);
                    break;
                default:
                    panel.innerHTML = Components.createError(`Unknown section: ${sectionName}`);
            }
        } catch (error) {
            console.error(`Failed to load ${sectionName} section:`, error);
            panel.innerHTML = Components.createError(
                `Failed to load ${sectionName}`,
                error.message
            );
        }
    }

    /**
     * Load pages section
     */
    async loadPagesSection(panel) {
        const response = await API.pages.list();
        const pages = response.data || [];

        const columns = [
            { key: 'id', title: 'ID', type: 'number' },
            { key: 'title', title: 'Title' },
            { key: 'slug', title: 'Slug' },
            { key: 'status', title: 'Status', formatter: (value) =>
                value === 'published' ? '<span class="green-168-text">● Published</span>' :
                '<span class="yellow-168-text">● Draft</span>'
            },
            { key: 'created_at', title: 'Created', type: 'date' },
            {
                key: 'actions',
                title: 'Actions',
                type: 'actions',
                actions: [
                    { text: 'Edit', class: 'primary', onclick: 'AdminApp.editPage' },
                    { text: 'Delete', class: 'danger', onclick: 'AdminApp.deletePage' }
                ]
            }
        ];

        const html = `
            <div class="tui-window full-width">
                <fieldset class="tui-fieldset">
                    <legend class="center">PAGES MANAGEMENT</legend>
                    <div style="padding: 20px;">
                        <div style="margin-bottom: 20px;">
                            <button class="admin-button primary" onclick="AdminApp.createPage()">
                                + New Page
                            </button>
                            <button class="admin-button secondary" onclick="AdminApp.refreshSection('pages')">
                                ↻ Refresh
                            </button>
                        </div>

                        ${Components.createSearchBox('Search pages...', 'AdminApp.searchPages')}

                        ${pages.length > 0 ?
                            Components.createTable(pages, columns) :
                            Components.createEmptyState('No pages found', 'Create Page', 'AdminApp.createPage()')
                        }
                    </div>
                </fieldset>
            </div>
        `;

        panel.innerHTML = html;
    }

    /**
     * Load users section
     */
    async loadUsersSection(panel) {
        const response = await API.users.list();
        const users = response.data || [];

        const columns = [
            { key: 'id', title: 'ID', type: 'number' },
            { key: 'username', title: 'Username' },
            { key: 'email', title: 'Email' },
            { key: 'full_name', title: 'Full Name' },
            { key: 'is_active', title: 'Active', type: 'boolean' },
            { key: 'is_admin', title: 'Admin', type: 'boolean' },
            { key: 'created_at', title: 'Created', type: 'date' },
            {
                key: 'actions',
                title: 'Actions',
                type: 'actions',
                actions: [
                    { text: 'Edit', class: 'primary', onclick: 'AdminApp.editUser' },
                    { text: 'Permissions', class: 'warning', onclick: 'AdminApp.editUserPermissions' },
                    { text: 'Delete', class: 'danger', onclick: 'AdminApp.deleteUser' }
                ]
            }
        ];

        const html = `
            <div class="tui-window full-width">
                <fieldset class="tui-fieldset">
                    <legend class="center">USERS MANAGEMENT</legend>
                    <div style="padding: 20px;">
                        <div style="margin-bottom: 20px;">
                            <button class="admin-button primary" onclick="AdminApp.createUser()">
                                + New User
                            </button>
                            <button class="admin-button secondary" onclick="AdminApp.refreshSection('users')">
                                ↻ Refresh
                            </button>
                        </div>

                        ${Components.createSearchBox('Search users...', 'AdminApp.searchUsers')}

                        ${users.length > 0 ?
                            Components.createTable(users, columns) :
                            Components.createEmptyState('No users found', 'Create User', 'AdminApp.createUser()')
                        }
                    </div>
                </fieldset>
            </div>
        `;

        panel.innerHTML = html;
    }

    /**
     * Utility functions
     */
    showNotification(message, type = 'info', duration = 5000) {
        Components.createNotification(message, type, duration);
    }

    showError(title, message) {
        Components.createModal(title, Components.createError(message), [
            { text: 'Close', onclick: 'Components.closeModal()' }
        ]);
    }

    updateStatus(message) {
        const statusMessage = document.getElementById('status-message');
        if (statusMessage) {
            statusMessage.textContent = message;
        }
    }

    updateConnectionStatus(isOnline) {
        const connectionStatus = document.getElementById('connection-status');
        if (connectionStatus) {
            if (isOnline) {
                connectionStatus.innerHTML = '<span class="green-168-text">● Online</span>';
                connectionStatus.className = '';
            } else {
                connectionStatus.innerHTML = '<span class="red-168-text">● Offline</span>';
                connectionStatus.className = 'offline';
            }
        }
    }

    startBackgroundTasks() {
        // Auto-save every 30 seconds
        this.autoSaveInterval = setInterval(() => {
            if (this.isDirty) {
                this.autoSave();
            }
        }, 30000);

        // Check connection every 60 seconds
        this.connectionCheckInterval = setInterval(() => {
            this.checkConnection();
        }, 60000);
    }

    async checkConnection() {
        try {
            await API.get('/health');
            this.updateConnectionStatus(true);
        } catch {
            this.updateConnectionStatus(false);
        }
    }

    // Keyboard shortcut handlers
    showHelp() {
        const helpContent = `
            <h4>Keyboard Shortcuts</h4>
            <div style="text-align: left; margin: 20px 0;">
                <p><strong>F1</strong> - Show this help</p>
                <p><strong>F2</strong> - Save current item</p>
                <p><strong>F3</strong> - Open item</p>
                <p><strong>F5</strong> - Refresh current view</p>
                <p><strong>F10</strong> - Logout</p>
                <p><strong>F11</strong> - Toggle fullscreen</p>
                <p><strong>Ctrl+N</strong> - Create new item</p>
                <p><strong>Ctrl+S</strong> - Save</p>
                <p><strong>Ctrl+Z</strong> - Undo</p>
                <p><strong>Ctrl+Y</strong> - Redo</p>
                <p><strong>ESC</strong> - Cancel/Close</p>
            </div>
        `;

        Components.createModal('Help - Keyboard Shortcuts', helpContent, [
            { text: 'Close', onclick: 'Components.closeModal()' }
        ]);
    }

    saveItem() {
        this.showNotification('Save functionality not implemented yet', 'warning');
    }

    openItem() {
        this.showNotification('Open functionality not implemented yet', 'warning');
    }

    newItem() {
        this.showNotification('New item functionality not implemented yet', 'warning');
    }

    refreshView() {
        if (this.currentSection) {
            this.loadSection(this.currentSection);
            this.showNotification('View refreshed', 'success', 2000);
        }
    }

    toggleFullscreen() {
        if (document.fullscreenElement) {
            document.exitFullscreen();
        } else {
            document.documentElement.requestFullscreen();
        }
    }

    undo() {
        this.showNotification('Undo functionality not implemented yet', 'warning');
    }

    redo() {
        this.showNotification('Redo functionality not implemented yet', 'warning');
    }

    handleEscape() {
        // Close any open modals
        const modalContainer = document.getElementById('modal-container');
        if (modalContainer.classList.contains('active')) {
            Components.closeModal();
        }
    }

    logout() {
        Components.confirm(
            'Are you sure you want to logout?',
            'Confirm Logout',
            () => {
                Utils.storage.remove('auth_token');
                window.location.href = '/login.html';
            }
        );
    }

    handleResize() {
        // Handle responsive layout changes
        const sideMenu = document.getElementById('side-menu');
        if (window.innerWidth <= 768) {
            sideMenu.classList.remove('open');
        }
    }

    autoSave() {
        // Auto-save implementation
        console.log('Auto-saving...');
        this.isDirty = false;
    }
}

// Create global instance
const AdminApp = new AdminApplication();
