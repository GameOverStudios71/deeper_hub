/**
 * DeeperHub CMS API Client
 * Handles all API communication with the CMS backend
 */
class CMSClient {
    constructor(baseUrl = '/api/cms', token = null) {
        this.baseUrl = baseUrl;
        this.token = token || localStorage.getItem('cms_token');
        this.requestInterceptors = [];
        this.responseInterceptors = [];
    }



    /**
     * Set authentication token
     */
    setToken(token) {
        this.token = token;
        if (token) {
            localStorage.setItem('cms_token', token);
        } else {
            localStorage.removeItem('cms_token');
        }
    }

    /**
     * Get request headers
     */
    getHeaders(contentType = 'application/json') {
        const headers = {};
        
        if (contentType) {
            headers['Content-Type'] = contentType;
        }
        
        if (this.token) {
            headers['Authorization'] = `Bearer ${this.token}`;
        }
        
        return headers;
    }

    /**
     * Make HTTP request to backend
     */
    async request(method, endpoint, data = null, options = {}) {

        const config = {
            method: method.toUpperCase(),
            headers: this.getHeaders(options.contentType),
            ...options
        };

        // Handle different data types
        if (data) {
            if (method.toUpperCase() === 'GET') {
                // Convert data to query string for GET requests
                const params = new URLSearchParams(data);
                endpoint += (endpoint.includes('?') ? '&' : '?') + params.toString();
            } else if (data instanceof FormData) {
                // For file uploads, don't set content-type (let browser set it)
                delete config.headers['Content-Type'];
                config.body = data;
            } else {
                config.body = JSON.stringify(data);
            }
        }

        const url = `${this.baseUrl}${endpoint}`;

        try {
            const response = await fetch(url, config);

            // Handle different response types
            let responseData;
            const contentType = response.headers.get('content-type');

            if (contentType && contentType.includes('application/json')) {
                responseData = await response.json();
            } else {
                responseData = await response.text();
            }

            if (!response.ok) {
                const error = new Error(responseData.message || `HTTP ${response.status}`);
                error.status = response.status;
                error.data = responseData;
                throw error;
            }

            // Transform backend response to expected format
            return this.transformBackendResponse(responseData);
        } catch (error) {
            console.error('API Request failed:', error);
            throw error;
        }
    }

    /**
     * Transform backend response to expected client format
     */
    transformBackendResponse(response) {
        // Backend returns { status: "success", data: [...], count: N }
        // Client expects { success: true, data: [...], pagination: {...} }

        if (response.status === "success") {
            const result = {
                success: true,
                data: response.data
            };

            // Add pagination if count is provided
            if (response.count !== undefined) {
                result.pagination = {
                    total: response.count,
                    pages: Math.ceil(response.count / 20), // Default page size
                    current_page: 1,
                    limit: 20
                };
            }

            return result;
        } else {
            // Error response
            return {
                success: false,
                message: response.message || 'Unknown error',
                data: response.details || null
            };
        }
    }



    // Convenience methods
    get(endpoint, params = null) {
        return this.request('GET', endpoint, params);
    }

    post(endpoint, data = null) {
        return this.request('POST', endpoint, data);
    }

    put(endpoint, data = null) {
        return this.request('PUT', endpoint, data);
    }

    patch(endpoint, data = null) {
        return this.request('PATCH', endpoint, data);
    }

    delete(endpoint) {
        return this.request('DELETE', endpoint);
    }

    // File upload method
    upload(endpoint, file, additionalData = {}) {
        const formData = new FormData();
        formData.append('file', file);
        
        Object.keys(additionalData).forEach(key => {
            formData.append(key, additionalData[key]);
        });

        return this.request('POST', endpoint, formData);
    }

