/**
 * Main application controller
 */
window.App = {
    
    currentModule: null,
    modules: {},

    /**
     * Initialize the application
     */
    init() {
        this.bindEvents();
        this.registerModules();
        this.initializeUI();
    },

    /**
     * Bind global events
     */
    bindEvents() {
        // Sidebar navigation
        $('.nav-link').on('click', (e) => {
            e.preventDefault();
            const module = $(e.currentTarget).data('module');
            this.loadModule(module);
        });

        // Sidebar toggle for mobile
        $('#sidebarToggle').on('click', () => {
            $('#sidebar').toggleClass('open');
        });

        // Modal close events
        $('#modalClose, .modal-backdrop').on('click', () => {
            Utils.hideModal();
        });

        // Prevent modal close when clicking inside modal
        $('.modal').on('click', (e) => {
            e.stopPropagation();
        });

        // Keyboard shortcuts
        $(document).on('keydown', (e) => {
            // ESC to close modal
            if (e.key === 'Escape') {
                Utils.hideModal();
                $('#confirmDialog').hide();
            }
        });

        // Handle browser back/forward
        window.addEventListener('popstate', (e) => {
            const params = Utils.getUrlParams();
            if (params.module) {
                this.loadModule(params.module, false);
            }
        });
    },

    /**
     * Register all modules
     */
    registerModules() {
        this.modules = {
            dashboard: window.Dashboard,
            pages: window.Pages,
            forms: window.Forms,
            widgets: window.Widgets,
            media: window.Media,
            menus: window.Menus,
            users: window.Users,
            settings: window.Settings,
            audit: window.Audit
        };
    },

    /**
     * Initialize UI components
     */
    initializeUI() {
        // Initialize tooltips if any
        this.initTooltips();
        
        // Set initial module from URL
        const params = Utils.getUrlParams();
        const initialModule = params.module || 'dashboard';
        this.loadModule(initialModule, false);
    },

    /**
     * Initialize tooltips
     */
    initTooltips() {
        // Simple tooltip implementation
        $(document).on('mouseenter', '[data-tooltip]', function() {
            const tooltip = $(this).data('tooltip');
            const $tooltip = $(`<div class="tooltip">${tooltip}</div>`);
            $('body').append($tooltip);
            
            const rect = this.getBoundingClientRect();
            $tooltip.css({
                position: 'absolute',
                top: rect.top - $tooltip.outerHeight() - 5,
                left: rect.left + (rect.width / 2) - ($tooltip.outerWidth() / 2),
                zIndex: 10000
            });
        });

        $(document).on('mouseleave', '[data-tooltip]', function() {
            $('.tooltip').remove();
        });
    },

    /**
     * Load a module
     */
    async loadModule(moduleName, updateUrl = true) {
        if (!moduleName || !this.modules[moduleName]) {
            console.error('Module not found:', moduleName);
            return;
        }

        try {
            // Update navigation
            $('.nav-link').removeClass('active');
            $(`.nav-link[data-module="${moduleName}"]`).addClass('active');

            // Update URL
            if (updateUrl) {
                Utils.updateUrl({ module: moduleName });
            }

            // Clear alerts
            Utils.clearAlerts();

            // Show loading
            $('#moduleContent').html('<div class="p-20 text-center"><i class="fas fa-spinner fa-spin"></i> Loading...</div>');

            // Load module
            const module = this.modules[moduleName];
            if (module && typeof module.init === 'function') {
                await module.init();
                this.currentModule = moduleName;
            } else {
                throw new Error(`Module ${moduleName} does not have an init method`);
            }

        } catch (error) {
            console.error('Error loading module:', error);
            Utils.showError(`Failed to load ${moduleName} module: ${error.message}`);
            
            // Fallback to dashboard
            if (moduleName !== 'dashboard') {
                this.loadModule('dashboard');
            }
        }
    },

    /**
     * Get current module
     */
    getCurrentModule() {
        return this.currentModule;
    },

    /**
     * Reload current module
     */
    reloadCurrentModule() {
        if (this.currentModule) {
            this.loadModule(this.currentModule, false);
        }
    },

    /**
     * Show module content
     */
    showModuleContent(html) {
        $('#moduleContent').html(html);
    },

    /**
     * Create standard module header
     */
    createModuleHeader(title, actions = []) {
        let html = `
            <div class="module-header p-20" style="border-bottom: 1px solid #dee2e6;">
                <div class="d-flex justify-content-between align-items-center">
                    <h2 style="margin: 0;">${title}</h2>
                    <div class="module-actions d-flex gap-10">
        `;

        actions.forEach(action => {
            html += `<button class="btn ${action.class || 'btn-primary'}" onclick="${action.onclick}">
                ${action.icon ? `<i class="${action.icon}"></i> ` : ''}${action.text}
            </button>`;
        });

        html += `
                    </div>
                </div>
            </div>
        `;

        return html;
    },

    /**
     * Create standard data table
     */
    createDataTable(columns, data, actions = {}) {
        let html = '<div class="table-responsive">';
        html += '<table class="table">';
        
        // Header
        html += '<thead><tr>';
        columns.forEach(col => {
            html += `<th>${col.title}</th>`;
        });
        if (actions.edit || actions.delete || actions.custom) {
            html += '<th width="150">Actions</th>';
        }
        html += '</tr></thead>';
        
        // Body
        html += '<tbody>';
        if (data && data.length > 0) {
            data.forEach(row => {
                html += '<tr>';
                columns.forEach(col => {
                    let value = row[col.field];
                    
                    // Apply formatter if provided
                    if (col.formatter && typeof col.formatter === 'function') {
                        value = col.formatter(value, row);
                    } else if (col.type === 'date') {
                        value = Utils.formatDate(value);
                    } else if (col.type === 'boolean') {
                        value = value ? 
                            '<span class="badge badge-success">Yes</span>' : 
                            '<span class="badge badge-secondary">No</span>';
                    } else if (col.type === 'badge') {
                        const badgeClass = value ? 'badge-success' : 'badge-secondary';
                        const badgeText = value ? 'Active' : 'Inactive';
                        value = `<span class="badge ${badgeClass}">${badgeText}</span>`;
                    }
                    
                    html += `<td>${value || ''}</td>`;
                });
                
                // Actions column
                if (actions.edit || actions.delete || actions.custom) {
                    html += '<td>';
                    
                    if (actions.edit) {
                        html += `<button class="btn btn-primary btn-sm" onclick="${actions.edit}(${row.id})" data-tooltip="Edit">
                            <i class="fas fa-edit"></i>
                        </button> `;
                    }
                    
                    if (actions.delete) {
                        html += `<button class="btn btn-danger btn-sm" onclick="${actions.delete}(${row.id})" data-tooltip="Delete">
                            <i class="fas fa-trash"></i>
                        </button> `;
                    }
                    
                    if (actions.custom) {
                        actions.custom.forEach(customAction => {
                            html += `<button class="btn ${customAction.class || 'btn-secondary'} btn-sm" 
                                onclick="${customAction.onclick}(${row.id})" data-tooltip="${customAction.tooltip || ''}">
                                <i class="${customAction.icon}"></i>
                            </button> `;
                        });
                    }
                    
                    html += '</td>';
                }
                
                html += '</tr>';
            });
        } else {
            const colspan = columns.length + (actions.edit || actions.delete || actions.custom ? 1 : 0);
            html += `<tr><td colspan="${colspan}" class="text-center p-20">No data available</td></tr>`;
        }
        html += '</tbody>';
        
        html += '</table>';
        html += '</div>';
        
        return html;
    },

    /**
     * Create search and filter bar
     */
    createSearchBar(placeholder = 'Search...', filters = []) {
        let html = `
            <div class="search-bar p-20" style="background: #f8f9fa; border-bottom: 1px solid #dee2e6;">
                <div class="d-flex gap-10 align-items-center">
                    <div class="search-input" style="flex: 1;">
                        <input type="text" id="searchInput" class="form-control" placeholder="${placeholder}">
                    </div>
        `;

        if (filters.length > 0) {
            filters.forEach(filter => {
                html += `
                    <div class="filter-select">
                        <select id="${filter.id}" class="form-control">
                            <option value="">${filter.placeholder}</option>
                `;
                
                if (filter.options) {
                    filter.options.forEach(option => {
                        html += `<option value="${option.value}">${option.text}</option>`;
                    });
                }
                
                html += `
                        </select>
                    </div>
                `;
            });
        }

        html += `
                    <button class="btn btn-primary" onclick="App.getCurrentModuleInstance().search()">
                        <i class="fas fa-search"></i> Search
                    </button>
                    <button class="btn btn-secondary" onclick="App.getCurrentModuleInstance().clearSearch()">
                        <i class="fas fa-times"></i> Clear
                    </button>
                </div>
            </div>
        `;

        return html;
    },

    /**
     * Get current module instance
     */
    getCurrentModuleInstance() {
        return this.modules[this.currentModule];
    },

    /**
     * Handle global errors
     */
    handleError(error, context = '') {
        console.error(`Error in ${context}:`, error);
        Utils.handleApiError(error);
    },

    /**
     * Show confirmation before dangerous actions
     */
    async confirmDangerousAction(message, actionName = 'delete') {
        const confirmed = await Utils.confirm(
            message,
            `Confirm ${actionName.charAt(0).toUpperCase() + actionName.slice(1)}`
        );
        return confirmed;
    },

    /**
     * Format data for display
     */
    formatters: {
        date: (value) => Utils.formatDate(value),
        fileSize: (value) => Utils.formatFileSize(value),
        truncate: (value, length = 50) => Utils.truncate(value, length),
        badge: (value, trueText = 'Active', falseText = 'Inactive') => {
            const badgeClass = value ? 'badge-success' : 'badge-secondary';
            const badgeText = value ? trueText : falseText;
            return `<span class="badge ${badgeClass}">${badgeText}</span>`;
        },
        link: (value, url) => `<a href="${url}" target="_blank">${value}</a>`
    }
};

// Initialize app when document is ready
$(document).ready(() => {
    App.init();
});
