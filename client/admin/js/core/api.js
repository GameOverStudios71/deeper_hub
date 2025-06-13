/**
 * API Client - Core API functionality
 * Handles all HTTP requests to the backend
 */

class APIClient {
    constructor() {
        this.baseURL = 'http://localhost:4000';
        this.apiBase = '/api';
        this.requestInterceptors = [];
        this.responseInterceptors = [];
    }

    /**
     * Add request interceptor
     */
    addRequestInterceptor(interceptor) {
        this.requestInterceptors.push(interceptor);
    }

    /**
     * Add response interceptor
     */
    addResponseInterceptor(interceptor) {
        this.responseInterceptors.push(interceptor);
    }

    /**
     * Build query string from parameters
     */
    buildQueryString(params) {
        if (!params || Object.keys(params).length === 0) return '';
        
        return Object.entries(params)
            .filter(([key, value]) => value !== null && value !== undefined)
            .map(([key, value]) => `${encodeURIComponent(key)}=${encodeURIComponent(value)}`)
            .join('&');
    }

    /**
     * Make HTTP request
     */
    async request(endpoint, options = {}) {
        const url = `${this.baseURL}${this.apiBase}${endpoint}`;
        
        // Default config
        const config = {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                ...options.headers
            },
            ...options
        };

        // Apply request interceptors
        for (const interceptor of this.requestInterceptors) {
            await interceptor(config);
        }

        try {
            const response = await fetch(url, config);
            
            // Apply response interceptors
            for (const interceptor of this.responseInterceptors) {
                await interceptor(response);
            }

            if (!response.ok) {
                throw new Error(`HTTP ${response.status}: ${response.statusText}`);
            }

            const data = await response.json();
            return data;
        } catch (error) {
            console.error('API Request failed:', error);
            throw error;
        }
    }

    /**
     * GET request
     */
    get(endpoint, params = {}) {
        const query = this.buildQueryString(params);
        const url = query ? `${endpoint}?${query}` : endpoint;
        return this.request(url);
    }

    /**
     * POST request
     */
    post(endpoint, data = {}) {
        return this.request(endpoint, {
            method: 'POST',
            body: JSON.stringify(data)
        });
    }

    /**
     * PUT request
     */
    put(endpoint, data = {}) {
        return this.request(endpoint, {
            method: 'PUT',
            body: JSON.stringify(data)
        });
    }

    /**
     * DELETE request
     */
    delete(endpoint) {
        return this.request(endpoint, {
            method: 'DELETE'
        });
    }

    // ============================================================================
    // API ENDPOINTS
    // ============================================================================

    /**
     * Pages API
     */
    pages = {
        list: (params = {}) => {
            const query = this.buildQueryString(params);
            return this.get(`/cms/pages${query ? '?' + query : ''}`);
        },
        
        get: (id) => this.get(`/cms/pages/${id}`),
        create: (data) => this.post('/cms/pages', data),
        update: (id, data) => this.put(`/cms/pages/${id}`, data),
        delete: (id) => this.delete(`/cms/pages/${id}`)
    };

    /**
     * Users API
     */
    users = {
        list: (params = {}) => {
            const query = this.buildQueryString(params);
            return this.get(`/cms/users${query ? '?' + query : ''}`);
        },
        
        get: (id) => this.get(`/cms/users/${id}`),
        create: (data) => this.post('/cms/users', data),
        update: (id, data) => this.put(`/cms/users/${id}`, data),
        delete: (id) => this.delete(`/cms/users/${id}`)
    };

    /**
     * Settings API
     */
    settings = {
        list: (params = {}) => {
            const query = this.buildQueryString(params);
            return this.get(`/cms/settings${query ? '?' + query : ''}`);
        },
        
        get: (key) => this.get(`/cms/settings/name/${key}`),
        create: (data) => this.post('/cms/settings', data),
        update: (key, data) => this.put(`/cms/settings/name/${key}`, data),
        delete: (key) => this.delete(`/cms/settings/name/${key}`)
    };

    /**
     * Widgets API
     */
    widgets = {
        list: (params = {}) => {
            const query = this.buildQueryString(params);
            return this.get(`/cms/widgets${query ? '?' + query : ''}`);
        },
        
        get: (id) => this.get(`/cms/widgets/${id}`),
        create: (data) => this.post('/cms/widgets', data),
        update: (id, data) => this.put(`/cms/widgets/${id}`, data),
        delete: (id) => this.delete(`/cms/widgets/${id}`)
    };

    /**
     * Forms API
     */
    forms = {
        list: (params = {}) => {
            const query = this.buildQueryString(params);
            return this.get(`/cms/forms${query ? '?' + query : ''}`);
        },
        
        get: (id) => this.get(`/cms/forms/${id}`),
        create: (data) => this.post('/cms/forms', data),
        update: (id, data) => this.put(`/cms/forms/${id}`, data),
        delete: (id) => this.delete(`/cms/forms/${id}`)
    };

    /**
     * Menus API
     */
    menus = {
        list: (params = {}) => {
            const query = this.buildQueryString(params);
            return this.get(`/cms/menus${query ? '?' + query : ''}`);
        },
        
        get: (id) => this.get(`/cms/menus/${id}`),
        create: (data) => this.post('/cms/menus', data),
        update: (id, data) => this.put(`/cms/menus/${id}`, data),
        delete: (id) => this.delete(`/cms/menus/${id}`)
    };

    /**
     * Media API
     */
    media = {
        list: (params = {}) => {
            const query = this.buildQueryString(params);
            return this.get(`/cms/media${query ? '?' + query : ''}`);
        },
        
        get: (id) => this.get(`/cms/media/${id}`),
        upload: (file) => {
            const formData = new FormData();
            formData.append('file', file);
            return this.request('/cms/media', {
                method: 'POST',
                body: formData,
                headers: {} // Let browser set Content-Type for FormData
            });
        },
        delete: (id) => this.delete(`/cms/media/${id}`)
    };

    /**
     * Themes API
     */
    themes = {
        list: (params = {}) => {
            const query = this.buildQueryString(params);
            return this.get(`/cms/themes${query ? '?' + query : ''}`);
        },
        
        get: (id) => this.get(`/cms/themes/${id}`),
        create: (data) => this.post('/cms/themes', data),
        update: (id, data) => this.put(`/cms/themes/${id}`, data),
        delete: (id) => this.delete(`/cms/themes/${id}`)
    };

    /**
     * Audit API
     */
    audit = {
        logs: (params = {}) => {
            const query = this.buildQueryString(params);
            return this.get(`/cms/audit${query ? '?' + query : ''}`);
        },
        
        statistics: () => this.get('/cms/audit/statistics'),
        recent: (hours = 24) => this.get(`/cms/audit/activity/recent?hours=${hours}`)
    };

    /**
     * Health check
     */
    health = () => this.get('/cms/health');
}

// Create global API instance
const API = new APIClient();

// Expose to global scope
window.API = API;
window.APIClient = APIClient;

// Add authentication interceptor
API.addRequestInterceptor(async (config) => {
    const token = Utils.storage.get('auth_token');
    if (token) {
        config.headers.Authorization = `Bearer ${token}`;
    }
});

// Add error handling interceptor
API.addResponseInterceptor(async (response) => {
    if (response.status === 401) {
        Utils.storage.remove('auth_token');
        if (window.AdminApp) {
            AdminApp.showNotification('Session expired. Please login again.', 'error');
        }
    }
});