    /**
     * Mock handlers for different modules
     */
    handleMockPages(method, endpoint, data) {
        const pages = [...this.mockData.pages];

        if (method === 'GET' && endpoint === '/pages') {
            return {
                success: true,
                data: pages,
                pagination: { total: pages.length, pages: 1, current_page: 1, limit: 20 }
            };
        }

        if (method === 'GET' && endpoint.match(/\/pages\/\d+$/)) {
            const id = parseInt(endpoint.split('/').pop());
            const page = pages.find(p => p.id === id);
            return page ? { success: true, data: page } : { success: false, message: 'Page not found' };
        }

        if (method === 'POST' && endpoint === '/pages') {
            const newPage = { id: Date.now(), ...data, created_at: new Date().toISOString() };
            this.mockData.pages.push(newPage);
            return { success: true, data: newPage };
        }

        if (method === 'PUT' && endpoint.match(/\/pages\/\d+$/)) {
            const id = parseInt(endpoint.split('/').pop());
            const index = this.mockData.pages.findIndex(p => p.id === id);
            if (index !== -1) {
                this.mockData.pages[index] = { ...this.mockData.pages[index], ...data };
                return { success: true, data: this.mockData.pages[index] };
            }
            return { success: false, message: 'Page not found' };
        }

        if (method === 'DELETE' && endpoint.match(/\/pages\/\d+$/)) {
            const id = parseInt(endpoint.split('/').pop());
            const index = this.mockData.pages.findIndex(p => p.id === id);
            if (index !== -1) {
                this.mockData.pages.splice(index, 1);
                return { success: true };
            }
            return { success: false, message: 'Page not found' };
        }

        if (endpoint === '/pages/types') {
            return {
                success: true,
                data: [
                    { id: 1, title: 'Static Page', name: 'static' },
                    { id: 2, title: 'Blog Post', name: 'blog' },
                    { id: 3, title: 'Landing Page', name: 'landing' }
                ]
            };
        }

        if (endpoint === '/pages/layouts') {
            return {
                success: true,
                data: [
                    { id: 1, title: 'Default Layout', name: 'default' },
                    { id: 2, title: 'Full Width', name: 'fullwidth' },
                    { id: 3, title: 'Sidebar Layout', name: 'sidebar' }
                ]
            };
        }

        return { success: false, message: 'Endpoint not found' };
    }

    handleMockForms(method, endpoint, data) {
        const forms = [...this.mockData.forms];

        if (method === 'GET' && endpoint === '/forms') {
            return {
                success: true,
                data: forms,
                pagination: { total: forms.length, pages: 1, current_page: 1, limit: 20 }
            };
        }

        if (method === 'GET' && endpoint.match(/\/forms\/\d+$/)) {
            const id = parseInt(endpoint.split('/').pop());
            const form = forms.find(f => f.id === id);
            return form ? { success: true, data: form } : { success: false, message: 'Form not found' };
        }

        if (method === 'POST' && endpoint === '/forms') {
            const newForm = { id: Date.now(), ...data, created_at: new Date().toISOString() };
            this.mockData.forms.push(newForm);
            return { success: true, data: newForm };
        }

        if (method === 'PUT' && endpoint.match(/\/forms\/\d+$/)) {
            const id = parseInt(endpoint.split('/').pop());
            const index = this.mockData.forms.findIndex(f => f.id === id);
            if (index !== -1) {
                this.mockData.forms[index] = { ...this.mockData.forms[index], ...data };
                return { success: true, data: this.mockData.forms[index] };
            }
            return { success: false, message: 'Form not found' };
        }

        if (method === 'DELETE' && endpoint.match(/\/forms\/\d+$/)) {
            const id = parseInt(endpoint.split('/').pop());
            const index = this.mockData.forms.findIndex(f => f.id === id);
            if (index !== -1) {
                this.mockData.forms.splice(index, 1);
                return { success: true };
            }
            return { success: false, message: 'Form not found' };
        }

        if (endpoint === '/forms/field-types') {
            return {
                success: true,
                data: [
                    { id: 1, title: 'Text Input', name: 'text' },
                    { id: 2, title: 'Email Input', name: 'email' },
                    { id: 3, title: 'Textarea', name: 'textarea' },
                    { id: 4, title: 'Select Dropdown', name: 'select' },
                    { id: 5, title: 'Checkbox', name: 'checkbox' },
                    { id: 6, title: 'Radio Buttons', name: 'radio' },
                    { id: 7, title: 'File Upload', name: 'file' }
                ]
            };
        }

        if (method === 'GET' && endpoint.match(/\/forms\/\d+\/fields$/)) {
            return {
                success: true,
                data: [
                    { id: 1, form_id: 1, name: 'name', title: 'Full Name', field_type_id: 1, field_type_title: 'Text Input', is_required: true, order_index: 1 },
                    { id: 2, form_id: 1, name: 'email', title: 'Email Address', field_type_id: 2, field_type_title: 'Email Input', is_required: true, order_index: 2 },
                    { id: 3, form_id: 1, name: 'message', title: 'Message', field_type_id: 3, field_type_title: 'Textarea', is_required: true, order_index: 3 }
                ]
            };
        }

        if (method === 'POST' && endpoint.match(/\/forms\/\d+\/fields$/)) {
            const formId = parseInt(endpoint.split('/')[2]);
            const newField = { id: Date.now(), form_id: formId, ...data, created_at: new Date().toISOString() };
            return { success: true, data: newField };
        }

        if (method === 'PUT' && endpoint.match(/\/forms\/\d+\/fields\/\d+$/)) {
            const fieldId = parseInt(endpoint.split('/').pop());
            const updatedField = { id: fieldId, ...data, updated_at: new Date().toISOString() };
            return { success: true, data: updatedField };
        }

        if (method === 'DELETE' && endpoint.match(/\/forms\/\d+\/fields\/\d+$/)) {
            return { success: true };
        }

        return { success: false, message: 'Endpoint not found' };
    }

