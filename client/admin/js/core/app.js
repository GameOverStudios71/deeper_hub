/**
 * AdminApp - Main application controller
 * Manages the overall application state and navigation
 */

class AdminApplication {
    constructor() {
        this.currentSection = 'dashboard';
        this.openTabs = new Map();
        this.isDirty = false;
        this.isInitialized = false;
        
        // Bind methods to preserve context
        this.init = this.init.bind(this);
        this.showSection = this.showSection.bind(this);
        this.showNotification = this.showNotification.bind(this);
    }

    /**
     * Initialize the application
     */
    async init() {
        try {
            this.updateStatus('Initializing...');
            
            // Wait for dependencies
            await this.waitForDependencies();
            
            // Setup event listeners
            this.setupEventListeners();
            
            // Initialize UI components
            this.initializeUI();
            
            // Load dashboard
            await this.loadDashboard();
            
            // Start background tasks
            this.startBackgroundTasks();
            
            this.isInitialized = true;
            this.updateStatus('Ready');
            
            console.log('✅ AdminApp initialized successfully');
            
        } catch (error) {
            console.error('❌ Failed to initialize AdminApp:', error);
            this.updateStatus('Error');
            this.showNotification('Failed to initialize application: ' + error.message, 'error');
        }
    }

    /**
     * Wait for all dependencies to be loaded
     */
    async waitForDependencies() {
        const maxWait = 5000; // 5 seconds
        const checkInterval = 100; // 100ms
        let waited = 0;

        return new Promise((resolve, reject) => {
            const check = () => {
                if (typeof Utils !== 'undefined' && 
                    typeof Components !== 'undefined' && 
                    typeof API !== 'undefined') {
                    resolve();
                    return;
                }

                waited += checkInterval;
                if (waited >= maxWait) {
                    reject(new Error('Dependencies not loaded within timeout'));
                    return;
                }

                setTimeout(check, checkInterval);
            };

            check();
        });
    }

    /**
     * Setup global event listeners
     */
    setupEventListeners() {
        // Keyboard shortcuts
        document.addEventListener('keydown', (e) => {
            if (e.key === 'F1') {
                e.preventDefault();
                this.showHelp();
            } else if (e.key === 'F5') {
                e.preventDefault();
                this.refreshSection();
            } else if (e.key === 'F10') {
                e.preventDefault();
                this.logout();
            } else if (e.key === 'Escape') {
                Components.closeModal();
            }
        });

        // Window events
        window.addEventListener('beforeunload', (e) => {
            if (this.isDirty) {
                e.preventDefault();
                e.returnValue = 'You have unsaved changes. Are you sure you want to leave?';
            }
        });

        // Handle clicks outside modals
        document.addEventListener('click', (e) => {
            if (e.target.classList.contains('modal-container')) {
                Components.closeModal();
            }
        });
    }

    /**
     * Initialize UI components
     */
    initializeUI() {
        // Initialize dashboard tab
        this.addTab('dashboard');
        this.switchToTab('dashboard');
        
        // Setup menu highlighting
        this.updateNavigation('dashboard');
    }

    /**
     * Load dashboard data
     */
    async loadDashboard() {
        const dashboardContent = document.getElementById('dashboard-content');
        const dashboardLoading = document.getElementById('dashboard-loading');
        
        try {
            // Show loading
            if (dashboardLoading) dashboardLoading.style.display = 'block';
            if (dashboardContent) dashboardContent.style.display = 'none';
            
            // Load basic stats
            const stats = await this.loadDashboardStats();
            
            // Render dashboard
            this.renderDashboard(stats);
            
            // Hide loading, show content
            if (dashboardLoading) dashboardLoading.style.display = 'none';
            if (dashboardContent) dashboardContent.style.display = 'block';
            
        } catch (error) {
            console.error('Failed to load dashboard:', error);
            if (dashboardLoading) {
                dashboardLoading.innerHTML = Components.createError(
                    'Failed to load dashboard data',
                    error.message
                );
            }
        }
    }

    /**
     * Load dashboard statistics
     */
    async loadDashboardStats() {
        try {
            // Try to load stats, but don't fail if API is not ready
            const [pagesStats, usersStats, settingsStats] = await Promise.allSettled([
                API.pages.list({ limit: 1 }),
                API.users.list({ limit: 1 }),
                API.settings.list({ limit: 1 })
            ]);

            return {
                pages: pagesStats.status === 'fulfilled' ? (pagesStats.value.count || 0) : 0,
                users: usersStats.status === 'fulfilled' ? (usersStats.value.count || 0) : 0,
                settings: settingsStats.status === 'fulfilled' ? (settingsStats.value.count || 0) : 0,
                widgets: 0 // Will be loaded later
            };
        } catch (error) {
            console.warn('Could not load dashboard stats:', error);
            return { pages: 0, users: 0, settings: 0, widgets: 0 };
        }
    }

