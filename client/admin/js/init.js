/**
 * Initialization Script
 * Ensures proper loading order and initialization
 */

// Wait for DOM to be ready
document.addEventListener('DOMContentLoaded', function() {
    console.log('🚀 DOM loaded, initializing admin app...');
    
    // Check if all dependencies are loaded
    const checkDependencies = () => {
        const required = ['Utils', 'Components', 'API', 'AdminApp', 'PagesModule', 'UsersModule'];
        const missing = required.filter(dep => typeof window[dep] === 'undefined');
        
        if (missing.length > 0) {
            console.warn('⚠️ Missing dependencies:', missing);
            return false;
        }
        
        return true;
    };
    
    // Initialize app when dependencies are ready
    const initApp = () => {
        if (checkDependencies()) {
            console.log('✅ All dependencies loaded');
            
            // Initialize the admin application
            AdminApp.init().then(() => {
                console.log('🎉 Admin app initialized successfully!');
            }).catch(error => {
                console.error('❌ Failed to initialize admin app:', error);
            });
        } else {
            // Retry after a short delay
            setTimeout(initApp, 100);
        }
    };
    
    // Start initialization
    initApp();
});

// Global error handler
window.addEventListener('error', function(event) {
    console.error('Global error:', event.error);
    
    // Show user-friendly error message
    if (typeof Components !== 'undefined' && Components.showNotification) {
        Components.showNotification('An unexpected error occurred. Please refresh the page.', 'error');
    }
});

// Handle unhandled promise rejections
window.addEventListener('unhandledrejection', function(event) {
    console.error('Unhandled promise rejection:', event.reason);
    
    // Show user-friendly error message
    if (typeof Components !== 'undefined' && Components.showNotification) {
        Components.showNotification('A network or processing error occurred.', 'error');
    }
});

// Debug helper - expose to global scope in development
if (window.location.hostname === 'localhost' || window.location.hostname === '127.0.0.1') {
    window.DEBUG = {
        AdminApp,
        API,
        Components,
        Utils,
        PagesModule,
        UsersModule,
        
        // Helper functions for debugging
        testNotification: (message = 'Test notification', type = 'info') => {
            Components.showNotification(message, type);
        },
        
        testAPI: async () => {
            try {
                const health = await API.health();
                console.log('API Health:', health);
                return health;
            } catch (error) {
                console.error('API Test failed:', error);
                return error;
            }
        },
        
        showAllModules: () => {
            console.log('Available modules:', {
                AdminApp: typeof AdminApp,
                API: typeof API,
                Components: typeof Components,
                Utils: typeof Utils,
                PagesModule: typeof PagesModule,
                UsersModule: typeof UsersModule,
                SettingsModule: typeof SettingsModule
            });
        }
    };
    
    console.log('🔧 Debug mode enabled. Use window.DEBUG for debugging tools.');
}