    handleMockWidgets(method, endpoint, data) {
        const widgets = [...this.mockData.widgets];

        if (method === 'GET' && endpoint === '/widgets') {
            return {
                success: true,
                data: widgets,
                pagination: { total: widgets.length, pages: 1, current_page: 1, limit: 20 }
            };
        }

        if (method === 'GET' && endpoint.match(/\/widgets\/\d+$/)) {
            const id = parseInt(endpoint.split('/').pop());
            const widget = widgets.find(w => w.id === id);
            return widget ? { success: true, data: widget } : { success: false, message: 'Widget not found' };
        }

        if (method === 'POST' && endpoint === '/widgets') {
            const newWidget = { id: Date.now(), ...data, created_at: new Date().toISOString() };
            this.mockData.widgets.push(newWidget);
            return { success: true, data: newWidget };
        }

        if (method === 'PUT' && endpoint.match(/\/widgets\/\d+$/)) {
            const id = parseInt(endpoint.split('/').pop());
            const index = this.mockData.widgets.findIndex(w => w.id === id);
            if (index !== -1) {
                this.mockData.widgets[index] = { ...this.mockData.widgets[index], ...data };
                return { success: true, data: this.mockData.widgets[index] };
            }
            return { success: false, message: 'Widget not found' };
        }

        if (method === 'DELETE' && endpoint.match(/\/widgets\/\d+$/)) {
            const id = parseInt(endpoint.split('/').pop());
            const index = this.mockData.widgets.findIndex(w => w.id === id);
            if (index !== -1) {
                this.mockData.widgets.splice(index, 1);
                return { success: true };
            }
            return { success: false, message: 'Widget not found' };
        }

        if (endpoint === '/widgets/types') {
            return {
                success: true,
                data: [
                    { id: 1, title: 'Content Widget', name: 'content' },
                    { id: 2, title: 'Navigation Widget', name: 'navigation' },
                    { id: 3, title: 'Social Widget', name: 'social' }
                ]
            };
        }

        return { success: false, message: 'Endpoint not found' };
    }

    // Authentication methods
    async login(email, password) {
        const response = await this.post('/auth/login', { email, password });
        if (response.success && response.data.token) {
            this.setToken(response.data.token);
        }
        return response;
    }

    logout() {
        this.setToken(null);
        return Promise.resolve({ success: true });
    }

    async getCurrentUser() {
        return this.get('/auth/me');
    }

