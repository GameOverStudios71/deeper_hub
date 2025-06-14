/**
 * Authentication module for CMS admin
 */
window.Auth = {
    
    /**
     * Initialize authentication
     */
    init() {
        this.bindEvents();
        this.checkAuthStatus();
    },

    /**
     * Bind authentication events
     */
    bindEvents() {
        // Login form submission
        $('#loginForm').on('submit', (e) => {
            e.preventDefault();
            this.handleLogin();
        });

        // Logout button
        $('#logoutBtn').on('click', (e) => {
            e.preventDefault();
            this.handleLogout();
        });

        // Enter key on login form
        $('#loginForm input').on('keypress', (e) => {
            if (e.which === 13) {
                $('#loginForm').submit();
            }
        });
    },

    /**
     * Check authentication status on page load
     */
    async checkAuthStatus() {
        const token = localStorage.getItem('cms_token');
        
        if (!token) {
            this.showLoginScreen();
            return;
        }

        try {
            Utils.showLoading();
            cms.setToken(token);
            
            const response = await cms.getCurrentUser();
            
            if (response.success) {
                Utils.setCurrentUser(response.data);
                this.showAdminInterface();
                this.updateUserInfo(response.data);
            } else {
                throw new Error('Invalid token');
            }
        } catch (error) {
            console.error('Auth check failed:', error);
            this.clearAuthData();
            this.showLoginScreen();
        } finally {
            Utils.hideLoading();
        }
    },

    /**
     * Handle login form submission
     */
    async handleLogin() {
        const email = $('#email').val().trim();
        const password = $('#password').val();

        // Clear previous errors
        $('#loginError').hide();

        // Basic validation
        if (!email || !password) {
            this.showLoginError('Please enter both email and password.');
            return;
        }

        if (!Utils.isValidEmail(email)) {
            this.showLoginError('Please enter a valid email address.');
            return;
        }

        try {
            // Disable form during login
            this.setLoginFormState(false);

            const response = await cms.login(email, password);

            if (response.success) {
                Utils.setCurrentUser(response.data.user);
                this.showAdminInterface();
                this.updateUserInfo(response.data.user);
                Utils.showSuccess('Login successful!');
            } else {
                throw new Error(response.message || 'Login failed');
            }
        } catch (error) {
            console.error('Login failed:', error);
            this.showLoginError(error.message || 'Login failed. Please try again.');
        } finally {
            this.setLoginFormState(true);
        }
    },

    /**
     * Handle logout
     */
    async handleLogout() {
        const confirmed = await Utils.confirm(
            'Are you sure you want to logout?',
            'Confirm Logout'
        );

        if (!confirmed) return;

        try {
            await cms.logout();
        } catch (error) {
            console.error('Logout error:', error);
        } finally {
            this.clearAuthData();
            this.showLoginScreen();
            Utils.showInfo('You have been logged out.');
        }
    },

    /**
     * Show login screen
     */
    showLoginScreen() {
        $('#loading').hide();
        $('#adminInterface').hide();
        $('#loginScreen').show();
        $('#email').focus();
    },

    /**
     * Show admin interface
     */
    showAdminInterface() {
        $('#loading').hide();
        $('#loginScreen').hide();
        $('#adminInterface').show();

        // Initialize the dashboard by default
        if (window.App && window.App.loadModule) {
            window.App.loadModule('dashboard');
        }
    },

    /**
     * Update user info in header
     */
    updateUserInfo(user) {
        const userInfo = user.full_name || user.username || user.email;
        $('#currentUser').text(userInfo);
    },

    /**
     * Show login error
     */
    showLoginError(message) {
        $('#loginError').text(message).show();
    },

    /**
     * Set login form state (enabled/disabled)
     */
    setLoginFormState(enabled) {
        $('#loginForm input, #loginForm button').prop('disabled', !enabled);
        
        if (enabled) {
            $('#loginForm button').html('<i class="fas fa-sign-in-alt"></i> Login');
        } else {
            $('#loginForm button').html('<i class="fas fa-spinner fa-spin"></i> Logging in...');
        }
    },

    /**
     * Clear authentication data
     */
    clearAuthData() {
        cms.setToken(null);
        Utils.clearCurrentUser();
    },

    /**
     * Check if user has permission
     */
    hasPermission(permission) {
        const user = Utils.getCurrentUser();
        if (!user) return false;
        
        // Admin users have all permissions
        if (user.is_admin) return true;
        
        // Check specific permissions
        if (user.permissions && user.permissions.includes(permission)) {
            return true;
        }
        
        return false;
    },

    /**
     * Require authentication for a function
     */
    requireAuth(callback) {
        const token = localStorage.getItem('cms_token');
        if (!token) {
            this.showLoginScreen();
            return false;
        }
        
        if (typeof callback === 'function') {
            callback();
        }
        
        return true;
    },

    /**
     * Require permission for a function
     */
    requirePermission(permission, callback, errorMessage = null) {
        if (!this.hasPermission(permission)) {
            Utils.showError(
                errorMessage || `You do not have permission to ${permission}.`
            );
            return false;
        }
        
        if (typeof callback === 'function') {
            callback();
        }
        
        return true;
    },

    /**
     * Get authorization header
     */
    getAuthHeader() {
        const token = localStorage.getItem('cms_token');
        return token ? { 'Authorization': `Bearer ${token}` } : {};
    },

    /**
     * Handle token expiration
     */
    handleTokenExpiration() {
        Utils.showError('Your session has expired. Please login again.');
        this.clearAuthData();
        this.showLoginScreen();
    },

    /**
     * Refresh token (if supported by backend)
     */
    async refreshToken() {
        try {
            const response = await cms.post('/auth/refresh');
            if (response.success && response.data.token) {
                cms.setToken(response.data.token);
                return true;
            }
        } catch (error) {
            console.error('Token refresh failed:', error);
        }
        
        return false;
    },

    /**
     * Auto-refresh token before expiration
     */
    startTokenRefresh() {
        // Refresh token every 50 minutes (assuming 1 hour expiration)
        setInterval(async () => {
            const token = localStorage.getItem('cms_token');
            if (token) {
                const refreshed = await this.refreshToken();
                if (!refreshed) {
                    this.handleTokenExpiration();
                }
            }
        }, 50 * 60 * 1000);
    },

    /**
     * Password strength checker
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
     * Show password strength indicator
     */
    showPasswordStrength(inputSelector, indicatorSelector) {
        $(inputSelector).on('input', function() {
            const password = $(this).val();
            const strength = Auth.checkPasswordStrength(password);
            
            let html = `<div class="password-strength ${strength.level}">`;
            html += `<div class="strength-bar">`;
            html += `<div class="strength-fill" style="width: ${(strength.score / 5) * 100}%"></div>`;
            html += `</div>`;
            html += `<div class="strength-text">Password strength: ${strength.level}</div>`;
            
            if (strength.feedback.length > 0) {
                html += `<ul class="strength-feedback">`;
                strength.feedback.forEach(feedback => {
                    html += `<li>${feedback}</li>`;
                });
                html += `</ul>`;
            }
            
            html += `</div>`;
            
            $(indicatorSelector).html(html);
        });
    }
};

// Initialize authentication when document is ready
$(document).ready(() => {
    Auth.init();
});
