/**
 * Widgets module
 */
window.Widgets = {
    
    currentPage: 1,
    searchQuery: '',
    filterStatus: '',
    widgets: [],
    widgetTypes: [],

    /**
     * Initialize widgets module
     */
    async init() {
        try {
            await this.loadWidgetTypes();
            await this.loadWidgets();
        } catch (error) {
            App.handleError(error, 'Widgets');
        }
    },

    /**
     * Load widgets list
     */
    async loadWidgets() {
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
            ${App.createModuleHeader('Widgets', [
                {
                    text: 'Add New Widget',
                    icon: 'fas fa-plus',
                    class: 'btn-success',
                    onclick: 'Widgets.showCreateForm()'
                }
            ])}
            
            ${App.createSearchBar('Search widgets...', [
                {
                    id: 'statusFilter',
                    placeholder: 'Filter by status',
                    options: [
                        { value: 'active', text: 'Active' },
                        { value: 'inactive', text: 'Inactive' }
                    ]
                }
            ])}
            
            <div class="widgets-content p-20">
                <div id="widgetsTable">
                    <div class="text-center p-20">
                        <i class="fas fa-spinner fa-spin"></i> Loading widgets...
                    </div>
                </div>
                
                <div id="widgetsPagination" class="mt-20"></div>
            </div>
        `;

        App.showModuleContent(html);
        this.bindEvents();

        try {
            const response = await cms.getWidgets(params);
            
            if (response.success) {
                this.widgets = response.data;
                this.renderWidgetsTable(response.data);
                this.renderPagination(response.pagination);
            } else {
                throw new Error(response.message || 'Failed to load widgets');
            }
        } catch (error) {
            $('#widgetsTable').html('<div class="text-center p-20">Error loading widgets: ' + error.message + '</div>');
        }
    },

    /**
     * Load widget types
     */
    async loadWidgetTypes() {
        try {
            const response = await cms.getWidgetTypes();
            if (response.success) {
                this.widgetTypes = response.data;
            }
        } catch (error) {
            console.error('Error loading widget types:', error);
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
            this.loadWidgets();
        }, 500));

        // Status filter
        $('#statusFilter').on('change', () => {
            this.filterStatus = $('#statusFilter').val();
            this.currentPage = 1;
            this.loadWidgets();
        });
    },

    /**
     * Render widgets table
     */
    renderWidgetsTable(widgets) {
        const columns = [
            { field: 'title', title: 'Title' },
            { field: 'name', title: 'Name' },
            { 
                field: 'widget_type_title', 
                title: 'Type',
                formatter: (value) => value || 'N/A'
            },
            { 
                field: 'is_active', 
                title: 'Status',
                type: 'badge'
            },
            { 
                field: 'is_featured', 
                title: 'Featured',
                formatter: (value) => value ? '<span class="badge badge-warning">Featured</span>' : ''
            },
            { 
                field: 'created_at', 
                title: 'Created',
                type: 'date'
            }
        ];

        const actions = {
            edit: 'Widgets.showEditForm',
            delete: 'Widgets.deleteWidget',
            custom: [
                {
                    icon: 'fas fa-eye',
                    class: 'btn-info',
                    onclick: 'Widgets.previewWidget',
                    tooltip: 'Preview'
                }
            ]
        };

        const tableHtml = App.createDataTable(columns, widgets, actions);
        $('#widgetsTable').html(tableHtml);
    },

    /**
     * Render pagination
     */
    renderPagination(pagination) {
        if (!pagination || pagination.pages <= 1) {
            $('#widgetsPagination').empty();
            return;
        }

        const paginationHtml = Utils.createPagination(pagination, 'Widgets.goToPage');
        $('#widgetsPagination').html(paginationHtml);
    },

    /**
     * Go to specific page
     */
    goToPage(page) {
        this.currentPage = page;
        this.loadWidgets();
    },

    /**
     * Search widgets
     */
    search() {
        this.searchQuery = $('#searchInput').val();
        this.filterStatus = $('#statusFilter').val();
        this.currentPage = 1;
        this.loadWidgets();
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
        this.loadWidgets();
    },

    /**
     * Show create form
     */
    showCreateForm() {
        const formHtml = this.createWidgetForm();
        
        Utils.showModal('Create New Widget', formHtml, `
            <button type="button" class="btn btn-secondary" onclick="Utils.hideModal()">Cancel</button>
            <button type="button" class="btn btn-success" onclick="Widgets.saveWidget()">Create Widget</button>
        `);

        this.populateWidgetTypeSelect();
    },

    /**
     * Show edit form
     */
    async showEditForm(widgetId) {
        try {
            const response = await cms.getWidget(widgetId);
            
            if (response.success) {
                const formHtml = this.createWidgetForm(response.data);
                
                Utils.showModal('Edit Widget', formHtml, `
                    <button type="button" class="btn btn-secondary" onclick="Utils.hideModal()">Cancel</button>
                    <button type="button" class="btn btn-primary" onclick="Widgets.saveWidget(${widgetId})">Update Widget</button>
                `);

                this.populateWidgetTypeSelect();
                Utils.populateForm('#widgetForm', response.data);
            } else {
                throw new Error(response.message || 'Failed to load widget');
            }
        } catch (error) {
            Utils.showError('Error loading widget: ' + error.message);
        }
    },

    /**
     * Create widget form HTML
     */
    createWidgetForm(widget = null) {
        return `
            <form id="widgetForm">
                <div class="form-group">
                    <label for="widgetTitle">Title *</label>
                    <input type="text" id="widgetTitle" name="title" class="form-control" required>
                </div>
                
                <div class="form-group">
                    <label for="widgetName">Name *</label>
                    <input type="text" id="widgetName" name="name" class="form-control" required 
                           pattern="^[a-zA-Z0-9_]+$" placeholder="widget_name">
                </div>
                
                <div class="form-group">
                    <label for="widgetDescription">Description</label>
                    <textarea id="widgetDescription" name="description" class="form-control" rows="3"></textarea>
                </div>
                
                <div class="form-group">
                    <label for="widgetType">Widget Type *</label>
                    <select id="widgetType" name="widget_type_id" class="form-control" required>
                        <option value="">Select widget type...</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="widgetTemplate">Template</label>
                    <input type="text" id="widgetTemplate" name="template" class="form-control" 
                           placeholder="widget_template.html">
                </div>
                
                <div class="form-group">
                    <label for="widgetCssClass">CSS Class</label>
                    <input type="text" id="widgetCssClass" name="css_class" class="form-control" 
                           placeholder="widget-custom">
                </div>
                
                <div class="form-group">
                    <label for="widgetContent">Content</label>
                    <textarea id="widgetContent" name="content" class="form-control" rows="5"
                              placeholder="Widget HTML content..."></textarea>
                </div>
                
                <div class="form-group">
                    <label for="contentType">Content Type</label>
                    <select id="contentType" name="content_type" class="form-control">
                        <option value="html">HTML</option>
                        <option value="markdown">Markdown</option>
                        <option value="text">Plain Text</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="apiEndpoint">API Endpoint</label>
                    <input type="text" id="apiEndpoint" name="api_endpoint" class="form-control" 
                           placeholder="/api/data">
                </div>
                
                <div class="form-group">
                    <label for="refreshInterval">Refresh Interval (seconds)</label>
                    <input type="number" id="refreshInterval" name="refresh_interval" class="form-control" 
                           min="0" value="0" placeholder="0 = no refresh">
                </div>
                
                <div class="form-group">
                    <label for="configData">Configuration (JSON)</label>
                    <textarea id="configData" name="config_data" class="form-control" rows="3"
                              placeholder='{"key": "value"}'></textarea>
                </div>
                
                <div class="form-group">
                    <label>
                        <input type="checkbox" id="widgetActive" name="is_active" checked> Active
                    </label>
                </div>
                
                <div class="form-group">
                    <label>
                        <input type="checkbox" id="widgetFeatured" name="is_featured"> Featured
                    </label>
                </div>
            </form>
        `;
    },

    /**
     * Populate widget type select
     */
    populateWidgetTypeSelect() {
        const select = $('#widgetType');
        this.widgetTypes.forEach(type => {
            select.append(`<option value="${type.id}">${type.title}</option>`);
        });
    },

    /**
     * Save widget (create or update)
     */
    async saveWidget(widgetId = null) {
        try {
            const formData = Utils.serializeForm('#widgetForm');
            
            // Add current user as creator for new widgets
            if (!widgetId) {
                const currentUser = Utils.getCurrentUser();
                formData.created_by = currentUser?.id || 1;
            }

            // Validate JSON config if provided
            if (formData.config_data && formData.config_data.trim()) {
                try {
                    JSON.parse(formData.config_data);
                } catch (e) {
                    Utils.showError('Configuration data must be valid JSON');
                    return;
                }
            }

            // Validation
            const validation = Utils.validateForm('#widgetForm', {
                title: { required: true, label: 'Title' },
                name: { required: true, label: 'Name', pattern: /^[a-zA-Z0-9_]+$/ },
                widget_type_id: { required: true, label: 'Widget Type' }
            });

            if (!validation.valid) {
                Utils.showError('Validation failed: ' + validation.errors.join(', '));
                return;
            }

            let response;
            if (widgetId) {
                response = await cms.updateWidget(widgetId, formData);
            } else {
                response = await cms.createWidget(formData);
            }

            if (response.success) {
                Utils.hideModal();
                Utils.showSuccess(`Widget ${widgetId ? 'updated' : 'created'} successfully!`);
                this.loadWidgets();
            } else {
                throw new Error(response.message || 'Failed to save widget');
            }
        } catch (error) {
            Utils.showError('Error saving widget: ' + error.message);
        }
    },

    /**
     * Delete widget
     */
    async deleteWidget(widgetId) {
        const widget = this.widgets.find(w => w.id === widgetId);
        if (!widget) return;

        const confirmed = await App.confirmDangerousAction(
            `Are you sure you want to delete the widget "${widget.title}"? This action cannot be undone.`,
            'delete'
        );

        if (!confirmed) return;

        try {
            const response = await cms.deleteWidget(widgetId);
            
            if (response.success) {
                Utils.showSuccess('Widget deleted successfully!');
                this.loadWidgets();
            } else {
                throw new Error(response.message || 'Failed to delete widget');
            }
        } catch (error) {
            Utils.showError('Error deleting widget: ' + error.message);
        }
    },

    /**
     * Preview widget
     */
    previewWidget(widgetId) {
        const widget = this.widgets.find(w => w.id === widgetId);
        if (!widget) return;

        let previewContent = '';
        
        if (widget.content) {
            if (widget.content_type === 'html') {
                previewContent = widget.content;
            } else if (widget.content_type === 'markdown') {
                previewContent = `<pre>${Utils.escapeHtml(widget.content)}</pre>`;
            } else {
                previewContent = `<pre>${Utils.escapeHtml(widget.content)}</pre>`;
            }
        } else {
            previewContent = '<p><em>No content defined for this widget.</em></p>';
        }

        Utils.showModal(`Preview - ${widget.title}`, `
            <div class="widget-preview">
                <div class="widget-info mb-20">
                    <p><strong>Name:</strong> ${widget.name}</p>
                    <p><strong>Type:</strong> ${widget.widget_type_title || 'N/A'}</p>
                    ${widget.api_endpoint ? `<p><strong>API Endpoint:</strong> ${widget.api_endpoint}</p>` : ''}
                    ${widget.refresh_interval > 0 ? `<p><strong>Refresh:</strong> Every ${widget.refresh_interval} seconds</p>` : ''}
                </div>
                
                <div class="widget-content" style="border: 1px solid #ddd; padding: 20px; background: #f9f9f9;">
                    <h4>${widget.title}</h4>
                    ${widget.description ? `<p><small>${widget.description}</small></p>` : ''}
                    <div class="widget-body">
                        ${previewContent}
                    </div>
                </div>
                
                ${widget.config_data ? `
                    <div class="widget-config mt-20">
                        <h5>Configuration:</h5>
                        <pre style="background: #f8f9fa; padding: 10px; border-radius: 4px; font-size: 12px;">${Utils.escapeHtml(widget.config_data)}</pre>
                    </div>
                ` : ''}
            </div>
        `);
    }
};