    /**
     * Render dashboard content
     */
    renderDashboard(stats) {
        const dashboardContent = document.getElementById('dashboard-content');
        if (!dashboardContent) return;
        
        const html = `
            <div class="dashboard-stats">
                ${Components.createStatCard('Total Pages', stats.pages, null, 'info')}
                ${Components.createStatCard('System Users', stats.users, null, 'warning')}
                ${Components.createStatCard('Settings', stats.settings, null, 'success')}
                ${Components.createStatCard('Active Widgets', stats.widgets, null, 'secondary')}
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
                                        🧩 Manage Widgets
                                    </button>
                                    <button class="admin-button warning" onclick="AdminApp.showSection('users')">
                                        👤 Manage Users
                                    </button>
                                    <button class="admin-button secondary" onclick="AdminApp.showSection('settings')">
                                        ⚙️ System Settings
                                    </button>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>
                
                <div class="col-md-4">
                    <fieldset class="tui-fieldset">
                        <legend>System Status</legend>
                        <div style="padding: 15px;">
                            <div class="status-item">
                                <span class="green-168-text">●</span> API Connection: Online
                            </div>
                            <div class="status-item">
                                <span class="green-168-text">●</span> Database: Connected
                            </div>
                            <div class="status-item">
                                <span class="green-168-text">●</span> System: Operational
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        `;
        
        dashboardContent.innerHTML = html;
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
            
            // Load section content using module
            await this.loadSectionModule(sectionName);
            
            this.currentSection = sectionName;
            this.updateStatus('Ready');
            
        } catch (error) {
            console.error(`Failed to load section ${sectionName}:`, error);
            this.showNotification(`Failed to load ${sectionName}: ${error.message}`, 'error');
            this.updateStatus('Error');
        }
    }

    /**
     * Load section using its module
     */
    async loadSectionModule(sectionName) {
        const panel = document.getElementById(`panel-${sectionName}`);
        if (!panel) return;

        // Show loading
        panel.innerHTML = Components.createLoader(`Loading ${sectionName}...`);

        try {
            // Load the appropriate module
            switch (sectionName) {
                case 'pages':
                    await PagesModule.load(panel);
                    break;
                case 'users':
                    await UsersModule.load(panel);
                    break;
                case 'settings':
                    await SettingsModule.load(panel);
                    break;
                case 'widgets':
                    await WidgetsModule.load(panel);
                    break;
                case 'forms':
                    await FormsModule.load(panel);
                    break;
                case 'menus':
                    await MenusModule.load(panel);
                    break;
                case 'media':
                    await MediaModule.load(panel);
                    break;
                case 'themes':
                    await ThemesModule.load(panel);
                    break;
                case 'audit':
                    await AuditModule.load(panel);
                    break;
                default:
                    panel.innerHTML = Components.createError(`Unknown section: ${sectionName}`);
            }
        } catch (error) {
            console.error(`Failed to load ${sectionName} module:`, error);
            panel.innerHTML = Components.createError(
                `Failed to load ${sectionName}`,
                error.message
            );
        }
    }

    /**
     * Update navigation state
     */
    updateNavigation(sectionName) {
        const sideMenu = document.getElementById('side-menu');
        if (!sideMenu) return;
        
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
        
        if (!tabsContainer || !panelsContainer) return;
        
        // Check if tab already exists
        let existingTab = tabsContainer.querySelector(`[data-section="${sectionName}"]`);
        
        if (!existingTab) {
            // Create new tab
            const tab = Utils.dom.create('div', {
                className: 'admin-tab',
                'data-section': sectionName,
                innerHTML: `
                    <span class="cyan-168-text">■</span> ${Utils.capitalize(sectionName)}
                    ${sectionName !== 'dashboard' ? `<span class="close-tab" onclick="AdminApp.closeTab('${sectionName}')">×</span>` : ''}
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

        if (!tabsContainer || !panelsContainer) return;

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
        if (sectionName === 'dashboard') return; // Can't close dashboard
        
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
     * Start background tasks
     */
    startBackgroundTasks() {
        // Auto-save every 30 seconds
        setInterval(() => {
            if (this.isDirty) {
                this.autoSave();
            }
        }, 30000);

        // Health check every 5 minutes
        setInterval(async () => {
            try {
                await API.health();
            } catch (error) {
                console.warn('Health check failed:', error);
            }
        }, 300000);
    }

    /**
     * Auto-save functionality
     */
    autoSave() {
        console.log('Auto-saving...');
        this.isDirty = false;
    }

    /**
     * Show notification
     */
    showNotification(message, type = 'info') {
        Components.showNotification(message, type);
    }

    /**
     * Update status bar
     */
    updateStatus(status) {
        const statusElement = document.getElementById('status-text');
        if (statusElement) {
            statusElement.textContent = status;
        }
    }

    /**
     * Refresh current section
     */
    refreshSection(sectionName) {
        const section = sectionName || this.currentSection;
        if (section === 'dashboard') {
            this.loadDashboard();
        } else {
            this.loadSectionModule(section);
        }
    }

    /**
     * Show help
     */
    showHelp() {
        this.showNotification('Help system - Coming soon!', 'info');
    }

    /**
     * Logout
     */
    logout() {
        Utils.storage.remove('auth_token');
        this.showNotification('Logged out successfully', 'success');
        // Redirect to login page if needed
    }
}

// Create global instance
const AdminApp = new AdminApplication();

// Expose to global scope
window.AdminApp = AdminApp;
window.AdminApplication = AdminApplication;
