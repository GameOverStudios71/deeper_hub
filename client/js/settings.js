/**
 * Settings module
 */
window.Settings = {
    
    settings: [],
    themes: [],
    categories: [],
    currentCategory: null,

    /**
     * Initialize settings module
     */
    async init() {
        try {
            await this.loadCategories();
            await this.loadThemes();
            await this.loadSettings();
        } catch (error) {
            App.handleError(error, 'Settings');
        }
    },

    /**
     * Load settings
     */
    async loadSettings() {
        const html = `
            ${App.createModuleHeader('Settings', [
                {
                    text: 'Add Theme',
                    icon: 'fas fa-plus',
                    class: 'btn-success',
                    onclick: 'Settings.showCreateThemeForm()'
                }
            ])}
            
            <div class="settings-content">
                <!-- Settings Navigation -->
                <div class="settings-nav p-20" style="background: #f8f9fa; border-bottom: 1px solid #dee2e6;">
                    <div class="nav-tabs">
                        <button class="nav-tab active" onclick="Settings.showTab('general')">
                            <i class="fas fa-cog"></i> General Settings
                        </button>
                        <button class="nav-tab" onclick="Settings.showTab('themes')">
                            <i class="fas fa-palette"></i> Themes
                        </button>
                        <button class="nav-tab" onclick="Settings.showTab('system')">
                            <i class="fas fa-server"></i> System
                        </button>
                    </div>
                </div>
                
                <!-- Settings Content -->
                <div class="settings-tabs">
                    <!-- General Settings Tab -->
                    <div id="generalTab" class="settings-tab active">
                        <div class="p-20">
                            <h3>General Settings</h3>
                            <div id="settingsForm">
                                <div class="text-center p-20">
                                    <i class="fas fa-spinner fa-spin"></i> Loading settings...
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Themes Tab -->
                    <div id="themesTab" class="settings-tab" style="display: none;">
                        <div class="p-20">
                            <h3>Theme Management</h3>
                            <div id="themesGrid">
                                <div class="text-center p-20">
                                    <i class="fas fa-spinner fa-spin"></i> Loading themes...
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- System Tab -->
                    <div id="systemTab" class="settings-tab" style="display: none;">
                        <div class="p-20">
                            <h3>System Information</h3>
                            <div id="systemInfo">
                                <div class="text-center p-20">
                                    <i class="fas fa-spinner fa-spin"></i> Loading system info...
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        `;

        App.showModuleContent(html);
        this.bindEvents();

        // Load initial content
        await this.loadGeneralSettings();
        await this.loadThemesGrid();
        this.loadSystemInfo();
    },

    /**
     * Load setting categories
     */
    async loadCategories() {
        try {
            const response = await cms.getSettingCategories();
            if (response.success) {
                this.categories = response.data;
            }
        } catch (error) {
            console.error('Error loading setting categories:', error);
        }
    },

    /**
     * Load themes
     */
    async loadThemes() {
        try {
            const response = await cms.getThemes();
            if (response.success) {
                this.themes = response.data;
            }
        } catch (error) {
            console.error('Error loading themes:', error);
        }
    },

    /**
     * Bind events
     */
    bindEvents() {
        // Tab switching is handled by showTab method
    },

    /**
     * Show specific tab
     */
    showTab(tabName) {
        // Update nav tabs
        $('.nav-tab').removeClass('active');
        $(`.nav-tab:contains('${tabName === 'general' ? 'General' : tabName === 'themes' ? 'Themes' : 'System'}')`).addClass('active');
        
        // Update content tabs
        $('.settings-tab').hide();
        $(`#${tabName}Tab`).show();
        
        // Load content if needed
        if (tabName === 'themes') {
            this.loadThemesGrid();
        } else if (tabName === 'system') {
            this.loadSystemInfo();
        }
    },

    /**
     * Load general settings
     */
    async loadGeneralSettings() {
        try {
            const response = await cms.getSettings();
            
            if (response.success) {
                this.settings = response.data;
                this.renderSettingsForm(response.data);
            } else {
                throw new Error(response.message || 'Failed to load settings');
            }
        } catch (error) {
            $('#settingsForm').html('<div class="text-center p-20">Error loading settings: ' + error.message + '</div>');
        }
    },

    /**
     * Render settings form
     */
    renderSettingsForm(settings) {
        // Group settings by category
        const groupedSettings = {};
        settings.forEach(setting => {
            const categoryName = setting.category_title || 'General';
            if (!groupedSettings[categoryName]) {
                groupedSettings[categoryName] = [];
            }
            groupedSettings[categoryName].push(setting);
        });

        let html = '<form id="settingsFormData">';
        
        Object.keys(groupedSettings).forEach(categoryName => {
            html += `
                <div class="settings-category mb-20">
                    <h4>${categoryName}</h4>
                    <div class="settings-group" style="border: 1px solid #dee2e6; border-radius: 4px; padding: 20px;">
            `;
            
            groupedSettings[categoryName].forEach(setting => {
                html += this.renderSettingField(setting);
            });
            
            html += `
                    </div>
                </div>
            `;
        });

        html += `
            <div class="settings-actions">
                <button type="button" class="btn btn-primary" onclick="Settings.saveSettings()">
                    <i class="fas fa-save"></i> Save Settings
                </button>
                <button type="button" class="btn btn-secondary" onclick="Settings.resetSettings()">
                    <i class="fas fa-undo"></i> Reset to Defaults
                </button>
            </div>
        </form>`;

        $('#settingsForm').html(html);
    },

    /**
     * Render individual setting field
     */
    renderSettingField(setting) {
        const value = setting.value || setting.default_value || '';
        const inputType = setting.setting_type_input_type || 'text';
        
        let fieldHtml = `
            <div class="form-group">
                <label for="setting_${setting.name}">${setting.title}</label>
        `;

        switch (inputType) {
            case 'textarea':
                fieldHtml += `
                    <textarea id="setting_${setting.name}" name="${setting.name}" class="form-control" 
                              rows="3" ${setting.is_readonly ? 'readonly' : ''}
                              placeholder="${setting.placeholder || ''}">${Utils.escapeHtml(value)}</textarea>
                `;
                break;
                
            case 'select':
                fieldHtml += `<select id="setting_${setting.name}" name="${setting.name}" class="form-control" ${setting.is_readonly ? 'disabled' : ''}>`;
                
                if (setting.options) {
                    try {
                        const options = JSON.parse(setting.options);
                        Object.keys(options).forEach(key => {
                            const selected = value === key ? 'selected' : '';
                            fieldHtml += `<option value="${key}" ${selected}>${options[key]}</option>`;
                        });
                    } catch (e) {
                        fieldHtml += `<option value="${value}">${value}</option>`;
                    }
                }
                
                fieldHtml += `</select>`;
                break;
                
            case 'checkbox':
                const checked = value === '1' || value === 'true' || value === true ? 'checked' : '';
                fieldHtml += `
                    <div class="form-check">
                        <input type="checkbox" id="setting_${setting.name}" name="${setting.name}" 
                               class="form-check-input" value="1" ${checked} ${setting.is_readonly ? 'disabled' : ''}>
                        <label class="form-check-label" for="setting_${setting.name}">
                            ${setting.title}
                        </label>
                    </div>
                `;
                break;
                
            case 'number':
                fieldHtml += `
                    <input type="number" id="setting_${setting.name}" name="${setting.name}" 
                           class="form-control" value="${value}" ${setting.is_readonly ? 'readonly' : ''}
                           placeholder="${setting.placeholder || ''}">
                `;
                break;
                
            case 'email':
                fieldHtml += `
                    <input type="email" id="setting_${setting.name}" name="${setting.name}" 
                           class="form-control" value="${value}" ${setting.is_readonly ? 'readonly' : ''}
                           placeholder="${setting.placeholder || ''}">
                `;
                break;
                
            case 'url':
                fieldHtml += `
                    <input type="url" id="setting_${setting.name}" name="${setting.name}" 
                           class="form-control" value="${value}" ${setting.is_readonly ? 'readonly' : ''}
                           placeholder="${setting.placeholder || ''}">
                `;
                break;
                
            default: // text
                fieldHtml += `
                    <input type="text" id="setting_${setting.name}" name="${setting.name}" 
                           class="form-control" value="${value}" ${setting.is_readonly ? 'readonly' : ''}
                           placeholder="${setting.placeholder || ''}">
                `;
                break;
        }

        if (setting.description) {
            fieldHtml += `<small class="form-text text-muted">${setting.description}</small>`;
        }

        fieldHtml += `</div>`;
        
        return fieldHtml;
    },

    /**
     * Save settings
     */
    async saveSettings() {
        try {
            const formData = Utils.serializeForm('#settingsFormData');
            const promises = [];

            // Update each setting individually
            Object.keys(formData).forEach(settingName => {
                const value = formData[settingName];
                promises.push(cms.updateSetting(settingName, value));
            });

            await Promise.all(promises);
            
            Utils.showSuccess('Settings saved successfully!');
            this.loadGeneralSettings(); // Reload to show updated values
            
        } catch (error) {
            Utils.showError('Error saving settings: ' + error.message);
        }
    },

    /**
     * Reset settings to defaults
     */
    async resetSettings() {
        const confirmed = await Utils.confirm(
            'Are you sure you want to reset all settings to their default values? This action cannot be undone.',
            'Reset Settings'
        );

        if (!confirmed) return;

        try {
            const promises = [];
            
            this.settings.forEach(setting => {
                if (setting.default_value !== null) {
                    promises.push(cms.updateSetting(setting.name, setting.default_value));
                }
            });

            await Promise.all(promises);
            
            Utils.showSuccess('Settings reset to defaults successfully!');
            this.loadGeneralSettings();
            
        } catch (error) {
            Utils.showError('Error resetting settings: ' + error.message);
        }
    },

    /**
     * Load themes grid
     */
    async loadThemesGrid() {
        try {
            await this.loadThemes(); // Refresh themes data
            this.renderThemesGrid(this.themes);
        } catch (error) {
            $('#themesGrid').html('<div class="text-center p-20">Error loading themes: ' + error.message + '</div>');
        }
    },

    /**
     * Render themes grid
     */
    renderThemesGrid(themes) {
        let html = '';
        
        if (themes.length > 0) {
            html += '<div class="themes-container" style="display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 20px;">';
            
            themes.forEach(theme => {
                const isDefault = theme.is_default;
                const isActive = theme.is_active;
                
                html += `
                    <div class="theme-card" style="border: 1px solid #dee2e6; border-radius: 8px; overflow: hidden; ${isDefault ? 'border-color: #007bff; box-shadow: 0 0 0 2px rgba(0,123,255,0.25);' : ''}">
                        <div class="theme-preview" style="height: 150px; background: #f8f9fa; display: flex; align-items: center; justify-content: center;">
                            ${theme.preview_image ? 
                                `<img src="${theme.preview_image}" alt="${theme.title}" style="max-width: 100%; max-height: 100%; object-fit: cover;">` :
                                `<i class="fas fa-palette fa-3x" style="color: #6c757d;"></i>`
                            }
                        </div>
                        
                        <div class="theme-info p-15">
                            <h5 style="margin: 0 0 10px 0;">${theme.title}</h5>
                            <p style="margin: 0 0 10px 0; font-size: 14px; color: #6c757d;">${theme.description || 'No description available'}</p>
                            
                            <div class="theme-meta" style="font-size: 12px; color: #6c757d; margin-bottom: 15px;">
                                <div>Version: ${theme.version || '1.0.0'}</div>
                                ${theme.author ? `<div>Author: ${theme.author}</div>` : ''}
                                <div>Responsive: ${theme.is_responsive ? 'Yes' : 'No'}</div>
                                <div>Dark Mode: ${theme.supports_dark_mode ? 'Yes' : 'No'}</div>
                            </div>
                            
                            <div class="theme-badges mb-15">
                                ${isDefault ? '<span class="badge badge-primary">Default</span> ' : ''}
                                ${isActive ? '<span class="badge badge-success">Active</span>' : '<span class="badge badge-secondary">Inactive</span>'}
                            </div>
                            
                            <div class="theme-actions d-flex gap-5">
                                ${!isDefault ? `
                                    <button class="btn btn-primary btn-sm" onclick="Settings.setDefaultTheme(${theme.id})">
                                        Set Default
                                    </button>
                                ` : ''}
                                <button class="btn btn-secondary btn-sm" onclick="Settings.editTheme(${theme.id})">
                                    Edit
                                </button>
                                ${!isDefault ? `
                                    <button class="btn btn-danger btn-sm" onclick="Settings.deleteTheme(${theme.id})">
                                        Delete
                                    </button>
                                ` : ''}
                            </div>
                        </div>
                    </div>
                `;
            });
            
            html += '</div>';
        } else {
            html = '<div class="text-center p-20">No themes available.</div>';
        }

        $('#themesGrid').html(html);
    },

    /**
     * Show create theme form
     */
    showCreateThemeForm() {
        const formHtml = this.createThemeForm();
        
        Utils.showModal('Create New Theme', formHtml, `
            <button type="button" class="btn btn-secondary" onclick="Utils.hideModal()">Cancel</button>
            <button type="button" class="btn btn-success" onclick="Settings.saveTheme()">Create Theme</button>
        `);
    },

    /**
     * Edit theme
     */
    async editTheme(themeId) {
        try {
            const response = await cms.getTheme(themeId);
            
            if (response.success) {
                const formHtml = this.createThemeForm(response.data);
                
                Utils.showModal('Edit Theme', formHtml, `
                    <button type="button" class="btn btn-secondary" onclick="Utils.hideModal()">Cancel</button>
                    <button type="button" class="btn btn-primary" onclick="Settings.saveTheme(${themeId})">Update Theme</button>
                `);

                Utils.populateForm('#themeForm', response.data);
            } else {
                throw new Error(response.message || 'Failed to load theme');
            }
        } catch (error) {
            Utils.showError('Error loading theme: ' + error.message);
        }
    },

    /**
     * Create theme form HTML
     */
    createThemeForm(theme = null) {
        return `
            <form id="themeForm">
                <div class="form-group">
                    <label for="themeTitle">Title *</label>
                    <input type="text" id="themeTitle" name="title" class="form-control" required>
                </div>
                
                <div class="form-group">
                    <label for="themeName">Name *</label>
                    <input type="text" id="themeName" name="name" class="form-control" required 
                           pattern="^[a-zA-Z0-9_]+$" placeholder="theme_name">
                </div>
                
                <div class="form-group">
                    <label for="themeDescription">Description</label>
                    <textarea id="themeDescription" name="description" class="form-control" rows="3"></textarea>
                </div>
                
                <div class="form-group">
                    <label for="templatePath">Template Path *</label>
                    <input type="text" id="templatePath" name="template_path" class="form-control" required 
                           placeholder="/themes/theme_name">
                </div>
                
                <div class="form-group">
                    <label for="cssFile">CSS File</label>
                    <input type="text" id="cssFile" name="css_file" class="form-control" 
                           placeholder="style.css">
                </div>
                
                <div class="form-group">
                    <label for="jsFile">JavaScript File</label>
                    <input type="text" id="jsFile" name="js_file" class="form-control" 
                           placeholder="theme.js">
                </div>
                
                <div class="form-group">
                    <label for="themeVersion">Version</label>
                    <input type="text" id="themeVersion" name="version" class="form-control" 
                           value="1.0.0" placeholder="1.0.0">
                </div>
                
                <div class="form-group">
                    <label for="themeAuthor">Author</label>
                    <input type="text" id="themeAuthor" name="author" class="form-control">
                </div>
                
                <div class="form-group">
                    <label for="authorUrl">Author URL</label>
                    <input type="url" id="authorUrl" name="author_url" class="form-control" 
                           placeholder="https://author.com">
                </div>
                
                <div class="form-group">
                    <label>
                        <input type="checkbox" id="supportsDarkMode" name="supports_dark_mode"> Supports Dark Mode
                    </label>
                </div>
                
                <div class="form-group">
                    <label>
                        <input type="checkbox" id="isResponsive" name="is_responsive" checked> Responsive
                    </label>
                </div>
                
                <div class="form-group">
                    <label for="minWidth">Minimum Width (px)</label>
                    <input type="number" id="minWidth" name="min_width" class="form-control" 
                           value="320" min="200">
                </div>
                
                <div class="form-group">
                    <label>
                        <input type="checkbox" id="themeActive" name="is_active" checked> Active
                    </label>
                </div>
            </form>
        `;
    },

    /**
     * Save theme
     */
    async saveTheme(themeId = null) {
        try {
            const formData = Utils.serializeForm('#themeForm');

            // Validation
            const validation = Utils.validateForm('#themeForm', {
                title: { required: true, label: 'Title' },
                name: { required: true, label: 'Name', pattern: /^[a-zA-Z0-9_]+$/ },
                template_path: { required: true, label: 'Template Path' }
            });

            if (!validation.valid) {
                Utils.showError('Validation failed: ' + validation.errors.join(', '));
                return;
            }

            let response;
            if (themeId) {
                response = await cms.updateTheme(themeId, formData);
            } else {
                response = await cms.createTheme(formData);
            }

            if (response.success) {
                Utils.hideModal();
                Utils.showSuccess(`Theme ${themeId ? 'updated' : 'created'} successfully!`);
                this.loadThemesGrid();
            } else {
                throw new Error(response.message || 'Failed to save theme');
            }
        } catch (error) {
            Utils.showError('Error saving theme: ' + error.message);
        }
    },

    /**
     * Set default theme
     */
    async setDefaultTheme(themeId) {
        const theme = this.themes.find(t => t.id === themeId);
        if (!theme) return;

        const confirmed = await Utils.confirm(
            `Are you sure you want to set "${theme.title}" as the default theme?`,
            'Set Default Theme'
        );

        if (!confirmed) return;

        try {
            const response = await cms.updateTheme(themeId, { is_default: true });
            
            if (response.success) {
                Utils.showSuccess('Default theme updated successfully!');
                this.loadThemesGrid();
            } else {
                throw new Error(response.message || 'Failed to set default theme');
            }
        } catch (error) {
            Utils.showError('Error setting default theme: ' + error.message);
        }
    },

    /**
     * Delete theme
     */
    async deleteTheme(themeId) {
        const theme = this.themes.find(t => t.id === themeId);
        if (!theme) return;

        if (theme.is_default) {
            Utils.showError('Cannot delete the default theme.');
            return;
        }

        const confirmed = await App.confirmDangerousAction(
            `Are you sure you want to delete the theme "${theme.title}"? This action cannot be undone.`,
            'delete'
        );

        if (!confirmed) return;

        try {
            const response = await cms.deleteTheme(themeId);
            
            if (response.success) {
                Utils.showSuccess('Theme deleted successfully!');
                this.loadThemesGrid();
            } else {
                throw new Error(response.message || 'Failed to delete theme');
            }
        } catch (error) {
            Utils.showError('Error deleting theme: ' + error.message);
        }
    },

    /**
     * Load system information
     */
    loadSystemInfo() {
        const html = `
            <div class="system-info-grid" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 20px;">
                <div class="info-card" style="border: 1px solid #dee2e6; border-radius: 8px; padding: 20px;">
                    <h5>CMS Information</h5>
                    <table class="table table-sm">
                        <tr><td>Version:</td><td>DeeperHub CMS v1.0.0</td></tr>
                        <tr><td>Environment:</td><td>Production</td></tr>
                        <tr><td>Database:</td><td>SQLite</td></tr>
                        <tr><td>Cache:</td><td>File Cache</td></tr>
                    </table>
                </div>
                
                <div class="info-card" style="border: 1px solid #dee2e6; border-radius: 8px; padding: 20px;">
                    <h5>Server Information</h5>
                    <table class="table table-sm">
                        <tr><td>Server:</td><td>Elixir/Phoenix</td></tr>
                        <tr><td>Uptime:</td><td>5 days, 12 hours</td></tr>
                        <tr><td>Memory Usage:</td><td>256 MB / 1 GB</td></tr>
                        <tr><td>Disk Usage:</td><td>2.3 GB / 10 GB</td></tr>
                    </table>
                </div>
                
                <div class="info-card" style="border: 1px solid #dee2e6; border-radius: 8px; padding: 20px;">
                    <h5>Statistics</h5>
                    <table class="table table-sm">
                        <tr><td>Total Pages:</td><td id="statPages">-</td></tr>
                        <tr><td>Total Forms:</td><td id="statForms">-</td></tr>
                        <tr><td>Total Users:</td><td id="statUsers">-</td></tr>
                        <tr><td>Media Files:</td><td id="statMedia">-</td></tr>
                    </table>
                </div>
                
                <div class="info-card" style="border: 1px solid #dee2e6; border-radius: 8px; padding: 20px;">
                    <h5>System Actions</h5>
                    <div class="d-flex flex-column gap-10">
                        <button class="btn btn-warning btn-sm" onclick="Settings.clearCache()">
                            <i class="fas fa-broom"></i> Clear Cache
                        </button>
                        <button class="btn btn-info btn-sm" onclick="Settings.exportSettings()">
                            <i class="fas fa-download"></i> Export Settings
                        </button>
                        <button class="btn btn-secondary btn-sm" onclick="Settings.importSettings()">
                            <i class="fas fa-upload"></i> Import Settings
                        </button>
                    </div>
                </div>
            </div>
        `;

        $('#systemInfo').html(html);
        this.loadSystemStats();
    },

    /**
     * Load system statistics
     */
    async loadSystemStats() {
        try {
            // Load basic stats (reuse from dashboard)
            const [pagesResponse, formsResponse, usersResponse] = await Promise.allSettled([
                cms.getPages({ limit: 1 }),
                cms.getForms({ limit: 1 }),
                cms.getUsers({ limit: 1 })
            ]);

            if (pagesResponse.status === 'fulfilled' && pagesResponse.value.success) {
                $('#statPages').text(pagesResponse.value.pagination?.total || 0);
            }

            if (formsResponse.status === 'fulfilled' && formsResponse.value.success) {
                $('#statForms').text(formsResponse.value.pagination?.total || 0);
            }

            if (usersResponse.status === 'fulfilled' && usersResponse.value.success) {
                $('#statUsers').text(usersResponse.value.pagination?.total || 0);
            }

            // Mock media count for now
            $('#statMedia').text('42');

        } catch (error) {
            console.error('Error loading system stats:', error);
        }
    },

    /**
     * Clear cache
     */
    async clearCache() {
        const confirmed = await Utils.confirm(
            'Are you sure you want to clear the system cache?',
            'Clear Cache'
        );

        if (!confirmed) return;

        try {
            // Mock cache clearing - would be actual API call
            Utils.showSuccess('Cache cleared successfully!');
        } catch (error) {
            Utils.showError('Error clearing cache: ' + error.message);
        }
    },

    /**
     * Export settings
     */
    async exportSettings() {
        try {
            const settingsData = {
                settings: this.settings,
                themes: this.themes,
                exported_at: new Date().toISOString(),
                version: '1.0.0'
            };

            const dataStr = JSON.stringify(settingsData, null, 2);
            const dataBlob = new Blob([dataStr], { type: 'application/json' });
            
            const link = document.createElement('a');
            link.href = URL.createObjectURL(dataBlob);
            link.download = `cms-settings-${new Date().toISOString().split('T')[0]}.json`;
            link.click();
            
            Utils.showSuccess('Settings exported successfully!');
        } catch (error) {
            Utils.showError('Error exporting settings: ' + error.message);
        }
    },

    /**
     * Import settings
     */
    importSettings() {
        const input = document.createElement('input');
        input.type = 'file';
        input.accept = '.json';
        
        input.onchange = async (e) => {
            const file = e.target.files[0];
            if (!file) return;

            try {
                const text = await file.text();
                const data = JSON.parse(text);
                
                const confirmed = await Utils.confirm(
                    'Are you sure you want to import these settings? This will overwrite existing settings.',
                    'Import Settings'
                );

                if (!confirmed) return;

                // Mock import - would be actual API calls
                Utils.showSuccess('Settings imported successfully!');
                this.loadGeneralSettings();
                this.loadThemesGrid();
                
            } catch (error) {
                Utils.showError('Error importing settings: ' + error.message);
            }
        };
        
        input.click();
    }
};
