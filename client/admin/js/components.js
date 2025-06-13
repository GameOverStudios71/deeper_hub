/**
 * DEEPER HUB CMS - UI Components
 * Reusable UI components for the admin interface
 */

const Components = {
    /**
     * Show notification
     */
    showNotification(message, type = 'info') {
        const container = document.getElementById('notifications-container') || this.createNotificationContainer();

        const notification = Utils.dom.create('div', {
            className: `notification ${type}`,
            innerHTML: `
                <span>${Utils.escapeHtml(message)}</span>
                <button onclick="this.parentElement.remove()">×</button>
            `
        });

        container.appendChild(notification);

        // Auto-remove after 5 seconds
        setTimeout(() => {
            if (notification.parentElement) {
                notification.remove();
            }
        }, 5000);
    },

    /**
     * Create notification container if it doesn't exist
     */
    createNotificationContainer() {
        const container = Utils.dom.create('div', {
            id: 'notifications-container',
            style: 'position: fixed; top: 20px; right: 20px; z-index: 10000;'
        });

        document.body.appendChild(container);
        return container;
    },

    /**
     * Create a notification (legacy method)
     */
    createNotification(message, type = 'info', duration = 5000) {
        const notification = Utils.dom.create('div', {
            className: `admin-notification ${type}`,
            innerHTML: `
                <div style="display: flex; justify-content: space-between; align-items: center;">
                    <span>${Utils.escapeHtml(message)}</span>
                    <span style="cursor: pointer; margin-left: 10px;" onclick="this.parentElement.parentElement.remove()">×</span>
                </div>
            `
        });

        const container = document.getElementById('notification-container');
        container.appendChild(notification);

        // Auto-remove after duration
        if (duration > 0) {
            setTimeout(() => {
                if (notification.parentElement) {
                    notification.remove();
                }
            }, duration);
        }

        return notification;
    },

    /**
     * Create a modal dialog
     */
    createModal(title, content, buttons = [], options = {}) {
        const modalId = Utils.generateId();
        
        const modal = Utils.dom.create('div', {
            className: 'admin-modal',
            innerHTML: `
                <fieldset class="tui-fieldset">
                    <legend class="center">${Utils.escapeHtml(title)}</legend>
                    <span class="tui-fieldset-button" onclick="Components.closeModal('${modalId}')">
                        <span class="red-168-text">×</span>
                    </span>
                    <div class="modal-content" style="padding: 20px; min-height: 100px;">
                        ${content}
                    </div>
                    <div class="modal-buttons" style="text-align: center; padding: 10px; border-top: 1px solid rgb(168, 168, 168);">
                        ${buttons.map(btn => `
                            <button class="admin-button ${btn.class || ''}" onclick="${btn.onclick || ''}">
                                ${Utils.escapeHtml(btn.text)}
                            </button>
                        `).join('')}
                    </div>
                </fieldset>
            `
        });

        modal.id = modalId;

        const container = document.getElementById('modal-container');
        Utils.dom.empty(container);
        container.appendChild(modal);
        container.classList.add('active');

        // Close on ESC key
        const escHandler = (e) => {
            if (e.key === 'Escape') {
                this.closeModal(modalId);
                document.removeEventListener('keydown', escHandler);
            }
        };
        document.addEventListener('keydown', escHandler);

        return modalId;
    },

    /**
     * Close modal
     */
    closeModal(modalId) {
        const container = document.getElementById('modal-container');
        container.classList.remove('active');
        Utils.dom.empty(container);
    },

    /**
     * Create confirmation dialog
     */
    confirm(message, title = 'Confirm', onConfirm, onCancel) {
        const confirmHtml = `
            <div style="padding: 20px; text-align: center;">
                <div style="margin-bottom: 20px;">
                    <span class="red-168-text" style="font-size: 48px;">⚠️</span>
                </div>
                <p class="white-168-text" style="margin-bottom: 20px; line-height: 1.5;">
                    ${Utils.escapeHtml(message)}
                </p>
            </div>
        `;

        const buttons = [
            {
                text: 'Cancel',
                onclick: () => {
                    this.closeModal();
                    if (onCancel) onCancel();
                }
            },
            {
                text: 'Confirm',
                class: 'danger',
                onclick: () => {
                    this.closeModal();
                    if (onConfirm) onConfirm();
                }
            }
        ];

        this.createModal(title, confirmHtml, buttons);
    },

    /**
     * Create loader
     */
    createLoader(message = 'Loading...') {
        return `
            <div class="loader-container" style="text-align: center; padding: 40px;">
                <div class="cyan-168-text" style="font-size: 24px; margin-bottom: 10px;">
                    ⏳
                </div>
                <p class="white-168-text">${Utils.escapeHtml(message)}</p>
            </div>
        `;
    },

    /**
     * Create error display
     */
    createError(title, message = '') {
        return `
            <div class="error-container" style="text-align: center; padding: 40px;">
                <div class="red-168-text" style="font-size: 48px; margin-bottom: 20px;">
                    ❌
                </div>
                <h3 class="red-168-text">${Utils.escapeHtml(title)}</h3>
                ${message ? `<p class="secondary-text">${Utils.escapeHtml(message)}</p>` : ''}
                <div style="margin-top: 20px;">
                    <button class="admin-button secondary" onclick="location.reload()">
                        ↻ Reload Page
                    </button>
                </div>
            </div>
        `;
    },

    /**
     * Create stat card for dashboard
     */
    createStatCard(title, value, change = null, type = 'info') {
        const colors = {
            info: 'cyan-168-text',
            success: 'green-168-text',
            warning: 'yellow-168-text',
            danger: 'red-168-text',
            secondary: 'white-168-text'
        };

        const color = colors[type] || colors.info;

        return `
            <div class="stat-card" style="border: 1px solid rgb(168, 168, 168); padding: 15px; margin-bottom: 15px;">
                <div class="stat-value ${color}" style="font-size: 24px; font-weight: bold;">
                    ${value}
                </div>
                <div class="stat-title white-168-text" style="margin-top: 5px;">
                    ${Utils.escapeHtml(title)}
                </div>
                ${change ? `<div class="stat-change secondary-text" style="font-size: 12px; margin-top: 5px;">${change}</div>` : ''}
            </div>
        `;
    },

    /**
     * Create a confirmation dialog
     */
    confirm(message, title = 'Confirm', onConfirm = null, onCancel = null) {
        return this.createModal(title, `<p>${Utils.escapeHtml(message)}</p>`, [
            {
                text: 'Cancel',
                class: 'secondary',
                onclick: `Components.closeModal(); ${onCancel ? onCancel + '()' : ''}`
            },
            {
                text: 'Confirm',
                class: 'danger',
                onclick: `Components.closeModal(); ${onConfirm ? onConfirm + '()' : ''}`
            }
        ]);
    },

    /**
     * Create a data table
     */
    createTable(data, columns, options = {}) {
        const tableId = Utils.generateId();
        
        const headerRow = columns.map(col => 
            `<th style="cursor: pointer;" onclick="Components.sortTable('${tableId}', '${col.key}')">
                ${Utils.escapeHtml(col.title)}
                <span class="sort-indicator" data-column="${col.key}"></span>
            </th>`
        ).join('');

        const bodyRows = data.map(row => {
            const cells = columns.map(col => {
                let value = Utils.getNestedProperty(row, col.key);
                
                if (col.formatter) {
                    value = col.formatter(value, row);
                } else if (col.type === 'date') {
                    value = Utils.formatDate(value);
                } else if (col.type === 'boolean') {
                    value = value ? '<span class="green-168-text">●</span> Yes' : '<span class="red-168-text">●</span> No';
                } else if (col.type === 'actions') {
                    value = (col.actions || []).map(action => 
                        `<button class="admin-button ${action.class || ''}" onclick="${action.onclick}('${row.id}')" title="${action.title || ''}">
                            ${action.text}
                        </button>`
                    ).join(' ');
                }
                
                return `<td>${value || ''}</td>`;
            }).join('');
            
            return `<tr data-id="${row.id}">${cells}</tr>`;
        }).join('');

        const table = `
            <div class="table-container">
                <table class="admin-table" id="${tableId}">
                    <thead>
                        <tr>${headerRow}</tr>
                    </thead>
                    <tbody>
                        ${bodyRows}
                    </tbody>
                </table>
            </div>
        `;

        return table;
    },

    /**
     * Sort table by column
     */
    sortTable(tableId, columnKey) {
        const table = document.getElementById(tableId);
        const tbody = table.querySelector('tbody');
        const rows = Array.from(tbody.querySelectorAll('tr'));
        
        // Get current sort direction
        const indicator = table.querySelector(`[data-column="${columnKey}"]`);
        const currentSort = indicator.textContent.trim();
        const isAsc = currentSort !== '▲';
        
        // Clear all sort indicators
        table.querySelectorAll('.sort-indicator').forEach(ind => ind.textContent = '');
        
        // Set new sort indicator
        indicator.textContent = isAsc ? '▲' : '▼';
        
        // Sort rows
        rows.sort((a, b) => {
            const aValue = a.cells[Array.from(a.parentElement.parentElement.querySelectorAll('th')).findIndex(th => th.textContent.includes(columnKey))].textContent.trim();
            const bValue = b.cells[Array.from(b.parentElement.parentElement.querySelectorAll('th')).findIndex(th => th.textContent.includes(columnKey))].textContent.trim();
            
            if (isAsc) {
                return aValue.localeCompare(bValue, undefined, { numeric: true });
            } else {
                return bValue.localeCompare(aValue, undefined, { numeric: true });
            }
        });
        
        // Re-append sorted rows
        rows.forEach(row => tbody.appendChild(row));
    },

    /**
     * Create a form
     */
    createForm(fields, data = {}, options = {}) {
        const formId = Utils.generateId();

        const formFields = fields.map(field => {
            // Get value from data, field.default, or empty string
            let value = '';
            if (data && data.hasOwnProperty(field.name)) {
                value = data[field.name];
            } else if (field.hasOwnProperty('default')) {
                value = field.default;
            }

            let input = '';
            switch (field.type) {
                case 'text':
                case 'email':
                case 'url':
                case 'password':
                case 'number':
                    input = `<input type="${field.type}" name="${field.name}" value="${Utils.escapeHtml(value)}" ${field.required ? 'required' : ''} ${field.readonly ? 'readonly' : ''} ${field.placeholder ? `placeholder="${Utils.escapeHtml(field.placeholder)}"` : ''}>`;
                    break;

                case 'textarea':
                    input = `<textarea name="${field.name}" rows="${field.rows || 4}" ${field.required ? 'required' : ''} ${field.readonly ? 'readonly' : ''} ${field.placeholder ? `placeholder="${Utils.escapeHtml(field.placeholder)}"` : ''}>${Utils.escapeHtml(value)}</textarea>`;
                    break;

                case 'select':
                    const options = (field.options || []).map(opt =>
                        `<option value="${opt.value}" ${opt.value == value ? 'selected' : ''}>${Utils.escapeHtml(opt.text)}</option>`
                    ).join('');
                    input = `<select name="${field.name}" ${field.required ? 'required' : ''}>${options}</select>`;
                    break;

                case 'checkbox':
                    const isChecked = value === true || value === 'true' || value === 1 || value === '1';
                    input = `<input type="checkbox" name="${field.name}" value="1" ${isChecked ? 'checked' : ''}> ${Utils.escapeHtml(field.label)}`;
                    break;

                case 'hidden':
                    input = `<input type="hidden" name="${field.name}" value="${Utils.escapeHtml(value)}">`;
                    break;

                default:
                    input = `<input type="text" name="${field.name}" value="${Utils.escapeHtml(value)}">`;
            }
            
            if (field.type === 'hidden') {
                return input;
            }
            
            return `
                <div class="admin-form-group">
                    <label for="${field.name}">
                        ${Utils.escapeHtml(field.label)}
                        ${field.required ? '<span class="red-168-text">*</span>' : ''}
                    </label>
                    ${input}
                    ${field.help ? `<small style="color: rgb(168, 168, 168);">${Utils.escapeHtml(field.help)}</small>` : ''}
                </div>
            `;
        }).join('');
        
        return `
            <form id="${formId}" onsubmit="return false;">
                ${formFields}
            </form>
        `;
    },

    /**
     * Get form data
     */
    getFormData(formId) {
        // If no formId provided, try to find the form in the modal
        if (!formId) {
            const modal = document.querySelector('#modal-container.active form');
            if (modal) {
                formId = modal.id;
            } else {
                // Try to find any form in the active modal
                const activeModal = document.querySelector('#modal-container.active');
                if (activeModal) {
                    const form = activeModal.querySelector('form');
                    if (form) {
                        formId = form.id;
                    }
                }
            }
        }

        const form = document.getElementById(formId);
        if (!form) {
            console.error('Form not found:', formId);
            return {};
        }

        const data = {};

        // Get all form elements
        const elements = form.querySelectorAll('input, select, textarea');

        elements.forEach(element => {
            const name = element.name;
            if (!name) return;

            if (element.type === 'checkbox') {
                data[name] = element.checked;
            } else if (element.type === 'radio') {
                if (element.checked) {
                    data[name] = element.value;
                }
            } else {
                data[name] = element.value;
            }
        });

        return data;
    },

    /**
     * Create a progress bar
     */
    createProgressBar(value = 0, max = 100, label = '') {
        const percentage = Math.round((value / max) * 100);
        
        return `
            <div class="tui-progress">
                <div class="tui-progress-bar" style="width: ${percentage}%">
                    ${label || `${percentage}%`}
                </div>
            </div>
        `;
    },

    /**
     * Create a stat card
     */
    createStatCard(title, value, change = null, type = 'info') {
        let changeHtml = '';
        if (change !== null) {
            const changeClass = change >= 0 ? 'green-168-text' : 'red-168-text';
            const changeIcon = change >= 0 ? '▲' : '▼';
            changeHtml = `<div class="stat-change ${changeClass}">${changeIcon} ${Math.abs(change)}%</div>`;
        }
        
        return `
            <div class="stat-card ${type}">
                <div class="stat-title">${Utils.escapeHtml(title)}</div>
                <div class="stat-value">${Utils.formatNumber(value)}</div>
                ${changeHtml}
            </div>
        `;
    },

    /**
     * Create a loading spinner
     */
    createLoader(message = 'Loading...') {
        return `
            <div class="text-center" style="padding: 40px;">
                <div class="tui-progress">
                    <div class="tui-progress-bar loading" style="width: 100%">
                        ${Utils.escapeHtml(message)}
                    </div>
                </div>
            </div>
        `;
    },

    /**
     * Create an error message
     */
    createError(message, details = null) {
        return `
            <div style="text-align: center; padding: 40px; color: rgb(255, 0, 0);">
                <div style="font-size: 18px; margin-bottom: 10px;">⚠ Error</div>
                <div style="margin-bottom: 10px;">${Utils.escapeHtml(message)}</div>
                ${details ? `<details><summary>Details</summary><pre style="text-align: left; margin-top: 10px;">${Utils.escapeHtml(details)}</pre></details>` : ''}
                <button class="admin-button" onclick="location.reload()">Reload Page</button>
            </div>
        `;
    },

    /**
     * Create an empty state
     */
    createEmptyState(message, actionText = null, actionCallback = null) {
        return `
            <div style="text-align: center; padding: 60px; color: rgb(168, 168, 168);">
                <div style="font-size: 48px; margin-bottom: 20px;">□</div>
                <div style="font-size: 16px; margin-bottom: 20px;">${Utils.escapeHtml(message)}</div>
                ${actionText && actionCallback ? `<button class="admin-button primary" onclick="${actionCallback}">${Utils.escapeHtml(actionText)}</button>` : ''}
            </div>
        `;
    },

    /**
     * Create a breadcrumb navigation
     */
    createBreadcrumb(items) {
        const breadcrumbItems = items.map((item, index) => {
            if (index === items.length - 1) {
                return `<span class="white-168-text">${Utils.escapeHtml(item.text)}</span>`;
            } else {
                return `<a href="#!" onclick="${item.onclick || ''}" class="cyan-168-text">${Utils.escapeHtml(item.text)}</a>`;
            }
        }).join(' <span class="white-168-text">></span> ');
        
        return `
            <div class="breadcrumb" style="padding: 10px; border-bottom: 1px solid rgb(168, 168, 168); margin-bottom: 20px;">
                ${breadcrumbItems}
            </div>
        `;
    },

    /**
     * Create a search box
     */
    createSearchBox(placeholder = 'Search...', onSearch = null) {
        const searchId = Utils.generateId();
        
        return `
            <div class="search-box" style="margin-bottom: 20px;">
                <input type="text" id="${searchId}" placeholder="${Utils.escapeHtml(placeholder)}" 
                       style="width: 300px; margin-right: 10px;"
                       onkeyup="if(event.key==='Enter' && ${onSearch}) ${onSearch}(this.value)">
                <button class="admin-button" onclick="if(${onSearch}) ${onSearch}(document.getElementById('${searchId}').value)">
                    Search
                </button>
                <button class="admin-button secondary" onclick="document.getElementById('${searchId}').value=''; if(${onSearch}) ${onSearch}('')">
                    Clear
                </button>
            </div>
        `;
    }
};

// Expose to global scope
window.Components = Components;