    handleMockMedia(method, endpoint, data) {
        const files = [...this.mockData.mediaFiles];

        if (method === 'GET' && endpoint === '/media/files') {
            return {
                success: true,
                data: files,
                pagination: { total: files.length, pages: 1, current_page: 1, limit: 24 }
            };
        }

        if (method === 'GET' && endpoint.match(/\/media\/files\/\d+$/)) {
            const id = parseInt(endpoint.split('/').pop());
            const file = files.find(f => f.id === id);
            return file ? { success: true, data: file } : { success: false, message: 'File not found' };
        }

        if (method === 'POST' && endpoint === '/media/upload') {
            const newFile = {
                id: Date.now(),
                original_name: 'uploaded_file.jpg',
                file_name: `file_${Date.now()}.jpg`,
                full_path: `/uploads/file_${Date.now()}.jpg`,
                file_size: 123456,
                mime_type: 'image/jpeg',
                image_width: 800,
                image_height: 600,
                folder_id: data.folder_id || null,
                is_public: true,
                uploaded_by: 1,
                created_at: new Date().toISOString()
            };
            this.mockData.mediaFiles.push(newFile);
            return { success: true, data: newFile };
        }

        if (endpoint === '/media/folders') {
            return {
                success: true,
                data: [
                    { id: 1, name: 'Images', parent_id: null, path: 'images', full_path: '/uploads/images' },
                    { id: 2, name: 'Documents', parent_id: null, path: 'documents', full_path: '/uploads/documents' }
                ]
            };
        }

        return { success: false, message: 'Endpoint not found' };
    }

    handleMockMenus(method, endpoint, data) {
        const menuSets = [...this.mockData.menuSets];

        if (method === 'GET' && endpoint === '/menus/sets') {
            return {
                success: true,
                data: menuSets,
                pagination: { total: menuSets.length, pages: 1, current_page: 1, limit: 20 }
            };
        }

        if (method === 'GET' && endpoint.match(/\/menus\/sets\/\d+$/)) {
            const id = parseInt(endpoint.split('/').pop());
            const menuSet = menuSets.find(m => m.id === id);
            return menuSet ? { success: true, data: menuSet } : { success: false, message: 'Menu set not found' };
        }

        if (method === 'POST' && endpoint === '/menus/sets') {
            const newMenuSet = { id: Date.now(), ...data, created_at: new Date().toISOString() };
            this.mockData.menuSets.push(newMenuSet);
            return { success: true, data: newMenuSet };
        }

        if (method === 'PUT' && endpoint.match(/\/menus\/sets\/\d+$/)) {
            const id = parseInt(endpoint.split('/').pop());
            const index = this.mockData.menuSets.findIndex(m => m.id === id);
            if (index !== -1) {
                this.mockData.menuSets[index] = { ...this.mockData.menuSets[index], ...data };
                return { success: true, data: this.mockData.menuSets[index] };
            }
            return { success: false, message: 'Menu set not found' };
        }

        if (method === 'DELETE' && endpoint.match(/\/menus\/sets\/\d+$/)) {
            const id = parseInt(endpoint.split('/').pop());
            const index = this.mockData.menuSets.findIndex(m => m.id === id);
            if (index !== -1) {
                this.mockData.menuSets.splice(index, 1);
                return { success: true };
            }
            return { success: false, message: 'Menu set not found' };
        }

        if (endpoint === '/menus/templates') {
            return {
                success: true,
                data: [
                    { id: 1, title: 'Horizontal Menu', name: 'horizontal' },
                    { id: 2, title: 'Vertical Menu', name: 'vertical' },
                    { id: 3, title: 'Dropdown Menu', name: 'dropdown' }
                ]
            };
        }

        if (method === 'GET' && endpoint.match(/\/menus\/sets\/\d+\/items$/)) {
            return {
                success: true,
                data: [
                    { id: 1, menu_set_id: 1, parent_id: null, name: 'home', title: 'Home', link_type: 'page', page_id: 1, page_title: 'Home Page', order_index: 1, is_active: true },
                    { id: 2, menu_set_id: 1, parent_id: null, name: 'about', title: 'About', link_type: 'page', page_id: 2, page_title: 'About Us', order_index: 2, is_active: true }
                ]
            };
        }

        if (method === 'POST' && endpoint.match(/\/menus\/sets\/\d+\/items$/)) {
            const menuSetId = parseInt(endpoint.split('/')[3]);
            const newItem = { id: Date.now(), menu_set_id: menuSetId, ...data, created_at: new Date().toISOString() };
            return { success: true, data: newItem };
        }

        if (method === 'PUT' && endpoint.match(/\/menus\/sets\/\d+\/items\/\d+$/)) {
            const itemId = parseInt(endpoint.split('/').pop());
            const updatedItem = { id: itemId, ...data, updated_at: new Date().toISOString() };
            return { success: true, data: updatedItem };
        }

        if (method === 'DELETE' && endpoint.match(/\/menus\/sets\/\d+\/items\/\d+$/)) {
            return { success: true };
        }

        return { success: false, message: 'Endpoint not found' };
    }

