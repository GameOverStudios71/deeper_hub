/**
 * Users module
 */
window.Users = {
    
    currentPage: 1,
    searchQuery: '',
    filterStatus: '',
    users: [],

    /**
     * Initialize users module
     */
    async init() {
        try {
            await this.loadUsers();
        } catch (error) {
            App.handleError(error, 'Users');
        }
    },

    /**
     * Load users list
     */
    async loadUsers() {
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

        const html = `
            ${App.createModuleHeader('Users', [
                {
                    text: 'Add New User',
                    icon: 'fas fa-plus',
                    class: 'btn-success',
                    onclick: 'Users.showCreateForm()'
                }
            ])}
            
            ${App.createSearchBar('Search users...', [
                {
                    id: 'statusFilter',
                    placeholder: 'Filter by status',
                    options: [
                        { value: 'active', text: 'Active' },
                        { value: 'inactive', text: 'Inactive' }
                    ]
                }
            ])}
            
            <div class="users-content p-20">
                <div id="usersTable">
                    <div class="text-center p-20">
                        <i class="fas fa-spinner fa-spin"></i> Loading users...
                    </div>
                </div>
                
                <div id="usersPagination" class="mt-20"></div>
            </div>
        `;

        App.showModuleContent(html);
        this.bindEvents();

        try {
            const response = await cms.getUsers(params);
            
            if (response.success) {
                this.users = response.data;
                this.renderUsersTable(response.data);
                this.renderPagination(response.pagination);
            } else {
                throw new Error(response.message || 'Failed to load users');
            }
        } catch (error) {
            $('#usersTable').html('<div class="text-center p-20">Error loading users: ' + error.message + '</div>');
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
