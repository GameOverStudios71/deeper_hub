/**
 * Utility functions for the CMS admin interface
 */

// Global utilities object
window.Utils = {
    
    /**
     * Show loading state
     */
    showLoading() {
        $('#loading').show();
    },

    /**
     * Hide loading state
     */
    hideLoading() {
        $('#loading').hide();
    },

    /**
     * Show success message
     */
    showSuccess(message, duration = 5000) {
        this.showAlert(message, 'success', duration);
    },

    /**
     * Show error message
     */
    showError(message, duration = 8000) {
        this.showAlert(message, 'error', duration);
    },

    /**
     * Show warning message
     */
    showWarning(message, duration = 6000) {
        this.showAlert(message, 'warning', duration);
    },

    /**
     * Show info message
     */
    showInfo(message, duration = 5000) {
        this.showAlert(message, 'info', duration);
    },

    /**
     * Show alert message
     */
    showAlert(message, type = 'info', duration = 5000) {
        const alertId = 'alert_' + Date.now();
        const alertHtml = `
            <div id="${alertId}" class="alert alert-${type}">
                ${message}
                <button type="button" class="btn btn-ghost btn-sm" onclick="Utils.closeAlert('${alertId}')" style="float: right; margin-top: -2px;">
                    <i class="fas fa-times"></i>
                </button>
            </div>
        `;
        
        $('#alerts').append(alertHtml);
        
        if (duration > 0) {
            setTimeout(() => {
                this.closeAlert(alertId);
            }, duration);
        }
    },

    /**
     * Close specific alert
     */
    closeAlert(alertId) {
        $(`#${alertId}`).fadeOut(300, function() {
            $(this).remove();
        });
    },

    /**
     * Clear all alerts
     */
    clearAlerts() {
        $('#alerts').empty();
    },

    /**
     * Show confirmation dialog
     */
    confirm(message, title = 'Confirm Action') {
        return new Promise((resolve) => {
            $('#confirmMessage').text(message);
            $('#confirmDialog .modal-header h3').text(title);
            $('#confirmDialog').show();
            
            $('#confirmOk').off('click').on('click', () => {
                $('#confirmDialog').hide();
                resolve(true);
            });
            
            $('#confirmCancel').off('click').on('click', () => {
                $('#confirmDialog').hide();
                resolve(false);
            });
        });
    },

    /**
     * Show modal
     */
    showModal(title, content, footer = null) {
        $('#modalTitle').text(title);
        $('#modalBody').html(content);
        
        if (footer) {
            $('#modalFooter').html(footer).show();
        } else {
            $('#modalFooter').hide();
        }
        
        $('#modalContainer').show();
    },

    /**
     * Hide modal
     */
    hideModal() {
        $('#modalContainer').hide();
        $('#modalBody').empty();
        $('#modalFooter').empty();
    },

    /**
     * Format date for display
     */
    formatDate(dateString, includeTime = true) {
        if (!dateString) return 'N/A';
        
        const date = new Date(dateString);
        const options = {
            year: 'numeric',
            month: 'short',
            day: 'numeric'
        };
        
        if (includeTime) {
            options.hour = '2-digit';
            options.minute = '2-digit';
        }
        
        return date.toLocaleDateString('en-US', options);
    },

    /**
     * Format file size
     */
    formatFileSize(bytes) {
        if (bytes === 0) return '0 Bytes';
        
        const k = 1024;
        const sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
        const i = Math.floor(Math.log(bytes) / Math.log(k));
        
        return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + ' ' + sizes[i];
    },

    /**
     * Truncate text
     */
    truncate(text, length = 100) {
        if (!text) return '';
        if (text.length <= length) return text;
        return text.substring(0, length) + '...';
    },

    /**
     * Escape HTML
     */
    escapeHtml(text) {
        const div = document.createElement('div');
        div.textContent = text;
        return div.innerHTML;
    },

    /**
     * Serialize form to object
     */
    serializeForm(formSelector) {
        const form = $(formSelector);
        const data = {};
        
        form.find('input, select, textarea').each(function() {
            const $field = $(this);
            const name = $field.attr('name');
            
            if (!name) return;
            
            if ($field.is(':checkbox')) {
                data[name] = $field.is(':checked');
            } else if ($field.is(':radio')) {
                if ($field.is(':checked')) {
                    data[name] = $field.val();
                }
            } else {
                data[name] = $field.val();
            }
        });
        
        return data;
    },

    /**
     * Populate form from object
     */
    populateForm(formSelector, data) {
        const form = $(formSelector);
        
        Object.keys(data).forEach(key => {
            const field = form.find(`[name="${key}"]`);
            const value = data[key];
            
            if (field.length) {
                if (field.is(':checkbox')) {
                    field.prop('checked', !!value);
                } else if (field.is(':radio')) {
                    field.filter(`[value="${value}"]`).prop('checked', true);
                } else {
                    field.val(value);
                }
            }
        });
    },

    /**
     * Clear form
     */
    clearForm(formSelector) {
        const form = $(formSelector);
        form[0].reset();
        form.find('.alert').remove();
    },

    /**
     * Validate form
     */
    validateForm(formSelector, rules = {}) {
        const form = $(formSelector);
        const data = this.serializeForm(formSelector);
        const errors = [];
        
        Object.keys(rules).forEach(field => {
            const rule = rules[field];
            const value = data[field];
            
            if (rule.required && (!value || value.trim() === '')) {
                errors.push(`${rule.label || field} is required`);
            }
            
            if (value && rule.minLength && value.length < rule.minLength) {
                errors.push(`${rule.label || field} must be at least ${rule.minLength} characters`);
            }
            
            if (value && rule.maxLength && value.length > rule.maxLength) {
                errors.push(`${rule.label || field} cannot exceed ${rule.maxLength} characters`);
            }
            
            if (value && rule.pattern && !rule.pattern.test(value)) {
                errors.push(`${rule.label || field} format is invalid`);
            }
            
            if (value && rule.email && !this.isValidEmail(value)) {
                errors.push(`${rule.label || field} must be a valid email address`);
            }
        });
        
        return {
            valid: errors.length === 0,
            errors: errors
        };
    },

    /**
     * Check if email is valid
     */
    isValidEmail(email) {
        const pattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        return pattern.test(email);
    },

    /**
     * Generate unique ID
     */
    generateId() {
        return 'id_' + Math.random().toString(36).substr(2, 9);
    },

    /**
     * Debounce function
     */
    debounce(func, wait) {
        let timeout;
        return function executedFunction(...args) {
            const later = () => {
                clearTimeout(timeout);
                func(...args);
            };
            clearTimeout(timeout);
            timeout = setTimeout(later, wait);
        };
    },

    /**
     * Get URL parameters
     */
    getUrlParams() {
        const params = {};
        const urlParams = new URLSearchParams(window.location.search);
        for (const [key, value] of urlParams) {
            params[key] = value;
        }
        return params;
    },

    /**
     * Update URL without reload
     */
    updateUrl(params) {
        const url = new URL(window.location);
        Object.keys(params).forEach(key => {
            if (params[key] !== null && params[key] !== undefined) {
                url.searchParams.set(key, params[key]);
            } else {
                url.searchParams.delete(key);
            }
        });
        window.history.pushState({}, '', url);
    },

    /**
     * Create pagination HTML
     */
    createPagination(pagination, onPageChange) {
        if (!pagination || pagination.pages <= 1) {
            return '';
        }
        
        const { current_page, pages, total } = pagination;
        let html = '<div class="pagination-container">';
        html += `<div class="pagination-info">Showing page ${current_page} of ${pages} (${total} total items)</div>`;
        html += '<div class="pagination-buttons">';
        
        // Previous button
        if (current_page > 1) {
            html += `<button class="btn btn-secondary btn-sm" onclick="${onPageChange}(${current_page - 1})">
                <i class="fas fa-chevron-left"></i> Previous
            </button>`;
        }
        
        // Page numbers
        const startPage = Math.max(1, current_page - 2);
        const endPage = Math.min(pages, current_page + 2);
        
        for (let i = startPage; i <= endPage; i++) {
            const activeClass = i === current_page ? 'btn-primary' : 'btn-secondary';
            html += `<button class="btn ${activeClass} btn-sm" onclick="${onPageChange}(${i})">${i}</button>`;
        }
        
        // Next button
        if (current_page < pages) {
            html += `<button class="btn btn-secondary btn-sm" onclick="${onPageChange}(${current_page + 1})">
                Next <i class="fas fa-chevron-right"></i>
            </button>`;
        }
        
        html += '</div></div>';
        return html;
    },

    /**
     * Handle API errors
     */
    handleApiError(error) {
        console.error('API Error:', error);
        
        if (error.status === 401) {
            this.showError('Session expired. Please login again.');
            setTimeout(() => {
                window.location.reload();
            }, 2000);
        } else if (error.status === 403) {
            this.showError('You do not have permission to perform this action.');
        } else if (error.status === 404) {
            this.showError('The requested resource was not found.');
        } else if (error.status === 422) {
            const errors = error.data?.errors || [error.message];
            this.showError('Validation failed: ' + errors.join(', '));
        } else {
            this.showError(error.message || 'An unexpected error occurred.');
        }
    },

    /**
     * Get current user from localStorage
     */
    getCurrentUser() {
        const userStr = localStorage.getItem('current_user');
        return userStr ? JSON.parse(userStr) : null;
    },

    /**
     * Set current user in localStorage
     */
    setCurrentUser(user) {
        localStorage.setItem('current_user', JSON.stringify(user));
    },

    /**
     * Clear current user
     */
    clearCurrentUser() {
        localStorage.removeItem('current_user');
    }
};

// jQuery extensions
$.fn.serializeObject = function() {
    return Utils.serializeForm(this);
};

// Global error handler for unhandled promise rejections
window.addEventListener('unhandledrejection', function(event) {
    console.error('Unhandled promise rejection:', event.reason);
    Utils.handleApiError(event.reason);
});