    handleMockUsers(method, endpoint, data) {
        const users = [...this.mockData.users];

        if (method === 'GET' && endpoint === '/users') {
            return {
                success: true,
                data: users,
                pagination: { total: users.length, pages: 1, current_page: 1, limit: 20 }
            };
        }

        if (method === 'GET' && endpoint.match(/\/users\/\d+$/)) {
            const id = parseInt(endpoint.split('/').pop());
            const user = users.find(u => u.id === id);
            return user ? { success: true, data: user } : { success: false, message: 'User not found' };
        }

        if (method === 'POST' && endpoint === '/users') {
            const newUser = { id: Date.now(), ...data, created_at: new Date().toISOString() };
            this.mockData.users.push(newUser);
            return { success: true, data: newUser };
        }

        if (method === 'PUT' && endpoint.match(/\/users\/\d+$/)) {
            const id = parseInt(endpoint.split('/').pop());
            const index = this.mockData.users.findIndex(u => u.id === id);
            if (index !== -1) {
                this.mockData.users[index] = { ...this.mockData.users[index], ...data };
                return { success: true, data: this.mockData.users[index] };
            }
            return { success: false, message: 'User not found' };
        }

        if (method === 'DELETE' && endpoint.match(/\/users\/\d+$/)) {
            const id = parseInt(endpoint.split('/').pop());
            const index = this.mockData.users.findIndex(u => u.id === id);
            if (index !== -1) {
                this.mockData.users.splice(index, 1);
                return { success: true };
            }
            return { success: false, message: 'User not found' };
        }

        if (method === 'GET' && endpoint.match(/\/users\/\d+\/permissions$/)) {
            return {
                success: true,
                data: [
                    { module: 'pages', permission_type: 'read' },
                    { module: 'pages', permission_type: 'write' },
                    { module: 'forms', permission_type: 'read' }
                ]
            };
        }

        if (method === 'PUT' && endpoint.match(/\/users\/\d+\/permissions$/)) {
            return {
                success: true,
                data: data
            };
        }

        return { success: false, message: 'Endpoint not found' };
    }

    handleMockSettings(method, endpoint, data) {
        if (method === 'GET' && endpoint === '/settings') {
            return {
                success: true,
                data: this.mockData.settings
            };
        }

        if (method === 'PUT' && endpoint.match(/\/settings\/[^\/]+\/value$/)) {
            const settingName = endpoint.split('/')[2];
            const setting = this.mockData.settings.find(s => s.name === settingName);
            if (setting) {
                setting.value = data.value;
                return { success: true, data: setting };
            }
            return { success: false, message: 'Setting not found' };
        }

        if (method === 'GET' && endpoint === '/themes') {
            return {
                success: true,
                data: this.mockData.themes
            };
        }

        if (method === 'GET' && endpoint.match(/\/themes\/\d+$/)) {
            const id = parseInt(endpoint.split('/').pop());
            const theme = this.mockData.themes.find(t => t.id === id);
            return theme ? { success: true, data: theme } : { success: false, message: 'Theme not found' };
        }

        if (method === 'POST' && endpoint === '/themes') {
            const newTheme = { id: Date.now(), ...data, created_at: new Date().toISOString() };
            this.mockData.themes.push(newTheme);
            return { success: true, data: newTheme };
        }

        if (method === 'PUT' && endpoint.match(/\/themes\/\d+$/)) {
            const id = parseInt(endpoint.split('/').pop());
            const index = this.mockData.themes.findIndex(t => t.id === id);
            if (index !== -1) {
                // If setting as default, remove default from others
                if (data.is_default) {
                    this.mockData.themes.forEach(t => t.is_default = false);
                }
                this.mockData.themes[index] = { ...this.mockData.themes[index], ...data };
                return { success: true, data: this.mockData.themes[index] };
            }
            return { success: false, message: 'Theme not found' };
        }

        if (method === 'DELETE' && endpoint.match(/\/themes\/\d+$/)) {
            const id = parseInt(endpoint.split('/').pop());
            const index = this.mockData.themes.findIndex(t => t.id === id);
            if (index !== -1) {
                this.mockData.themes.splice(index, 1);
                return { success: true };
            }
            return { success: false, message: 'Theme not found' };
        }

        if (endpoint === '/settings/categories') {
            return {
                success: true,
                data: [
                    { id: 1, title: 'General', name: 'general' },
                    { id: 2, title: 'SEO', name: 'seo' },
                    { id: 3, title: 'Email', name: 'email' }
                ]
            };
        }

        return { success: false, message: 'Endpoint not found' };
    }

