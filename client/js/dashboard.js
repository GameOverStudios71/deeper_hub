/**
 * Dashboard module
 */
window.Dashboard = {
    
    /**
     * Initialize dashboard
     */
    async init() {
        try {
            await this.loadDashboard();
        } catch (error) {
            App.handleError(error, 'Dashboard');
        }
    },

    /**
     * Load dashboard content
     */
    async loadDashboard() {
        const html = `
            ${App.createModuleHeader('Dashboard', [])}
            
            <div class="dashboard-content p-20">
                <!-- Statistics Cards -->
                <div class="stats-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 20px; margin-bottom: 30px;">
                    <div class="stat-card" id="pagesStats">
                        <div class="stat-icon" style="background: #007bff;">
                            <i class="fas fa-file-alt"></i>
                        </div>
                        <div class="stat-content">
                            <h3 id="pagesCount">-</h3>
                            <p>Total Pages</p>
                        </div>
                    </div>
                    
                    <div class="stat-card" id="formsStats">
                        <div class="stat-icon" style="background: #28a745;">
                            <i class="fas fa-wpforms"></i>
                        </div>
                        <div class="stat-content">
                            <h3 id="formsCount">-</h3>
                            <p>Total Forms</p>
                        </div>
                    </div>
                    
                    <div class="stat-card" id="widgetsStats">
                        <div class="stat-icon" style="background: #ffc107;">
                            <i class="fas fa-puzzle-piece"></i>
                        </div>
                        <div class="stat-content">
                            <h3 id="widgetsCount">-</h3>
                            <p>Total Widgets</p>
                        </div>
                    </div>
                    
                    <div class="stat-card" id="usersStats">
                        <div class="stat-icon" style="background: #dc3545;">
                            <i class="fas fa-users"></i>
                        </div>
                        <div class="stat-content">
                            <h3 id="usersCount">-</h3>
                            <p>Total Users</p>
                        </div>
                    </div>
                </div>

                <!-- Quick Actions -->
                <div class="quick-actions mb-20">
                    <h3>Quick Actions</h3>
                    <div class="action-buttons" style="display: flex; gap: 15px; flex-wrap: wrap;">
                        <button class="btn btn-primary" onclick="App.loadModule('pages')">
                            <i class="fas fa-plus"></i> Create New Page
                        </button>
                        <button class="btn btn-success" onclick="App.loadModule('forms')">
                            <i class="fas fa-plus"></i> Create New Form
                        </button>
                        <button class="btn btn-warning" onclick="App.loadModule('widgets')">
                            <i class="fas fa-plus"></i> Create New Widget
                        </button>
                        <button class="btn btn-info" onclick="App.loadModule('media')">
                            <i class="fas fa-upload"></i> Upload Media
                        </button>
                    </div>
                </div>

                <!-- Recent Activity -->
                <div class="recent-activity">
                    <h3>Recent Activity</h3>
                    <div id="recentActivity" class="activity-list">
                        <div class="text-center p-20">
                            <i class="fas fa-spinner fa-spin"></i> Loading recent activity...
                        </div>
                    </div>
                </div>

                <!-- System Information -->
                <div class="system-info mt-20">
                    <h3>System Information</h3>
                    <div class="info-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 20px;">
                        <div class="info-card">
                            <h4>CMS Version</h4>
                            <p id="cmsVersion">DeeperHub CMS v1.0.0</p>
                        </div>
                        <div class="info-card">
                            <h4>Last Login</h4>
                            <p id="lastLogin">-</p>
                        </div>
                        <div class="info-card">
                            <h4>Storage Used</h4>
                            <p id="storageUsed">-</p>
                        </div>
                        <div class="info-card">
                            <h4>Active Sessions</h4>
                            <p id="activeSessions">-</p>
                        </div>
                    </div>
                </div>
            </div>
        `;

        App.showModuleContent(html);
        await this.loadStatistics();
        await this.loadRecentActivity();
        this.loadSystemInfo();
    },

    /**
     * Load dashboard statistics
     */
    async loadStatistics() {
        try {
            // Load statistics in parallel
            const [pagesResponse, formsResponse, widgetsResponse, usersResponse] = await Promise.allSettled([
                cms.getPages({ limit: 1 }),
                cms.getForms({ limit: 1 }),
                cms.getWidgets({ limit: 1 }),
                cms.getUsers({ limit: 1 })
            ]);

            // Update pages count
            if (pagesResponse.status === 'fulfilled' && pagesResponse.value.success) {
                $('#pagesCount').text(pagesResponse.value.pagination?.total || 0);
            } else {
                $('#pagesCount').text('Error');
            }

            // Update forms count
            if (formsResponse.status === 'fulfilled' && formsResponse.value.success) {
                $('#formsCount').text(formsResponse.value.pagination?.total || 0);
            } else {
                $('#formsCount').text('Error');
            }

            // Update widgets count
            if (widgetsResponse.status === 'fulfilled' && widgetsResponse.value.success) {
                $('#widgetsCount').text(widgetsResponse.value.pagination?.total || 0);
            } else {
                $('#widgetsCount').text('Error');
            }

            // Update users count
            if (usersResponse.status === 'fulfilled' && usersResponse.value.success) {
                $('#usersCount').text(usersResponse.value.pagination?.total || 0);
            } else {
                $('#usersCount').text('Error');
            }

        } catch (error) {
            console.error('Error loading statistics:', error);
        }
    },

    /**
     * Load recent activity
     */
    async loadRecentActivity() {
        try {
            const response = await cms.getAuditLogs({ limit: 10, sort: 'created_at', order: 'desc' });
            
            if (response.success && response.data.length > 0) {
                let html = '';
                
                response.data.forEach(log => {
                    const actionClass = this.getActionClass(log.action);
                    const actionIcon = this.getActionIcon(log.action);
                    
                    html += `
                        <div class="activity-item" style="padding: 15px; border-bottom: 1px solid #eee; display: flex; align-items: center; gap: 15px;">
                            <div class="activity-icon ${actionClass}">
                                <i class="${actionIcon}"></i>
                            </div>
                            <div class="activity-content" style="flex: 1;">
                                <div class="activity-title">
                                    <strong>${log.username || 'System'}</strong> ${log.action.toLowerCase()}d 
                                    <strong>${log.table_name.replace('cms_', '')}</strong>
                                    ${log.record_id ? `(ID: ${log.record_id})` : ''}
                                </div>
                                <div class="activity-time" style="color: #666; font-size: 12px;">
                                    ${Utils.formatDate(log.created_at)}
                                </div>
                            </div>
                        </div>
                    `;
                });
                
                $('#recentActivity').html(html);
            } else {
                $('#recentActivity').html('<div class="text-center p-20">No recent activity found.</div>');
            }
            
        } catch (error) {
            console.error('Error loading recent activity:', error);
            $('#recentActivity').html('<div class="text-center p-20">Error loading recent activity.</div>');
        }
    },

    /**
     * Load system information
     */
    loadSystemInfo() {
        const user = Utils.getCurrentUser();
        
        if (user && user.last_login) {
            $('#lastLogin').text(Utils.formatDate(user.last_login));
        }

        // Mock data for now - these would come from actual system APIs
        $('#storageUsed').text('2.3 GB / 10 GB');
        $('#activeSessions').text('3 active sessions');
    },

    /**
     * Get CSS class for action type
     */
    getActionClass(action) {
        switch (action) {
            case 'INSERT':
                return 'text-success';
            case 'UPDATE':
                return 'text-warning';
            case 'DELETE':
                return 'text-danger';
            default:
                return 'text-info';
        }
    },

    /**
     * Get icon for action type
     */
    getActionIcon(action) {
        switch (action) {
            case 'INSERT':
                return 'fas fa-plus-circle';
            case 'UPDATE':
                return 'fas fa-edit';
            case 'DELETE':
                return 'fas fa-trash';
            default:
                return 'fas fa-info-circle';
        }
    },

    /**
     * Refresh dashboard data
     */
    async refresh() {
        await this.loadStatistics();
        await this.loadRecentActivity();
        this.loadSystemInfo();
        Utils.showSuccess('Dashboard refreshed successfully!');
    }
};

// Add CSS for dashboard components
const dashboardCSS = `
<style>
.stat-card {
    background: white;
    border-radius: 8px;
    padding: 20px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    display: flex;
    align-items: center;
    gap: 15px;
}

.stat-icon {
    width: 60px;
    height: 60px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-size: 24px;
}

.stat-content h3 {
    margin: 0;
    font-size: 32px;
    font-weight: bold;
    color: #333;
}

.stat-content p {
    margin: 0;
    color: #666;
    font-size: 14px;
}

.info-card {
    background: white;
    border-radius: 8px;
    padding: 20px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.info-card h4 {
    margin: 0 0 10px 0;
    color: #333;
    font-size: 16px;
}

.info-card p {
    margin: 0;
    color: #666;
    font-size: 14px;
}

.activity-item:last-child {
    border-bottom: none;
}

.activity-icon {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 16px;
}

.recent-activity {
    background: white;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    overflow: hidden;
}

.recent-activity h3 {
    margin: 0;
    padding: 20px 20px 0 20px;
    color: #333;
}

.activity-list {
    margin-top: 15px;
}
</style>
`;

// Inject CSS
$('head').append(dashboardCSS);
