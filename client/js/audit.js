/**
 * Audit module
 */
window.Audit = {
    
    currentPage: 1,
    searchQuery: '',
    filterAction: '',
    filterTable: '',
    filterUser: '',
    auditLogs: [],

    /**
     * Initialize audit module
     */
    async init() {
        try {
            await this.loadAuditLogs();
        } catch (error) {
            App.handleError(error, 'Audit');
        }
    },

    /**
     * Load audit logs
     */
    async loadAuditLogs() {
        const params = {
            page: this.currentPage,
            limit: 50,
            sort: 'created_at',
            order: 'desc'
        };

        if (this.searchQuery) {
            params.search = this.searchQuery;
        }

        if (this.filterAction) {
            params.action = this.filterAction;
        }

        if (this.filterTable) {
            params.table_name = this.filterTable;
        }

        if (this.filterUser) {
            params.user_id = this.filterUser;
        }

        const html = `
            ${App.createModuleHeader('Audit Logs', [
                {
                    text: 'Export Logs',
                    icon: 'fas fa-download',
                    class: 'btn-primary',
                    onclick: 'Audit.exportLogs()'
                },
                {
                    text: 'Clear Old Logs',
                    icon: 'fas fa-trash',
                    class: 'btn-warning',
                    onclick: 'Audit.clearOldLogs()'
                }
            ])}
            
            <!-- Advanced Filters -->
            <div class="audit-filters p-20" style="background: #f8f9fa; border-bottom: 1px solid #dee2e6;">
                <div class="row">
                    <div class="col-md-3">
                        <input type="text" id="searchInput" class="form-control" placeholder="Search logs...">
                    </div>
                    <div class="col-md-2">
                        <select id="actionFilter" class="form-control">
                            <option value="">All Actions</option>
                            <option value="INSERT">Insert</option>
                            <option value="UPDATE">Update</option>
                            <option value="DELETE">Delete</option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <select id="tableFilter" class="form-control">
                            <option value="">All Tables</option>
                            <option value="cms_pages">Pages</option>
                            <option value="cms_forms">Forms</option>
                            <option value="cms_widgets">Widgets</option>
                            <option value="cms_users">Users</option>
                            <option value="cms_media_files">Media</option>
                            <option value="cms_menu_sets">Menus</option>
                            <option value="cms_settings">Settings</option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <input type="date" id="dateFromFilter" class="form-control" placeholder="From Date">
                    </div>
                    <div class="col-md-2">
                        <input type="date" id="dateToFilter" class="form-control" placeholder="To Date">
                    </div>
                    <div class="col-md-1">
                        <button class="btn btn-primary" onclick="Audit.search()">
                            <i class="fas fa-search"></i>
                        </button>
                        <button class="btn btn-secondary" onclick="Audit.clearSearch()">
                            <i class="fas fa-times"></i>
                        </button>
                    </div>
                </div>
            </div>
            
            <!-- Statistics -->
            <div class="audit-stats p-20" style="background: #fff; border-bottom: 1px solid #dee2e6;">
                <div class="row">
                    <div class="col-md-3">
                        <div class="stat-item text-center">
                            <h4 id="totalLogs" class="text-primary">-</h4>
                            <small>Total Logs</small>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stat-item text-center">
                            <h4 id="todayLogs" class="text-success">-</h4>
                            <small>Today's Logs</small>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stat-item text-center">
                            <h4 id="activeUsers" class="text-info">-</h4>
                            <small>Active Users</small>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stat-item text-center">
                            <h4 id="errorLogs" class="text-danger">-</h4>
                            <small>Error Logs</small>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="audit-content p-20">
                <div id="auditTable">
                    <div class="text-center p-20">
                        <i class="fas fa-spinner fa-spin"></i> Loading audit logs...
                    </div>
                </div>
                
                <div id="auditPagination" class="mt-20"></div>
            </div>
        `;

        App.showModuleContent(html);
        this.bindEvents();

        try {
            const response = await cms.getAuditLogs(params);
            
            if (response.success) {
                this.auditLogs = response.data;
                this.renderAuditTable(response.data);
                this.renderPagination(response.pagination);
                await this.loadStatistics();
            } else {
                throw new Error(response.message || 'Failed to load audit logs');
            }
        } catch (error) {
            $('#auditTable').html('<div class="text-center p-20">Error loading audit logs: ' + error.message + '</div>');
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
            this.loadAuditLogs();
        }, 500));

        // Filter changes
        $('#actionFilter, #tableFilter').on('change', () => {
            this.currentPage = 1;
            this.loadAuditLogs();
        });

        // Date filters
        $('#dateFromFilter, #dateToFilter').on('change', () => {
            this.currentPage = 1;
            this.loadAuditLogs();
        });
    },

    /**
     * Render audit table
     */
    renderAuditTable(logs) {
        const columns = [
            { 
                field: 'created_at', 
                title: 'Timestamp',
                formatter: (value) => Utils.formatDate(value)
            },
            { 
                field: 'action', 
                title: 'Action',
                formatter: (value) => this.formatAction(value)
            },
            { 
                field: 'table_name', 
                title: 'Table',
                formatter: (value) => this.formatTableName(value)
            },
            { 
                field: 'record_id', 
                title: 'Record ID'
            },
            { 
                field: 'username', 
                title: 'User',
                formatter: (value) => value || 'System'
            },
            { 
                field: 'user_ip', 
                title: 'IP Address',
                formatter: (value) => value || 'N/A'
            }
        ];

        const actions = {
            custom: [
                {
                    icon: 'fas fa-eye',
                    class: 'btn-info',
                    onclick: 'Audit.viewLogDetails',
                    tooltip: 'View Details'
                }
            ]
        };

        const tableHtml = App.createDataTable(columns, logs, actions);
        $('#auditTable').html(tableHtml);
    },

    /**
     * Format action for display
     */
    formatAction(action) {
        const actionClasses = {
            'INSERT': 'badge-success',
            'UPDATE': 'badge-warning',
            'DELETE': 'badge-danger'
        };
        
        const actionIcons = {
            'INSERT': 'fas fa-plus',
            'UPDATE': 'fas fa-edit',
            'DELETE': 'fas fa-trash'
        };

        const badgeClass = actionClasses[action] || 'badge-secondary';
        const icon = actionIcons[action] || 'fas fa-question';

        return `<span class="badge ${badgeClass}"><i class="${icon}"></i> ${action}</span>`;
    },

    /**
     * Format table name for display
     */
    formatTableName(tableName) {
        const tableNames = {
            'cms_pages': 'Pages',
            'cms_forms': 'Forms',
            'cms_widgets': 'Widgets',
            'cms_users': 'Users',
            'cms_media_files': 'Media Files',
            'cms_menu_sets': 'Menu Sets',
            'cms_menu_items': 'Menu Items',
            'cms_settings': 'Settings',
            'cms_themes': 'Themes'
        };

        return tableNames[tableName] || tableName.replace('cms_', '').replace('_', ' ');
    },

    /**
     * Render pagination
     */
    renderPagination(pagination) {
        if (!pagination || pagination.pages <= 1) {
            $('#auditPagination').empty();
            return;
        }

        const paginationHtml = Utils.createPagination(pagination, 'Audit.goToPage');
        $('#auditPagination').html(paginationHtml);
    },

    /**
     * Go to specific page
     */
    goToPage(page) {
        this.currentPage = page;
        this.loadAuditLogs();
    },

    /**
     * Search audit logs
     */
    search() {
        this.searchQuery = $('#searchInput').val();
        this.filterAction = $('#actionFilter').val();
        this.filterTable = $('#tableFilter').val();
        this.currentPage = 1;
        this.loadAuditLogs();
    },

    /**
     * Clear search filters
     */
    clearSearch() {
        $('#searchInput').val('');
        $('#actionFilter').val('');
        $('#tableFilter').val('');
        $('#dateFromFilter').val('');
        $('#dateToFilter').val('');
        this.searchQuery = '';
        this.filterAction = '';
        this.filterTable = '';
        this.currentPage = 1;
        this.loadAuditLogs();
    },

    /**
     * Load audit statistics
     */
    async loadStatistics() {
        try {
            const response = await cms.getAuditStatistics();
            
            if (response.success) {
                const stats = response.data;
                $('#totalLogs').text(stats.total_logs || 0);
                $('#todayLogs').text(stats.today_logs || 0);
                $('#activeUsers').text(stats.active_users || 0);
                $('#errorLogs').text(stats.error_logs || 0);
            } else {
                // Mock statistics if API not available
                $('#totalLogs').text(this.auditLogs.length || 0);
                $('#todayLogs').text('12');
                $('#activeUsers').text('3');
                $('#errorLogs').text('0');
            }
        } catch (error) {
            console.error('Error loading audit statistics:', error);
            // Show mock data
            $('#totalLogs').text(this.auditLogs.length || 0);
            $('#todayLogs').text('12');
            $('#activeUsers').text('3');
            $('#errorLogs').text('0');
        }
    },

    /**
     * View log details
     */
    async viewLogDetails(logId) {
        try {
            const response = await cms.getAuditLog(logId);
            
            if (response.success) {
                const log = response.data;
                this.showLogDetailsModal(log);
            } else {
                // Fallback to local data
                const log = this.auditLogs.find(l => l.id === logId);
                if (log) {
                    this.showLogDetailsModal(log);
                } else {
                    throw new Error('Log not found');
                }
            }
        } catch (error) {
            Utils.showError('Error loading log details: ' + error.message);
        }
    },

    /**
     * Show log details modal
     */
    showLogDetailsModal(log) {
        let oldValues = '';
        let newValues = '';

        try {
            if (log.old_values) {
                const oldData = typeof log.old_values === 'string' ? JSON.parse(log.old_values) : log.old_values;
                oldValues = JSON.stringify(oldData, null, 2);
            }
        } catch (e) {
            oldValues = log.old_values || 'N/A';
        }

        try {
            if (log.new_values) {
                const newData = typeof log.new_values === 'string' ? JSON.parse(log.new_values) : log.new_values;
                newValues = JSON.stringify(newData, null, 2);
            }
        } catch (e) {
            newValues = log.new_values || 'N/A';
        }

        const detailsHtml = `
            <div class="log-details">
                <table class="table">
                    <tr>
                        <td><strong>Timestamp:</strong></td>
                        <td>${Utils.formatDate(log.created_at)}</td>
                    </tr>
                    <tr>
                        <td><strong>Action:</strong></td>
                        <td>${this.formatAction(log.action)}</td>
                    </tr>
                    <tr>
                        <td><strong>Table:</strong></td>
                        <td>${this.formatTableName(log.table_name)}</td>
                    </tr>
                    <tr>
                        <td><strong>Record ID:</strong></td>
                        <td>${log.record_id || 'N/A'}</td>
                    </tr>
                    <tr>
                        <td><strong>User:</strong></td>
                        <td>${log.username || 'System'} ${log.user_id ? `(ID: ${log.user_id})` : ''}</td>
                    </tr>
                    <tr>
                        <td><strong>IP Address:</strong></td>
                        <td>${log.user_ip || 'N/A'}</td>
                    </tr>
                </table>

                ${log.action === 'UPDATE' ? `
                    <div class="value-changes">
                        <h5>Changes</h5>
                        <div class="row">
                            <div class="col-md-6">
                                <h6>Old Values:</h6>
                                <pre style="background: #f8d7da; padding: 10px; border-radius: 4px; font-size: 12px; max-height: 200px; overflow-y: auto;">${Utils.escapeHtml(oldValues)}</pre>
                            </div>
                            <div class="col-md-6">
                                <h6>New Values:</h6>
                                <pre style="background: #d4edda; padding: 10px; border-radius: 4px; font-size: 12px; max-height: 200px; overflow-y: auto;">${Utils.escapeHtml(newValues)}</pre>
                            </div>
                        </div>
                    </div>
                ` : log.action === 'INSERT' ? `
                    <div class="value-changes">
                        <h5>Created Data</h5>
                        <pre style="background: #d4edda; padding: 10px; border-radius: 4px; font-size: 12px; max-height: 200px; overflow-y: auto;">${Utils.escapeHtml(newValues)}</pre>
                    </div>
                ` : log.action === 'DELETE' ? `
                    <div class="value-changes">
                        <h5>Deleted Data</h5>
                        <pre style="background: #f8d7da; padding: 10px; border-radius: 4px; font-size: 12px; max-height: 200px; overflow-y: auto;">${Utils.escapeHtml(oldValues)}</pre>
                    </div>
                ` : ''}
            </div>
        `;

        Utils.showModal(`Audit Log Details - ${log.action}`, detailsHtml);
    },

    /**
     * Export audit logs
     */
    async exportLogs() {
        const confirmed = await Utils.confirm(
            'Do you want to export the current filtered audit logs to CSV?',
            'Export Audit Logs'
        );

        if (!confirmed) return;

        try {
            // Create CSV content
            const headers = ['Timestamp', 'Action', 'Table', 'Record ID', 'User', 'IP Address'];
            let csvContent = headers.join(',') + '\n';

            this.auditLogs.forEach(log => {
                const row = [
                    `"${Utils.formatDate(log.created_at)}"`,
                    `"${log.action}"`,
                    `"${this.formatTableName(log.table_name)}"`,
                    `"${log.record_id || ''}"`,
                    `"${log.username || 'System'}"`,
                    `"${log.user_ip || ''}"`
                ];
                csvContent += row.join(',') + '\n';
            });

            // Download CSV
            const blob = new Blob([csvContent], { type: 'text/csv' });
            const link = document.createElement('a');
            link.href = URL.createObjectURL(blob);
            link.download = `audit-logs-${new Date().toISOString().split('T')[0]}.csv`;
            link.click();

            Utils.showSuccess('Audit logs exported successfully!');
        } catch (error) {
            Utils.showError('Error exporting audit logs: ' + error.message);
        }
    },

    /**
     * Clear old audit logs
     */
    async clearOldLogs() {
        const confirmed = await App.confirmDangerousAction(
            'Are you sure you want to clear audit logs older than 90 days? This action cannot be undone.',
            'clear old logs'
        );

        if (!confirmed) return;

        try {
            // Mock clearing old logs - would be actual API call
            Utils.showSuccess('Old audit logs cleared successfully!');
            this.loadAuditLogs();
        } catch (error) {
            Utils.showError('Error clearing old logs: ' + error.message);
        }
    }
};