    handleMockAudit(method, endpoint) {
        const logs = [...this.mockData.auditLogs];

        if (method === 'GET' && endpoint === '/audit/logs') {
            return {
                success: true,
                data: logs,
                pagination: { total: logs.length, pages: 1, current_page: 1, limit: 50 }
            };
        }

        if (method === 'GET' && endpoint.match(/\/audit\/logs\/\d+$/)) {
            const id = parseInt(endpoint.split('/').pop());
            const log = logs.find(l => l.id === id);
            return log ? { success: true, data: log } : { success: false, message: 'Log not found' };
        }

        if (endpoint === '/audit/statistics') {
            return {
                success: true,
                data: {
                    total_logs: logs.length,
                    today_logs: 12,
                    active_users: 3,
                    error_logs: 0
                }
            };
        }

        return { success: false, message: 'Endpoint not found' };
    }

    // Pages API
    async getPages(params = {}) {
        return this.get('/pages', params);
    }

    async getPage(id) {
        return this.get(`/pages/${id}`);
    }

    async createPage(data) {
        return this.post('/pages', data);
    }

    async updatePage(id, data) {
        return this.put(`/pages/${id}`, data);
    }

    async deletePage(id) {
        return this.delete(`/pages/${id}`);
    }

    async getPageTypes(params = {}) {
        return this.get('/pages/types', params);
    }

    async getPageType(id) {
        return this.get(`/pages/types/${id}`);
    }

    async createPageType(data) {
        return this.post('/pages/types', data);
    }

    async updatePageType(id, data) {
        return this.put(`/pages/types/${id}`, data);
    }

    async deletePageType(id) {
        return this.delete(`/pages/types/${id}`);
    }

    async getPageLayouts(params = {}) {
        return this.get('/pages/layouts', params);
    }

    async getPageLayout(id) {
        return this.get(`/pages/layouts/${id}`);
    }

    async createPageLayout(data) {
        return this.post('/pages/layouts', data);
    }

    async updatePageLayout(id, data) {
        return this.put(`/pages/layouts/${id}`, data);
    }

    async deletePageLayout(id) {
        return this.delete(`/pages/layouts/${id}`);
    }

    async getDesignBoxes(params = {}) {
        return this.get('/pages/design-boxes', params);
    }

    async getDesignBox(id) {
        return this.get(`/pages/design-boxes/${id}`);
    }

    async createDesignBox(data) {
        return this.post('/pages/design-boxes', data);
    }

    async updateDesignBox(id, data) {
        return this.put(`/pages/design-boxes/${id}`, data);
    }

    async deleteDesignBox(id) {
        return this.delete(`/pages/design-boxes/${id}`);
    }

    async getPageBlocks(params = {}) {
        return this.get('/pages/blocks', params);
    }

    async getPageBlock(id) {
        return this.get(`/pages/blocks/${id}`);
    }

    async createPageBlock(data) {
        return this.post('/pages/blocks', data);
    }

    async updatePageBlock(id, data) {
        return this.put(`/pages/blocks/${id}`, data);
    }

    async deletePageBlock(id) {
        return this.delete(`/pages/blocks/${id}`);
    }

    async getContentPlaceholders(params = {}) {
        return this.get('/pages/placeholders', params);
    }

    async getContentPlaceholder(id) {
        return this.get(`/pages/placeholders/${id}`);
    }

    async createContentPlaceholder(data) {
        return this.post('/pages/placeholders', data);
    }

    async updateContentPlaceholder(id, data) {
        return this.put(`/pages/placeholders/${id}`, data);
    }

