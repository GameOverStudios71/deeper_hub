/**
 * Configuration for DeeperHub CMS Admin Client
 */
window.CMS_CONFIG = {
    // API Configuration
    API_BASE_URL: 'http://localhost:4000/api/cms',

    // Production Login Credentials (from backend seed)
    DEFAULT_CREDENTIALS: {
        email: 'sysop@system.com',
        password: 'password123'
    },
    
    // Pagination Settings
    DEFAULT_PAGE_SIZE: 20,
    MEDIA_PAGE_SIZE: 24,
    AUDIT_PAGE_SIZE: 50,
    
    // File Upload Settings
    MAX_FILE_SIZE: 5 * 1024 * 1024, // 5MB
    ALLOWED_IMAGE_TYPES: ['image/jpeg', 'image/png', 'image/gif', 'image/webp'],
    ALLOWED_DOCUMENT_TYPES: ['application/pdf', 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'],
    
    // UI Settings
    DEBOUNCE_DELAY: 500, // milliseconds for search debounce
    TOAST_DURATION: 5000, // milliseconds for success messages
    ERROR_DURATION: 8000, // milliseconds for error messages
    
    // Security Settings
    TOKEN_STORAGE_KEY: 'cms_token',
    USER_STORAGE_KEY: 'current_user',
    
    // Feature Flags
    FEATURES: {
        DRAG_DROP_UPLOAD: true,
        DARK_MODE: true,
        ADVANCED_SEARCH: true,
        BULK_OPERATIONS: true,
        REAL_TIME_UPDATES: false
    },

    // Debug Settings
    DEBUG: {
        ENABLED: true,                    // Master debug flag
        SHOW_API_REQUESTS: true,         // Log API requests/responses
        SHOW_FORM_DATA: true,            // Log form data before submission
        SHOW_VALIDATION: true,           // Log validation results
        SHOW_STATE_CHANGES: true,        // Log state changes in modules
        SHOW_PERFORMANCE: true,          // Log performance metrics
        SHOW_ERRORS_DETAILED: true,      // Show detailed error information
        CONSOLE_LEVEL: 'info',           // 'debug', 'info', 'warn', 'error'
        VISUAL_DEBUGGER: true,           // Show visual debug panel
        PERSIST_LOGS: true,              // Keep logs in localStorage
        MAX_LOGS: 1000                   // Maximum number of logs to keep
    },
    
    // Theme Settings
    THEME: {
        PRIMARY_COLOR: '#007bff',
        SECONDARY_COLOR: '#6c757d',
        SUCCESS_COLOR: '#28a745',
        DANGER_COLOR: '#dc3545',
        WARNING_COLOR: '#ffc107',
        INFO_COLOR: '#17a2b8'
    }
};

/**
 * Initialize CMS Client with configuration
 */
function initializeCMS() {
    // Create global CMS client instance
    window.cms = new CMSClient(CMS_CONFIG.API_BASE_URL);

    // Apply theme colors to CSS variables
    if (CMS_CONFIG.THEME) {
        const root = document.documentElement;
        Object.keys(CMS_CONFIG.THEME).forEach(key => {
            const cssVar = '--' + key.toLowerCase().replace(/_/g, '-');
            root.style.setProperty(cssVar, CMS_CONFIG.THEME[key]);
        });
    }

    // Initialize debug system
    if (window.CMSDebug && CMS_CONFIG.DEBUG.ENABLED) {
        window.CMSDebug.log('system', 'CMS Client initialized', {
            apiUrl: CMS_CONFIG.API_BASE_URL,
            features: CMS_CONFIG.FEATURES,
            debug: CMS_CONFIG.DEBUG,
            mode: 'PRODUCTION'
        }, 'info');
    } else {
        console.log('CMS Client initialized:', {
            apiUrl: CMS_CONFIG.API_BASE_URL,
            features: CMS_CONFIG.FEATURES,
            mode: 'PRODUCTION'
        });
    }
}

// Initialize when DOM is ready
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initializeCMS);
} else {
    initializeCMS();
}
