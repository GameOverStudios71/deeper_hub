/**
 * DEEPER HUB CMS - API Client
 * Handles all communication with the CMS API
 */

class APIClient {
    constructor() {
        this.baseURL = 'http://localhost:4000';
        this.apiBase = '/api/cms';
        this.timeout = 30000; // 30 seconds
        this.retryAttempts = 3;
        this.retryDelay = 1000; // 1 second
        
        // Request interceptors
        this.requestInterceptors = [];
        this.responseInterceptors = [];
        
        // Cache for GET requests
        this.cache = new Map();
        this.cacheTimeout = 5 * 60 * 1000; // 5 minutes
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
     * Make HTTP request with retry logic
     */
    async request(method, endpoint, data = null, options = {}) {
        const url = `${this.baseURL}${this.apiBase}${endpoint}`;
        
        // Check cache for GET requests
        if (method === 'GET' && !options.skipCache) {
            const cached = this.getFromCache(url);
            if (cached) {
                return cached;
            }
        }

        const config = {
            method: method.toUpperCase(),
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                ...options.headers
            },
            ...options
        };

        if (data && ['POST', 'PUT', 'PATCH'].includes(config.method)) {
            config.body = JSON.stringify(data);
        }

        // Apply request interceptors
        for (const interceptor of this.requestInterceptors) {
            await interceptor(config);
        }

        let lastError;
        
        for (let attempt = 1; attempt <= this.retryAttempts; attempt++) {
            try {
                const controller = new AbortController();
                const timeoutId = setTimeout(() => controller.abort(), this.timeout);
                
                config.signal = controller.signal;
                
                const response = await fetch(url, config);
                clearTimeout(timeoutId);
                
                // Apply response interceptors
                for (const interceptor of this.responseInterceptors) {
                    await interceptor(response);
                }

                if (!response.ok) {
                    throw new Error(`HTTP ${response.status}: ${response.statusText}`);
                }

                const result = await response.json();
                
                // Cache successful GET requests
                if (method === 'GET' && result.status === 'success') {
                    this.setCache(url, result);
                }

                return result;

            } catch (error) {
                lastError = error;
                
                // Don't retry on certain errors
                if (error.name === 'AbortError' || 
                    (error.message && error.message.includes('HTTP 4'))) {
                    break;
                }
                
                // Wait before retry
                if (attempt < this.retryAttempts) {
                    await this.delay(this.retryDelay * attempt);
                }
            }
        }

        throw lastError;
    }

    /**
     * GET request
     */
    async get(endpoint, options = {}) {
        return this.request('GET', endpoint, null, options);
    }

    /**
     * POST request
     */
    async post(endpoint, data, options = {}) {
        return this.request('POST', endpoint, data, options);
    }

    /**
     * PUT request
     */
    async put(endpoint, data, options = {}) {
        return this.request('PUT', endpoint, data, options);
    }

    /**
     * PATCH request
     */
    async patch(endpoint, data, options = {}) {
        return this.request('PATCH', endpoint, data, options);
    }

    /**
     * DELETE request
     */
    async delete(endpoint, options = {}) {
        return this.request('DELETE', endpoint, null, options);
    }

    /**
     * Upload file
     */
    async upload(endpoint, file, progressCallback = null) {
        const formData = new FormData();
        formData.append('file', file);

        const config = {
            method: 'POST',
            body: formData,
            headers: {} // Let browser set Content-Type for FormData
        };

        if (progressCallback) {
            // Note: Progress tracking would need server-sent events or WebSocket
            // This is a placeholder for future implementation
        }

        const url = `${this.baseURL}${this.apiBase}${endpoint}`;
        const response = await fetch(url, config);

        if (!response.ok) {
            throw new Error(`Upload failed: ${response.statusText}`);
        }

        return response.json();
    }

    /**
     * Cache management
     */
    setCache(key, data) {
        this.cache.set(key, {
            data,
            timestamp: Date.now()
        });
    }

    getFromCache(key) {
        const cached = this.cache.get(key);
        if (!cached) return null;

        const isExpired = Date.now() - cached.timestamp > this.cacheTimeout;
        if (isExpired) {
            this.cache.delete(key);
            return null;
        }

        return cached.data;
    }

    clearCache() {
        this.cache.clear();
    }

    /**
     * Utility methods
     */
    delay(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }

    /**
     * Build query string from object
     */
    buildQueryString(params) {
        const searchParams = new URLSearchParams();
        Object.keys(params).forEach(key => {
            if (params[key] !== null && params[key] !== undefined) {
                searchParams.append(key, params[key]);
            }
        });
        return searchParams.toString();
    }

    // ============================================================================
    // CMS API METHODS
    // ============================================================================