    async deleteContentPlaceholder(id) {
        return this.delete(`/pages/placeholders/${id}`);
    }

    // Forms API
    async getForms(params = {}) {
        return this.get('/forms', params);
    }

    async getForm(id) {
        return this.get(`/forms/${id}`);
    }

    async createForm(data) {
        return this.post('/forms', data);
    }

    async updateForm(id, data) {
        return this.put(`/forms/${id}`, data);
    }

    async deleteForm(id) {
        return this.delete(`/forms/${id}`);
    }

    // Form Field Types API
    async getFormFieldTypes(params = {}) {
        return this.get('/forms/field-types', params);
    }

    async getFormFieldType(id) {
        return this.get(`/forms/field-types/${id}`);
    }

    async createFormFieldType(data) {
        return this.post('/forms/field-types', data);
    }

    async updateFormFieldType(id, data) {
        return this.put(`/forms/field-types/${id}`, data);
    }

    async deleteFormFieldType(id) {
        return this.delete(`/forms/field-types/${id}`);
    }

    // Form Fields API
    async getFormFields(params = {}) {
        return this.get('/forms/fields', params);
    }

    async getFormField(id) {
        return this.get(`/forms/fields/${id}`);
    }

    async createFormField(data) {
        return this.post('/forms/fields', data);
    }

    async updateFormField(id, data) {
        return this.put(`/forms/fields/${id}`, data);
    }

    async deleteFormField(id) {
        return this.delete(`/forms/fields/${id}`);
    }

    // Form Displays API
    async getFormDisplays(params = {}) {
        return this.get('/forms/displays', params);
    }

    async getFormDisplay(id) {
        return this.get(`/forms/displays/${id}`);
    }

    async createFormDisplay(data) {
        return this.post('/forms/displays', data);
    }

    async updateFormDisplay(id, data) {
        return this.put(`/forms/displays/${id}`, data);
    }

    async deleteFormDisplay(id) {
        return this.delete(`/forms/displays/${id}`);
    }

    // Form Display Fields API
    async getFormDisplayFields(params = {}) {
        return this.get('/forms/display-fields', params);
    }

    async getFormDisplayField(id) {
        return this.get(`/forms/display-fields/${id}`);
    }

    async createFormDisplayField(data) {
        return this.post('/forms/display-fields', data);
    }

    async updateFormDisplayField(id, data) {
        return this.put(`/forms/display-fields/${id}`, data);
    }

    async deleteFormDisplayField(id) {
        return this.delete(`/forms/display-fields/${id}`);
    }

    // Form Pre Lists API
    async getFormPreLists(params = {}) {
        return this.get('/forms/pre-lists', params);
    }

    async getFormPreList(id) {
        return this.get(`/forms/pre-lists/${id}`);
    }

    async createFormPreList(data) {
        return this.post('/forms/pre-lists', data);
    }

    async updateFormPreList(id, data) {
        return this.put(`/forms/pre-lists/${id}`, data);
    }

    async deleteFormPreList(id) {
        return this.delete(`/forms/pre-lists/${id}`);
    }

    // Form Pre Values API
    async getFormPreValues(params = {}) {
        return this.get('/forms/pre-values', params);
    }

    async getFormPreValue(id) {
        return this.get(`/forms/pre-values/${id}`);
    }

    async createFormPreValue(data) {
        return this.post('/forms/pre-values', data);
    }

    async updateFormPreValue(id, data) {
        return this.put(`/forms/pre-values/${id}`, data);
    }

    async deleteFormPreValue(id) {
        return this.delete(`/forms/pre-values/${id}`);
    }

    // Form Submissions API
    async getFormSubmissions(params = {}) {
        return this.get('/forms/submissions', params);
    }

    async getFormSubmission(id) {
        return this.get(`/forms/submissions/${id}`);
    }

    // Form Submission Data API
    async getFormSubmissionData(params = {}) {
        return this.get('/forms/submission-data', params);
    }

    async getFormSubmissionDataBySubmission(submissionId) {
        return this.get(`/forms/submissions/${submissionId}/data`);
    }

    // Widgets API
    async getWidgets(params = {}) {
        return this.get('/widgets', params);
    }

