/**
 * Users module - User Management with 2 tables
 */
window.Users = {

    currentPage: 1,
    searchQuery: '',
    filterStatus: '',
    currentTab: 'users',
    data: [],

    // Tab configuration
    tabs: {
        users: {
            title: 'Users',
            icon: 'fas fa-users',
            description: 'Manage system users and accounts',
            apiEndpoint: 'cms/users'
        },
        permissions: {
            title: 'Permissions',
            icon: 'fas fa-key',
            description: 'Manage user permissions and access control',
            apiEndpoint: 'cms/users/permissions'
        }
    },

    /**
     * Initialize users module
     */
    async init() {
        try {
            await this.switchTab(this.currentTab);
        } catch (error) {
            App.handleError(error, 'Users');
        }
    },

    /**
     * Switch between tabs
     */
    async switchTab(tabKey) {
        this.currentTab = tabKey;
        this.currentPage = 1;
        this.searchQuery = '';
        this.filterStatus = '';

        this.renderTabInterface();
        await this.loadTabData();
    },

    /**
     * Render the tab interface
     */
    renderTabInterface() {
        const tabConfig = this.tabs[this.currentTab];
        const entityName = tabConfig.title.slice(0, -1); // Remove 's' from plural

        const html = `
            ${App.createModuleHeader('User Management', [
                {
                    text: `Add New ${entityName}`,
                    icon: 'fas fa-plus',
                    class: 'btn-success',
                    onclick: 'Users.showCreateForm()'
                }
            ])}

            ${this.createTabNavigation()}

            ${this.createTabSearchBar()}

            <div class="tab-content p-20">
                <div id="tabDataTable">
                    <div class="text-center p-20">
                        <i class="fas fa-spinner fa-spin"></i> Loading ${tabConfig.title.toLowerCase()}...
                    </div>
                </div>

                <div id="tabPagination" class="mt-20"></div>
            </div>
        `;

        App.showModuleContent(html);
        this.bindTabEvents();
    },

    /**
     * Create tab navigation
     */
    createTabNavigation() {
        let html = `
            <div class="tab-navigation">
                <div class="nav-tabs">
        `;

        Object.keys(this.tabs).forEach(tabKey => {
            const tab = this.tabs[tabKey];
            const isActive = tabKey === this.currentTab ? 'active' : '';

            html += `
                <button class="nav-link ${isActive}" onclick="Users.switchTab('${tabKey}')">
                    <i class="${tab.icon}"></i> ${tab.title}
                </button>
            `;
        });

        html += `
                </div>
                <div class="tab-description">
                    <small class="text-muted">
                        <i class="${this.tabs[this.currentTab].icon}"></i>
                        ${this.tabs[this.currentTab].description}
                    </small>
                </div>
            </div>
        `;

        return html;
    },

    /**
     * Create search bar for current tab
     */
    createTabSearchBar() {
        const tabConfig = this.tabs[this.currentTab];
        const searchPlaceholder = `Search ${tabConfig.title.toLowerCase()}...`;

        let filters = [];

        // Add status filter for users
        if (this.currentTab === 'users') {
            filters.push({
                id: 'statusFilter',
                placeholder: 'Filter by status',
                options: [
                    { value: 'active', text: 'Active' },
                    { value: 'inactive', text: 'Inactive' }
                ]
            });
        }

        const actions = [];

        return App.createSearchBar(searchPlaceholder, filters, actions);
    },

    /**
     * Load data for current tab
     */
    async loadTabData() {
        try {
            const tabConfig = this.tabs[this.currentTab];
            const params = {
                page: this.currentPage,
                limit: 20,
                sort: 'created_at',
                order: 'desc'
            };

            if (this.searchQuery) {
                params.search = this.searchQuery;
            }

            if (this.filterStatus) {
                params.is_active = this.filterStatus === 'active';
            }

            let response;
            switch (this.currentTab) {
                case 'users':
                    response = await cms.getUsers(params);
                    break;
                case 'permissions':
                    response = await cms.getUserPermissions(params);
                    break;
                default:
                    throw new Error(`Unknown tab: ${this.currentTab}`);
            }

            if (response.success) {
                this.data = response.data || [];
                this.renderTabTable();
                this.renderTabPagination(response.pagination);
            } else {
                throw new Error(response.message || 'Failed to load data');
            }
        } catch (error) {
            console.error(`Error loading ${this.currentTab} data:`, error);
            Utils.showError(`Error loading ${this.currentTab}: ${error.message}`);

            document.getElementById('tabDataTable').innerHTML = `
                <div class="text-center p-20">
                    <i class="fas fa-exclamation-triangle text-warning"></i>
                    <p>Error loading ${this.currentTab}: ${error.message}</p>
                    <button class="btn btn-primary" onclick="Users.loadTabData()">
                        <i class="fas fa-redo"></i> Retry
                    </button>
                </div>
            `;
        }
    },

    /**
     * Render table for current tab
     */
    renderTabTable() {
        let columns = [];
        let actions = {
            edit: 'Users.showEditForm',
            delete: 'Users.deleteRecord'
        };

        // Define columns based on current tab
        switch (this.currentTab) {
            case 'users':
                columns = [
                    { field: 'id', title: 'ID', width: '60px' },
                    { field: 'username', title: 'Username' },
                    { field: 'email', title: 'Email' },
                    { field: 'full_name', title: 'Full Name' },
                    { field: 'is_admin', title: 'Admin', type: 'badge' },
                    { field: 'is_active', title: 'Status', type: 'badge' },
                    { field: 'last_login', title: 'Last Login', type: 'date' },
                    { field: 'created_at', title: 'Created', type: 'date' }
                ];
                actions.custom = [
                    { icon: 'fas fa-key', class: 'btn-warning', onclick: 'Users.managePermissions', tooltip: 'Manage Permissions' },
                    { icon: 'fas fa-lock', class: 'btn-info', onclick: 'Users.resetPassword', tooltip: 'Reset Password' }
                ];
                break;
            case 'permissions':
                columns = [
                    { field: 'id', title: 'ID', width: '60px' },
                    { field: 'username', title: 'User' },
                    { field: 'email', title: 'Email' },
                    { field: 'entity_name', title: 'Entity' },
                    { field: 'permission_type', title: 'Permission' },
                    { field: 'created_at', title: 'Created', type: 'date' }
                ];
                break;
        }

        const tableHtml = App.createDataTable(columns, this.data, actions);
        document.getElementById('tabDataTable').innerHTML = tableHtml;
    },

    /**
     * Render pagination for current tab
     */
    renderTabPagination(pagination) {
        if (!pagination) return;

        const paginationHtml = Utils.createPagination(
            pagination.current_page,
            pagination.pages,
            pagination.total,
            (page) => {
                this.currentPage = page;
                this.loadTabData();
            }
        );

        document.getElementById('tabPagination').innerHTML = paginationHtml;
    },

    /**
     * Bind tab events
     */
    bindTabEvents() {
        // Search functionality
        const searchInput = document.getElementById('searchInput');
        if (searchInput) {
            searchInput.addEventListener('input', Utils.debounce((e) => {
                this.searchQuery = e.target.value;
                this.currentPage = 1;
                this.loadTabData();
            }, 300));
        }

        // Status filter
        const statusFilter = document.getElementById('statusFilter');
        if (statusFilter) {
            statusFilter.addEventListener('change', (e) => {
                this.filterStatus = e.target.value;
                this.currentPage = 1;
                this.loadTabData();
            });
        }
    },

    /**
     * Show create form for current tab
     */
    showCreateForm() {
        const tabConfig = this.tabs[this.currentTab];
        const entityName = tabConfig.title.slice(0, -1);

        const formHtml = this.createTabForm();

        Utils.showModal(`Add New ${entityName}`, formHtml, [
            {
                text: 'Cancel',
                class: 'btn-secondary',
                onclick: 'Utils.hideModal()'
            },
            {
                text: `Create ${entityName}`,
                class: 'btn-success',
                onclick: 'Users.saveRecord()'
            }
        ]);

        if (this.currentTab === 'users') {
            this.initPasswordStrength();
        }
    },

    /**
     * Show edit form for current tab
     */
    showEditForm(id) {
        const record = this.data.find(item => item.id == id);
        if (!record) {
            Utils.showError('Record not found');
            return;
        }

        const tabConfig = this.tabs[this.currentTab];
        const entityName = tabConfig.title.slice(0, -1);

        const formHtml = this.createTabForm(record);

        Utils.showModal(`Edit ${entityName}`, formHtml, [
            {
                text: 'Cancel',
                class: 'btn-secondary',
                onclick: 'Utils.hideModal()'
            },
            {
                text: `Update ${entityName}`,
                class: 'btn-primary',
                onclick: `Users.saveRecord(${id})`
            }
        ]);

        // Populate form with existing data
        Utils.populateForm('#tabForm', record);
    },

    /**
     * Create form HTML for current tab
     */
    createTabForm(record = null) {
        let formHtml = '<form id="tabForm" class="needs-validation" novalidate>';

        switch (this.currentTab) {
            case 'users':
                formHtml += this.createUserForm(record);
                break;
            case 'permissions':
                formHtml += this.createPermissionForm(record);
                break;
            default:
                formHtml += '<p>Form not implemented for this tab.</p>';
        }

        formHtml += '</form>';
        return formHtml;
    },

    /**
     * Create form for Users tab
     */
    createUserForm(record = null) {
        const username = record?.username || '';
        const email = record?.email || '';
        const fullName = record?.full_name || '';
        const isActive = record?.is_active !== false;
        const isAdmin = record?.is_admin === true;
        const isEdit = !!record;

        return `
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="username">Username *</label>
                        <input type="text" class="form-control" id="username" name="username" value="${username}" required>
                        <div class="invalid-feedback">Please provide a valid username.</div>
                        <small class="form-text text-muted">Only letters, numbers, and underscores allowed</small>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="email">Email *</label>
                        <input type="email" class="form-control" id="email" name="email" value="${email}" required>
                        <div class="invalid-feedback">Please provide a valid email address.</div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="full_name">Full Name</label>
                <input type="text" class="form-control" id="full_name" name="full_name" value="${fullName}">
            </div>
            ${!isEdit ? `
            <div class="form-group">
                <label for="password">Password *</label>
                <input type="password" class="form-control" id="password" name="password" required minlength="8">
                <div class="invalid-feedback">Password must be at least 8 characters long.</div>
                <div id="passwordStrength" class="mt-2"></div>
            </div>
            <div class="form-group">
                <label for="password_confirm">Confirm Password *</label>
                <input type="password" class="form-control" id="password_confirm" name="password_confirm" required minlength="8">
                <div class="invalid-feedback">Please confirm your password.</div>
            </div>
            ` : ''}
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="is_active">Status</label>
                        <select class="form-control" id="is_active" name="is_active">
                            <option value="true" ${isActive ? 'selected' : ''}>Active</option>
                            <option value="false" ${!isActive ? 'selected' : ''}>Inactive</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="is_admin">Administrator</label>
                        <select class="form-control" id="is_admin" name="is_admin">
                            <option value="false" ${!isAdmin ? 'selected' : ''}>No</option>
                            <option value="true" ${isAdmin ? 'selected' : ''}>Yes</option>
                        </select>
                        <small class="form-text text-muted">Administrators have full system access</small>
                    </div>
                </div>
            </div>
        `;
    },

    /**
     * Create form for Permissions tab
     */
    createPermissionForm(record = null) {
        const userId = record?.user_id || '';
        const entityId = record?.entity_id || '';
        const permissionType = record?.permission_type || 'read';

        return `
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="user_id">User ID *</label>
                        <input type="number" class="form-control" id="user_id" name="user_id" value="${userId}" required>
                        <div class="invalid-feedback">Please provide a valid user ID.</div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="entity_id">Entity ID</label>
                        <input type="number" class="form-control" id="entity_id" name="entity_id" value="${entityId}">
                        <small class="form-text text-muted">Leave empty for global permissions</small>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="permission_type">Permission Type *</label>
                <select class="form-control" id="permission_type" name="permission_type" required>
                    <option value="read" ${permissionType === 'read' ? 'selected' : ''}>Read</option>
                    <option value="create" ${permissionType === 'create' ? 'selected' : ''}>Create</option>
                    <option value="update" ${permissionType === 'update' ? 'selected' : ''}>Update</option>
                    <option value="delete" ${permissionType === 'delete' ? 'selected' : ''}>Delete</option>
                    <option value="admin" ${permissionType === 'admin' ? 'selected' : ''}>Admin</option>
                </select>
                <div class="invalid-feedback">Please select a permission type.</div>
                <small class="form-text text-muted">
                    <strong>Read:</strong> View data<br>
                    <strong>Create:</strong> Add new records<br>
                    <strong>Update:</strong> Modify existing records<br>
                    <strong>Delete:</strong> Remove records<br>
                    <strong>Admin:</strong> Full control over entity
                </small>
            </div>
        `;
    },

    /**
     * Save record for current tab
     */
    async saveRecord(id = null) {
        try {
            const form = document.getElementById('tabForm');
            if (!form.checkValidity()) {
                form.classList.add('was-validated');
                return;
            }

            const formData = Utils.serializeForm(form);
            const tabConfig = this.tabs[this.currentTab];

            // Special validation for users
            if (this.currentTab === 'users' && !id) {
                if (formData.password !== formData.password_confirm) {
                    Utils.showError('Passwords do not match');
                    return;
                }

                const strength = this.checkPasswordStrength(formData.password);
                if (strength.level === 'weak') {
                    Utils.showError('Password is too weak. Please choose a stronger password.');
                    return;
                }

                // Remove password_confirm from data
                delete formData.password_confirm;
            }

            let response;
            if (id) {
                // Update existing record
                switch (this.currentTab) {
                    case 'users':
                        response = await cms.updateUser(id, formData);
                        break;
                    case 'permissions':
                        response = await cms.updateUserPermission(id, formData);
                        break;
                    default:
                        throw new Error(`Update not implemented for ${this.currentTab}`);
                }
            } else {
                // Create new record
                switch (this.currentTab) {
                    case 'users':
                        response = await cms.createUser(formData);
                        break;
                    case 'permissions':
                        response = await cms.createUserPermission(formData);
                        break;
                    default:
                        throw new Error(`Create not implemented for ${this.currentTab}`);
                }
            }

            if (response.success) {
                Utils.hideModal();
                Utils.showSuccess(response.message || `${tabConfig.title.slice(0, -1)} ${id ? 'updated' : 'created'} successfully!`);
                await this.loadTabData();
            } else {
                throw new Error(response.message || 'Failed to save record');
            }
        } catch (error) {
            console.error('Error saving record:', error);
            Utils.showError(`Error saving record: ${error.message}`);
        }
    },

    /**
     * Delete record
     */
    async deleteRecord(id) {
        const record = this.data.find(item => item.id == id);
        if (!record) {
            Utils.showError('Record not found');
            return;
        }

        const tabConfig = this.tabs[this.currentTab];
        const entityName = tabConfig.title.slice(0, -1);
        const recordName = record.username || record.email || `ID ${id}`;

        if (!confirm(`Are you sure you want to delete this ${entityName.toLowerCase()}: ${recordName}?`)) {
            return;
        }

        try {
            let response;
            switch (this.currentTab) {
                case 'users':
                    response = await cms.deleteUser(id);
                    break;
                case 'permissions':
                    response = await cms.deleteUserPermission(id);
                    break;
                default:
                    throw new Error(`Delete not implemented for ${this.currentTab}`);
            }

            if (response.success) {
                Utils.showSuccess(response.message || `${entityName} deleted successfully!`);
                await this.loadTabData();
            } else {
                throw new Error(response.message || 'Failed to delete record');
            }
        } catch (error) {
            console.error('Error deleting record:', error);
            Utils.showError(`Error deleting record: ${error.message}`);
        }
    },

    /**
     * Load users list (legacy method for compatibility)
     */
    async loadUsers() {
        // Redirect to new tab system
        await this.switchTab('users');
    },

    /**
     * Bind events (legacy method for compatibility)
     */
    bindEvents() {
        // Search functionality
        $('#searchInput').on('input', Utils.debounce(() => {
            this.searchQuery = $('#searchInput').val();
            this.currentPage = 1;
            this.loadUsers();
        }, 500));

        // Status filter
        $('#statusFilter').on('change', () => {
            this.filterStatus = $('#statusFilter').val();
            this.currentPage = 1;
            this.loadUsers();
        });
    },

    /**
     * Render users table
     */
    renderUsersTable(users) {
        const columns = [
            { field: 'username', title: 'Username' },
            { field: 'email', title: 'Email' },
            { 
                field: 'full_name', 
                title: 'Full Name',
                formatter: (value) => value || 'N/A'
            },
            { 
                field: 'is_admin', 
                title: 'Admin',
                formatter: (value) => value ? '<span class="badge badge-warning">Admin</span>' : ''
            },
            { 
                field: 'is_active', 
                title: 'Status',
                type: 'badge'
            },
            { 
                field: 'last_login', 
                title: 'Last Login',
                formatter: (value) => value ? Utils.formatDate(value) : 'Never'
            },
            { 
                field: 'created_at', 
                title: 'Created',
                type: 'date'
            }
        ];

        const actions = {
            edit: 'Users.showEditForm',
            delete: 'Users.deleteUser',
            custom: [
                {
                    icon: 'fas fa-key',
                    class: 'btn-warning',
                    onclick: 'Users.managePermissions',
                    tooltip: 'Permissions'
                },
                {
                    icon: 'fas fa-lock',
                    class: 'btn-info',
                    onclick: 'Users.resetPassword',
                    tooltip: 'Reset Password'
                }
            ]
        };

        const tableHtml = App.createDataTable(columns, users, actions);
        $('#usersTable').html(tableHtml);
    },

    /**
     * Render pagination
     */
    renderPagination(pagination) {
        if (!pagination || pagination.pages <= 1) {
            $('#usersPagination').empty();
            return;
        }

        const paginationHtml = Utils.createPagination(pagination, 'Users.goToPage');
        $('#usersPagination').html(paginationHtml);
    },

    /**
     * Go to specific page
     */
    goToPage(page) {
        this.currentPage = page;
        this.loadUsers();
    },

    /**
     * Search users
     */
    search() {
        this.searchQuery = $('#searchInput').val();
        this.filterStatus = $('#statusFilter').val();
        this.currentPage = 1;
        this.loadUsers();
    },

    /**
     * Clear search
     */
    clearSearch() {
        $('#searchInput').val('');
        $('#statusFilter').val('');
        this.searchQuery = '';
        this.filterStatus = '';
        this.currentPage = 1;
        this.loadUsers();
    },

    /**
     * Show create form
     */
    showCreateForm() {
        const formHtml = this.createUserForm();
        
        Utils.showModal('Create New User', formHtml, `
            <button type="button" class="btn btn-secondary" onclick="Utils.hideModal()">Cancel</button>
            <button type="button" class="btn btn-success" onclick="Users.saveUser()">Create User</button>
        `);

        this.initPasswordStrength();
    },

    /**
     * Show edit form
     */
    async showEditForm(userId) {
        try {
            const response = await cms.getUser(userId);
            
            if (response.success) {
                const formHtml = this.createUserForm(response.data, true);
                
                Utils.showModal('Edit User', formHtml, `
                    <button type="button" class="btn btn-secondary" onclick="Utils.hideModal()">Cancel</button>
                    <button type="button" class="btn btn-primary" onclick="Users.saveUser(${userId})">Update User</button>
                `);

                Utils.populateForm('#userForm', response.data);
            } else {
                throw new Error(response.message || 'Failed to load user');
            }
        } catch (error) {
            Utils.showError('Error loading user: ' + error.message);
        }
    },

    /**
     * Create user form HTML
     */
    createUserForm(user = null, isEdit = false) {
        return `
            <form id="userForm">
                <div class="form-group">
                    <label for="userUsername">Username *</label>
                    <input type="text" id="userUsername" name="username" class="form-control" required 
                           pattern="^[a-zA-Z0-9_]+$" minlength="3" maxlength="50">
                </div>
                
                <div class="form-group">
                    <label for="userEmail">Email *</label>
                    <input type="email" id="userEmail" name="email" class="form-control" required maxlength="255">
                </div>
                
                <div class="form-group">
                    <label for="userFullName">Full Name</label>
                    <input type="text" id="userFullName" name="full_name" class="form-control" maxlength="255">
                </div>
                
                ${!isEdit ? `
                <div class="form-group">
                    <label for="userPassword">Password *</label>
                    <input type="password" id="userPassword" name="password" class="form-control" required minlength="8">
                    <div id="passwordStrength" class="mt-10"></div>
                </div>
                
                <div class="form-group">
                    <label for="userPasswordConfirm">Confirm Password *</label>
                    <input type="password" id="userPasswordConfirm" name="password_confirm" class="form-control" required minlength="8">
                </div>
                ` : ''}
                
                <div class="form-group">
                    <label>
                        <input type="checkbox" id="userActive" name="is_active" checked> Active
                    </label>
                </div>
                
                <div class="form-group">
                    <label>
                        <input type="checkbox" id="userAdmin" name="is_admin"> Administrator
                    </label>
                    <small class="form-text text-muted">Administrators have full access to all system features.</small>
                </div>
            </form>
        `;
    },

    /**
     * Initialize password strength indicator
     */
    initPasswordStrength() {
        $('#userPassword').on('input', function() {
            const password = $(this).val();
            const strength = Users.checkPasswordStrength(password);
            
            let html = `<div class="password-strength ${strength.level}">`;
            html += `<div class="strength-bar" style="height: 4px; background: #e9ecef; border-radius: 2px; overflow: hidden;">`;
            html += `<div class="strength-fill" style="height: 100%; width: ${(strength.score / 5) * 100}%; background: ${Users.getStrengthColor(strength.level)}; transition: width 0.3s;"></div>`;
            html += `</div>`;
            html += `<div class="strength-text" style="font-size: 12px; margin-top: 5px;">Password strength: ${strength.level}</div>`;
            
            if (strength.feedback.length > 0) {
                html += `<ul class="strength-feedback" style="font-size: 12px; color: #6c757d; margin: 5px 0 0 20px;">`;
                strength.feedback.forEach(feedback => {
                    html += `<li>${feedback}</li>`;
                });
                html += `</ul>`;
            }
            
            html += `</div>`;
            
            $('#passwordStrength').html(html);
        });
    },

    /**
     * Check password strength
     */
    checkPasswordStrength(password) {
        const strength = {
            score: 0,
            feedback: []
        };

        if (password.length < 8) {
            strength.feedback.push('Password should be at least 8 characters long');
        } else {
            strength.score += 1;
        }

        if (!/[a-z]/.test(password)) {
            strength.feedback.push('Password should contain lowercase letters');
        } else {
            strength.score += 1;
        }

        if (!/[A-Z]/.test(password)) {
            strength.feedback.push('Password should contain uppercase letters');
        } else {
            strength.score += 1;
        }

        if (!/[0-9]/.test(password)) {
            strength.feedback.push('Password should contain numbers');
        } else {
            strength.score += 1;
        }

        if (!/[^a-zA-Z0-9]/.test(password)) {
            strength.feedback.push('Password should contain special characters');
        } else {
            strength.score += 1;
        }

        // Determine strength level
        if (strength.score < 2) {
            strength.level = 'weak';
        } else if (strength.score < 4) {
            strength.level = 'medium';
        } else {
            strength.level = 'strong';
        }

        return strength;
    },

    /**
     * Get strength color
     */
    getStrengthColor(level) {
        switch (level) {
            case 'weak': return '#dc3545';
            case 'medium': return '#ffc107';
            case 'strong': return '#28a745';
            default: return '#e9ecef';
        }
    },

    /**
     * Save user (create or update)
     */
    async saveUser(userId = null) {
        try {
            const formData = Utils.serializeForm('#userForm');
            
            // Password validation for new users
            if (!userId) {
                if (formData.password !== formData.password_confirm) {
                    Utils.showError('Passwords do not match');
                    return;
                }
                
                const strength = this.checkPasswordStrength(formData.password);
                if (strength.level === 'weak') {
                    Utils.showError('Password is too weak. Please choose a stronger password.');
                    return;
                }
                
                // Remove password_confirm from data
                delete formData.password_confirm;
            }

            // Validation rules
            const validationRules = {
                username: { required: true, label: 'Username', pattern: /^[a-zA-Z0-9_]+$/ },
                email: { required: true, label: 'Email', email: true }
            };

            // Add password validation only for new users
            if (!userId) {
                validationRules.password = { required: true, label: 'Password', minLength: 8 };
            }

            const validation = Utils.validateForm('#userForm', validationRules);

            if (!validation.valid) {
                Utils.showError('Validation failed: ' + validation.errors.join(', '));
                return;
            }

            let response;
            if (userId) {
                response = await cms.updateUser(userId, formData);
            } else {
                response = await cms.createUser(formData);
            }

            if (response.success) {
                Utils.hideModal();
                Utils.showSuccess(`User ${userId ? 'updated' : 'created'} successfully!`);
                this.loadUsers();
            } else {
                throw new Error(response.message || 'Failed to save user');
            }
        } catch (error) {
            Utils.showError('Error saving user: ' + error.message);
        }
    },

    /**
     * Delete user
     */
    async deleteUser(userId) {
        const user = this.users.find(u => u.id === userId);
        if (!user) return;

        // Prevent deleting current user
        const currentUser = Utils.getCurrentUser();
        if (currentUser && currentUser.id === userId) {
            Utils.showError('You cannot delete your own account.');
            return;
        }

        const confirmed = await App.confirmDangerousAction(
            `Are you sure you want to delete the user "${user.username}"? This action cannot be undone.`,
            'delete'
        );

        if (!confirmed) return;

        try {
            const response = await cms.deleteUser(userId);
            
            if (response.success) {
                Utils.showSuccess('User deleted successfully!');
                this.loadUsers();
            } else {
                throw new Error(response.message || 'Failed to delete user');
            }
        } catch (error) {
            Utils.showError('Error deleting user: ' + error.message);
        }
    },

    /**
     * Manage user permissions
     */
    async managePermissions(userId) {
        const user = this.users.find(u => u.id === userId);
        if (!user) return;

        try {
            const response = await cms.getUserPermissions(userId);
            const permissions = response.success ? response.data : [];
            
            const permissionsHtml = this.createPermissionsManager(user, permissions);
            
            Utils.showModal(`Manage Permissions - ${user.username}`, permissionsHtml, `
                <button type="button" class="btn btn-secondary" onclick="Utils.hideModal()">Close</button>
                <button type="button" class="btn btn-primary" onclick="Users.savePermissions(${userId})">Save Permissions</button>
            `);
            
        } catch (error) {
            Utils.showError('Error loading user permissions: ' + error.message);
        }
    },

    /**
     * Create permissions manager HTML
     */
    createPermissionsManager(user, permissions) {
        const permissionTypes = ['read', 'write', 'delete', 'admin'];
        const modules = ['pages', 'forms', 'widgets', 'media', 'menus', 'users', 'settings'];
        
        let html = `
            <div class="permissions-manager">
                <p><strong>User:</strong> ${user.username} (${user.email})</p>
                
                ${user.is_admin ? '<div class="alert alert-warning">This user is an administrator and has full access to all features.</div>' : ''}
                
                <form id="permissionsForm">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Module</th>
                                <th>Read</th>
                                <th>Write</th>
                                <th>Delete</th>
                                <th>Admin</th>
                            </tr>
                        </thead>
                        <tbody>
        `;

        modules.forEach(module => {
            html += `<tr><td><strong>${module.charAt(0).toUpperCase() + module.slice(1)}</strong></td>`;
            
            permissionTypes.forEach(type => {
                const hasPermission = permissions.some(p => 
                    p.module === module && p.permission_type === type
                );
                
                html += `
                    <td>
                        <input type="checkbox" name="permissions" value="${module}:${type}" 
                               ${hasPermission ? 'checked' : ''} ${user.is_admin ? 'disabled' : ''}>
                    </td>
                `;
            });
            
            html += '</tr>';
        });

        html += `
                        </tbody>
                    </table>
                </form>
            </div>
        `;

        return html;
    },

    /**
     * Save user permissions
     */
    async savePermissions(userId) {
        try {
            const checkedPermissions = [];
            $('input[name="permissions"]:checked').each(function() {
                const [module, type] = $(this).val().split(':');
                checkedPermissions.push({
                    module: module,
                    permission_type: type
                });
            });

            const response = await cms.updateUserPermissions(userId, checkedPermissions);

            if (response.success) {
                Utils.hideModal();
                Utils.showSuccess('Permissions updated successfully!');
            } else {
                throw new Error(response.message || 'Failed to update permissions');
            }
        } catch (error) {
            Utils.showError('Error updating permissions: ' + error.message);
        }
    },

    /**
     * Reset user password
     */
    async resetPassword(userId) {
        const user = this.users.find(u => u.id === userId);
        if (!user) return;

        const confirmed = await Utils.confirm(
            `Are you sure you want to reset the password for "${user.username}"? A new temporary password will be generated.`,
            'Reset Password'
        );

        if (!confirmed) return;

        try {
            // Generate temporary password
            const tempPassword = this.generateTempPassword();
            
            const response = await cms.updateUser(userId, { 
                password: tempPassword,
                force_password_change: true 
            });

            if (response.success) {
                Utils.showModal('Password Reset', `
                    <div class="password-reset-info">
                        <p>Password has been reset for user: <strong>${user.username}</strong></p>
                        <p>Temporary password: <code style="background: #f8f9fa; padding: 4px 8px; border-radius: 4px;">${tempPassword}</code></p>
                        <p class="text-warning"><strong>Important:</strong> Please provide this temporary password to the user securely. They will be required to change it on their next login.</p>
                    </div>
                `, `
                    <button type="button" class="btn btn-primary" onclick="Utils.hideModal()">Close</button>
                `);
            } else {
                throw new Error(response.message || 'Failed to reset password');
            }
        } catch (error) {
            Utils.showError('Error resetting password: ' + error.message);
        }
    },

    /**
     * Generate temporary password
     */
    generateTempPassword() {
        const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnpqrstuvwxyz23456789';
        let password = '';
        for (let i = 0; i < 12; i++) {
            password += chars.charAt(Math.floor(Math.random() * chars.length));
        }
        return password;
    }
};