    /**
     * Pages API
     */
    pages = {
        list: (params = {}) => {
            const query = this.buildQueryString(params);
            return this.get(`/pages${query ? '?' + query : ''}`);
        },
        
        get: (id) => this.get(`/pages/${id}`),
        
        create: (data) => this.post('/pages', data),
        
        update: (id, data) => this.put(`/pages/${id}`, data),
        
        delete: (id) => this.delete(`/pages/${id}`),
        
        publish: (id) => this.post(`/pages/${id}/publish`),
        
        unpublish: (id) => this.post(`/pages/${id}/unpublish`)
    };

    /**
     * Widgets API
     */
    widgets = {
        list: (params = {}) => {
            const query = this.buildQueryString(params);
            return this.get(`/widgets${query ? '?' + query : ''}`);
        },
        
        get: (id) => this.get(`/widgets/${id}`),
        
        create: (data) => this.post('/widgets', data),
        
        update: (id, data) => this.put(`/widgets/${id}`, data),
        
        delete: (id) => this.delete(`/widgets/${id}`)
    };

    /**
     * Forms API
     */
    forms = {
        list: (params = {}) => {
            const query = this.buildQueryString(params);
            return this.get(`/forms${query ? '?' + query : ''}`);
        },
        
        get: (id) => this.get(`/forms/${id}`),
        
        create: (data) => this.post('/forms', data),
        
        update: (id, data) => this.put(`/forms/${id}`, data),
        
        delete: (id) => this.delete(`/forms/${id}`),
        
        submissions: (id, params = {}) => {
            const query = this.buildQueryString(params);
            return this.get(`/forms/${id}/submissions${query ? '?' + query : ''}`);
        }
    };

    /**
     * Menus API
     */
    menus = {
        list: (params = {}) => {
            const query = this.buildQueryString(params);
            return this.get(`/menus${query ? '?' + query : ''}`);
        },
        
        get: (id) => this.get(`/menus/${id}`),
        
        create: (data) => this.post('/menus', data),
        
        update: (id, data) => this.put(`/menus/${id}`, data),
        
        delete: (id) => this.delete(`/menus/${id}`)
    };

    /**
     * Media API
     */
    media = {
        list: (params = {}) => {
            const query = this.buildQueryString(params);
            return this.get(`/media${query ? '?' + query : ''}`);
        },
        
        get: (id) => this.get(`/media/${id}`),
        
        upload: (file, progressCallback) => this.upload('/media', file, progressCallback),
        
        update: (id, data) => this.put(`/media/${id}`, data),
        
        delete: (id) => this.delete(`/media/${id}`)
    };

    /**
     * Users API
     */
    users = {
        list: (params = {}) => {
            const query = this.buildQueryString(params);
            return this.get(`/users${query ? '?' + query : ''}`);
        },
        
        get: (id) => this.get(`/users/${id}`),
        
        create: (data) => this.post('/users', data),
        
        update: (id, data) => this.put(`/users/${id}`, data),
        
        delete: (id) => this.delete(`/users/${id}`),
        
        permissions: (id) => this.get(`/users/${id}/permissions`)
    };

    /**
     * Settings API
     */
    settings = {
        list: (params = {}) => {
            const query = this.buildQueryString(params);
            return this.get(`/settings${query ? '?' + query : ''}`);
        },

        get: (key) => this.get(`/settings/${key}`),

        create: (data) => this.post('/settings', data),

        update: (key, data) => this.put(`/settings/${key}`, data),

        delete: (key) => this.delete(`/settings/${key}`)
    };

    /**
     * Themes API
     */
    themes = {
        list: () => this.get('/themes'),
        
        get: (id) => this.get(`/themes/${id}`),
        
        activate: (id) => this.post(`/themes/${id}/activate`)
    };

    /**
     * Audit API
     */
    audit = {
        logs: (params = {}) => {
            const query = this.buildQueryString(params);
            return this.get(`/audit/logs${query ? '?' + query : ''}`);
        },
        
        statistics: () => this.get('/audit/statistics'),
        
        recent: (hours = 24) => this.get(`/audit/activity/recent?hours=${hours}`)
    };

    /**
     * Relationships API
     */
    relationships = {
        list: (params = {}) => {
            const query = this.buildQueryString(params);
            return this.get(`/relationships${query ? '?' + query : ''}`);
        },
        
        get: (id) => this.get(`/relationships/${id}`),
        
        create: (data) => this.post('/relationships', data),
        
        delete: (id) => this.delete(`/relationships/${id}`)
    };
}

// Create global API instance
const API = new APIClient();

// Add default request interceptor for authentication
API.addRequestInterceptor(async (config) => {
    const token = Utils.storage.get('auth_token');
    if (token) {
        config.headers.Authorization = `Bearer ${token}`;
    }
});

// Add default response interceptor for error handling
API.addResponseInterceptor(async (response) => {
    if (response.status === 401) {
        // Handle unauthorized access
        Utils.storage.remove('auth_token');
        if (window.AdminApp) {
            AdminApp.showNotification('Session expired. Please login again.', 'error');
            AdminApp.logout();
        }
    }
});