    async getWidget(id) {
        return this.get(`/widgets/${id}`);
    }

    async createWidget(data) {
        return this.post('/widgets', data);
    }

    async updateWidget(id, data) {
        return this.put(`/widgets/${id}`, data);
    }

    async deleteWidget(id) {
        return this.delete(`/widgets/${id}`);
    }

    async getWidgetTypes() {
        return this.get('/widgets/types');
    }

    // Media API
    async getMediaFiles(params = {}) {
        return this.get('/media/files', params);
    }

    async getMediaFile(id) {
        return this.get(`/media/files/${id}`);
    }

    async uploadMediaFile(file, data = {}) {
        return this.upload('/media/upload', file, data);
    }

    async updateMediaFile(id, data) {
        return this.put(`/media/files/${id}`, data);
    }

    async deleteMediaFile(id) {
        return this.delete(`/media/files/${id}`);
    }

    async getMediaFolders() {
        return this.get('/media/folders');
    }

    async createMediaFolder(data) {
        return this.post('/media/folders', data);
    }

    async getMediaStorages() {
        return this.get('/media/storages');
    }

    // Menus API
    async getMenuSets(params = {}) {
        return this.get('/menus/sets', params);
    }

    async getMenuSet(id) {
        return this.get(`/menus/sets/${id}`);
    }

    async createMenuSet(data) {
        return this.post('/menus/sets', data);
    }

    async updateMenuSet(id, data) {
        return this.put(`/menus/sets/${id}`, data);
    }

    async deleteMenuSet(id) {
        return this.delete(`/menus/sets/${id}`);
    }

    async getMenuItems(setId) {
        return this.get(`/menus/sets/${setId}/items`);
    }

    async createMenuItem(setId, data) {
        return this.post(`/menus/sets/${setId}/items`, data);
    }

    async updateMenuItem(setId, itemId, data) {
        return this.put(`/menus/sets/${setId}/items/${itemId}`, data);
    }

    async deleteMenuItem(setId, itemId) {
        return this.delete(`/menus/sets/${setId}/items/${itemId}`);
    }

    async getMenuTemplates() {
        return this.get('/menus/templates');
    }

    // Users API
    async getUsers(params = {}) {
        return this.get('/users', params);
    }

    async getUser(id) {
        return this.get(`/users/${id}`);
    }

    async createUser(data) {
        return this.post('/users', data);
    }

    async updateUser(id, data) {
        return this.put(`/users/${id}`, data);
    }

    async deleteUser(id) {
        return this.delete(`/users/${id}`);
    }

    async getUserPermissions(userId) {
        return this.get(`/users/${userId}/permissions`);
    }

    async updateUserPermissions(userId, permissions) {
        return this.put(`/users/${userId}/permissions`, permissions);
    }

    // Settings API
    async getSettings(params = {}) {
        return this.get('/settings', params);
    }

    async getSetting(name) {
        return this.get(`/settings/${name}`);
    }

    async updateSetting(name, value) {
        return this.put(`/settings/${name}/value`, { value });
    }

    async getSettingCategories() {
        return this.get('/settings/categories');
    }

    async getThemes() {
        return this.get('/themes');
    }

    async getTheme(id) {
        return this.get(`/themes/${id}`);
    }

    async createTheme(data) {
        return this.post('/themes', data);
    }

    async updateTheme(id, data) {
        return this.put(`/themes/${id}`, data);
    }

    async deleteTheme(id) {
        return this.delete(`/themes/${id}`);
    }

    // Audit API
    async getAuditLogs(params = {}) {
        return this.get('/audit/logs', params);
    }

    async getAuditLog(id) {
        return this.get(`/audit/logs/${id}`);
    }

    async getAuditStatistics() {
        return this.get('/audit/statistics');
    }

    // Relationships API
    async getRelationships(params = {}) {
        return this.get('/relationships', params);
    }

    async getRelationship(id) {
        return this.get(`/relationships/${id}`);
    }

    async createRelationship(data) {
        return this.post('/relationships', data);
    }

    async updateRelationship(id, data) {
        return this.put(`/relationships/${id}`, data);
    }

    async deleteRelationship(id) {
        return this.delete(`/relationships/${id}`);
    }
}
