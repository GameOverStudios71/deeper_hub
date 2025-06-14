/**
 * DeeperHub CMS Debug System
 * Comprehensive debugging and logging system for the CMS client
 */

class CMSDebugger {
    constructor() {
        this.config = window.CMS_CONFIG?.DEBUG || {};
        this.enabled = this.config.ENABLED || false;
        this.logs = [];
        this.startTime = Date.now();
        this.sessionId = this.generateSessionId();
        
        if (this.enabled) {
            this.init();
        }
    }

    /**
     * Initialize the debug system
     */
    init() {
        this.loadPersistedLogs();
        this.createVisualDebugger();
        this.interceptConsole();
        this.setupGlobalErrorHandler();
        this.log('system', 'Debug system initialized', { sessionId: this.sessionId });
    }

    /**
     * Generate unique session ID
     */
    generateSessionId() {
        return 'cms_' + Date.now() + '_' + Math.random().toString(36).substr(2, 9);
    }

    /**
     * Main logging method
     */
    log(category, message, data = null, level = 'info') {
        if (!this.enabled) return;

        const timestamp = new Date().toISOString();
        const elapsed = Date.now() - this.startTime;
        
        const logEntry = {
            id: Date.now() + Math.random(),
            timestamp,
            elapsed,
            category,
            level,
            message,
            data: data ? this.sanitizeData(data) : null,
            stack: this.getStackTrace(),
            sessionId: this.sessionId
        };

        this.logs.push(logEntry);
        this.trimLogs();
        
        if (this.config.PERSIST_LOGS) {
            this.persistLogs();
        }

        this.displayLog(logEntry);
        this.updateVisualDebugger();
    }

    /**
     * API request logging
     */
    logApiRequest(method, url, data = null) {
        if (!this.config.SHOW_API_REQUESTS) return;
        
        this.log('api', `🔄 ${method.toUpperCase()} ${url}`, {
            method,
            url,
            data,
            timestamp: new Date().toISOString()
        }, 'info');
    }

    /**
     * API response logging
     */
    logApiResponse(method, url, status, data = null, error = null) {
        if (!this.config.SHOW_API_REQUESTS) return;
        
        const level = error ? 'error' : (status >= 400 ? 'warn' : 'info');
        const icon = error ? '❌' : (status >= 400 ? '⚠️' : '✅');
        
        this.log('api', `${icon} ${method.toUpperCase()} ${url} - ${status}`, {
            method,
            url,
            status,
            data,
            error,
            timestamp: new Date().toISOString()
        }, level);
    }

    /**
     * Form data logging
     */
    logFormData(formId, data, action = 'submit') {
        if (!this.config.SHOW_FORM_DATA) return;
        
        this.log('form', `📋 Form ${action}: ${formId}`, {
            formId,
            action,
            data: this.sanitizeFormData(data),
            fieldCount: Object.keys(data || {}).length
        }, 'info');
    }

    /**
     * Validation logging
     */
    logValidation(formId, isValid, errors = []) {
        if (!this.config.SHOW_VALIDATION) return;
        
        const level = isValid ? 'info' : 'warn';
        const icon = isValid ? '✅' : '❌';
        
        this.log('validation', `${icon} Validation ${formId}: ${isValid ? 'PASSED' : 'FAILED'}`, {
            formId,
            isValid,
            errors,
            errorCount: errors.length
        }, level);
    }

    /**
     * State change logging
     */
    logStateChange(module, property, oldValue, newValue) {
        if (!this.config.SHOW_STATE_CHANGES) return;
        
        this.log('state', `🔄 ${module}.${property} changed`, {
            module,
            property,
            oldValue,
            newValue,
            type: typeof newValue
        }, 'debug');
    }

    /**
     * Performance logging
     */
    logPerformance(operation, duration, details = null) {
        if (!this.config.SHOW_PERFORMANCE) return;
        
        const level = duration > 1000 ? 'warn' : 'info';
        const icon = duration > 1000 ? '🐌' : '⚡';
        
        this.log('performance', `${icon} ${operation}: ${duration}ms`, {
            operation,
            duration,
            details
        }, level);
    }

    /**
     * Error logging
     */
    logError(error, context = null) {
        if (!this.config.SHOW_ERRORS_DETAILED) return;
        
        this.log('error', `💥 ${error.message}`, {
            name: error.name,
            message: error.message,
            stack: error.stack,
            context
        }, 'error');
    }

    /**
     * Sanitize data for logging
     */
    sanitizeData(data) {
        if (!data) return null;
        
        try {
            const sanitized = JSON.parse(JSON.stringify(data));
            
            // Remove sensitive fields
            const sensitiveFields = ['password', 'token', 'secret', 'key', 'auth'];
            this.removeSensitiveFields(sanitized, sensitiveFields);
            
            return sanitized;
        } catch (e) {
            return { error: 'Failed to sanitize data', type: typeof data };
        }
    }

    /**
     * Sanitize form data
     */
    sanitizeFormData(data) {
        const sanitized = this.sanitizeData(data);
        
        // Additional form-specific sanitization
        if (sanitized && typeof sanitized === 'object') {
            Object.keys(sanitized).forEach(key => {
                if (key.toLowerCase().includes('password')) {
                    sanitized[key] = '[HIDDEN]';
                }
            });
        }
        
        return sanitized;
    }

    /**
     * Remove sensitive fields recursively
     */
    removeSensitiveFields(obj, sensitiveFields) {
        if (!obj || typeof obj !== 'object') return;
        
        Object.keys(obj).forEach(key => {
            if (sensitiveFields.some(field => key.toLowerCase().includes(field))) {
                obj[key] = '[HIDDEN]';
            } else if (typeof obj[key] === 'object') {
                this.removeSensitiveFields(obj[key], sensitiveFields);
            }
        });
    }

    /**
     * Get stack trace
     */
    getStackTrace() {
        try {
            throw new Error();
        } catch (e) {
            return e.stack?.split('\n').slice(3, 6).join('\n') || 'No stack trace available';
        }
    }

    /**
     * Display log in console
     */
    displayLog(logEntry) {
        const { level, category, message, data } = logEntry;
        
        if (!this.shouldLog(level)) return;
        
        const style = this.getLogStyle(level, category);
        const prefix = `[${category.toUpperCase()}]`;
        
        if (data) {
            console.groupCollapsed(`%c${prefix} ${message}`, style);
            console.log('Data:', data);
            console.log('Timestamp:', logEntry.timestamp);
            console.log('Elapsed:', logEntry.elapsed + 'ms');
            console.groupEnd();
        } else {
            console.log(`%c${prefix} ${message}`, style);
        }
    }

    /**
     * Check if should log based on level
     */
    shouldLog(level) {
        const levels = ['debug', 'info', 'warn', 'error'];
        const configLevel = this.config.CONSOLE_LEVEL || 'info';
        
        return levels.indexOf(level) >= levels.indexOf(configLevel);
    }

    /**
     * Get console style for log level and category
     */
    getLogStyle(level, category) {
        const styles = {
            debug: 'color: #6c757d; font-weight: normal;',
            info: 'color: #17a2b8; font-weight: bold;',
            warn: 'color: #ffc107; font-weight: bold;',
            error: 'color: #dc3545; font-weight: bold;'
        };
        
        const categoryColors = {
            api: 'background: #e3f2fd; color: #1976d2; padding: 2px 4px; border-radius: 3px;',
            form: 'background: #f3e5f5; color: #7b1fa2; padding: 2px 4px; border-radius: 3px;',
            validation: 'background: #fff3e0; color: #f57c00; padding: 2px 4px; border-radius: 3px;',
            state: 'background: #e8f5e8; color: #388e3c; padding: 2px 4px; border-radius: 3px;',
            performance: 'background: #fce4ec; color: #c2185b; padding: 2px 4px; border-radius: 3px;',
            error: 'background: #ffebee; color: #d32f2f; padding: 2px 4px; border-radius: 3px;',
            system: 'background: #f5f5f5; color: #424242; padding: 2px 4px; border-radius: 3px;'
        };
        
        return categoryColors[category] || styles[level] || styles.info;
    }

    /**
     * Trim logs to maximum count
     */
    trimLogs() {
        const maxLogs = this.config.MAX_LOGS || 1000;
        if (this.logs.length > maxLogs) {
            this.logs = this.logs.slice(-maxLogs);
        }
    }

    /**
     * Persist logs to localStorage
     */
    persistLogs() {
        try {
            const logsToStore = this.logs.slice(-100); // Store only last 100 logs
            localStorage.setItem('cms_debug_logs', JSON.stringify(logsToStore));
        } catch (e) {
            console.warn('Failed to persist debug logs:', e);
        }
    }

    /**
     * Load persisted logs
     */
    loadPersistedLogs() {
        try {
            const stored = localStorage.getItem('cms_debug_logs');
            if (stored) {
                const logs = JSON.parse(stored);
                this.logs = Array.isArray(logs) ? logs : [];
            }
        } catch (e) {
            console.warn('Failed to load persisted logs:', e);
            this.logs = [];
        }
    }

    /**
     * Create visual debugger panel
     */
    createVisualDebugger() {
        if (!this.config.VISUAL_DEBUGGER) return;

        const debugPanel = document.createElement('div');
        debugPanel.id = 'cms-debug-panel';
        debugPanel.innerHTML = `
            <div class="debug-header" title="⋮⋮ Arraste para mover o painel">
                <span class="debug-title">🐛 CMS Debug</span>
                <div class="debug-controls">
                    <button id="debug-clear" title="Clear logs">🗑️</button>
                    <button id="debug-download" title="Download logs">💾</button>
                    <button id="debug-toggle" title="Toggle panel">📋</button>
                    <button id="debug-close" title="Close">✖️</button>
                </div>
            </div>
            <div class="debug-content">
                <div class="debug-stats">
                    <span id="debug-count">0 logs</span>
                    <span id="debug-session">Session: ${this.sessionId}</span>
                </div>
                <div class="debug-filters">
                    <select id="debug-category-filter">
                        <option value="">All Categories</option>
                        <option value="api">API</option>
                        <option value="form">Forms</option>
                        <option value="validation">Validation</option>
                        <option value="state">State</option>
                        <option value="performance">Performance</option>
                        <option value="error">Errors</option>
                        <option value="system">System</option>
                    </select>
                    <select id="debug-level-filter">
                        <option value="">All Levels</option>
                        <option value="debug">Debug</option>
                        <option value="info">Info</option>
                        <option value="warn">Warning</option>
                        <option value="error">Error</option>
                    </select>
                </div>
                <div id="debug-logs" class="debug-logs"></div>
            </div>
        `;

        // Add CSS styles
        const style = document.createElement('style');
        style.textContent = `
            #cms-debug-panel {
                position: fixed;
                top: 10px;
                right: 10px;
                width: 400px;
                max-height: 600px;
                background: #fff;
                border: 1px solid #ddd;
                border-radius: 8px;
                box-shadow: 0 4px 12px rgba(0,0,0,0.15);
                font-family: 'Courier New', monospace;
                font-size: 12px;
                z-index: 10000;
                display: flex;
                flex-direction: column;
                cursor: move;
                user-select: none;
            }

            .debug-header {
                background: #f8f9fa;
                padding: 8px 12px;
                border-bottom: 1px solid #ddd;
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-radius: 8px 8px 0 0;
                cursor: move;
                position: relative;
            }

            .debug-header:hover {
                background: #e9ecef;
            }

            .debug-header::before {
                content: "⋮⋮";
                position: absolute;
                left: 5px;
                color: #6c757d;
                font-size: 14px;
                line-height: 1;
            }

            .debug-title {
                font-weight: bold;
                color: #495057;
                margin-left: 15px;
            }

            .debug-controls button {
                background: none;
                border: none;
                cursor: pointer;
                padding: 4px;
                margin-left: 4px;
                border-radius: 3px;
                font-size: 12px;
            }

            .debug-controls button:hover {
                background: #e9ecef;
            }

            .debug-content {
                flex: 1;
                overflow: hidden;
                display: flex;
                flex-direction: column;
            }

            .debug-stats {
                padding: 8px 12px;
                background: #f8f9fa;
                border-bottom: 1px solid #eee;
                display: flex;
                justify-content: space-between;
                font-size: 11px;
                color: #6c757d;
            }

            .debug-filters {
                padding: 8px 12px;
                border-bottom: 1px solid #eee;
                display: flex;
                gap: 8px;
            }

            .debug-filters select {
                flex: 1;
                padding: 4px;
                border: 1px solid #ddd;
                border-radius: 3px;
                font-size: 11px;
            }

            .debug-logs {
                flex: 1;
                overflow-y: auto;
                padding: 8px;
                max-height: 400px;
            }

            .debug-log-entry {
                margin-bottom: 8px;
                padding: 6px;
                border-radius: 4px;
                border-left: 3px solid #ddd;
                background: #f8f9fa;
            }

            .debug-log-entry.level-error {
                border-left-color: #dc3545;
                background: #f8d7da;
            }

            .debug-log-entry.level-warn {
                border-left-color: #ffc107;
                background: #fff3cd;
            }

            .debug-log-entry.level-info {
                border-left-color: #17a2b8;
                background: #d1ecf1;
            }

            .debug-log-entry.level-debug {
                border-left-color: #6c757d;
                background: #f8f9fa;
            }

            .debug-log-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 4px;
            }

            .debug-log-category {
                font-weight: bold;
                text-transform: uppercase;
                font-size: 10px;
                padding: 2px 4px;
                border-radius: 2px;
                background: #495057;
                color: white;
            }

            .debug-log-time {
                font-size: 10px;
                color: #6c757d;
            }

            .debug-log-message {
                margin-bottom: 4px;
                font-weight: bold;
            }

            .debug-log-data {
                font-size: 11px;
                color: #495057;
                background: #fff;
                padding: 4px;
                border-radius: 2px;
                border: 1px solid #dee2e6;
                max-height: 100px;
                overflow-y: auto;
            }

            .debug-panel-minimized {
                height: auto !important;
                max-height: none !important;
            }

            .debug-panel-minimized .debug-content {
                display: none;
            }
        `;

        document.head.appendChild(style);
        document.body.appendChild(debugPanel);

        this.setupDebugPanelEvents();
        this.makePanelDraggable(debugPanel);
    }

    /**
     * Setup debug panel events
     */
    setupDebugPanelEvents() {
        const panel = document.getElementById('cms-debug-panel');
        if (!panel) return;

        // Clear logs
        document.getElementById('debug-clear')?.addEventListener('click', () => {
            this.clearLogs();
        });

        // Download logs
        document.getElementById('debug-download')?.addEventListener('click', () => {
            this.downloadLogs();
        });

        // Toggle panel
        document.getElementById('debug-toggle')?.addEventListener('click', () => {
            panel.classList.toggle('debug-panel-minimized');
        });

        // Close panel
        document.getElementById('debug-close')?.addEventListener('click', () => {
            panel.style.display = 'none';
        });

        // Filter events
        document.getElementById('debug-category-filter')?.addEventListener('change', () => {
            this.updateVisualDebugger();
        });

        document.getElementById('debug-level-filter')?.addEventListener('change', () => {
            this.updateVisualDebugger();
        });
    }

    /**
     * Make debug panel draggable
     */
    makePanelDraggable(panel) {
        const header = panel.querySelector('.debug-header');
        if (!header) return;

        let isDragging = false;
        let currentX;
        let currentY;
        let initialX;
        let initialY;
        let xOffset = 0;
        let yOffset = 0;

        // Get initial position from CSS
        const rect = panel.getBoundingClientRect();
        xOffset = rect.left;
        yOffset = rect.top;

        header.addEventListener('mousedown', dragStart);
        document.addEventListener('mousemove', drag);
        document.addEventListener('mouseup', dragEnd);

        function dragStart(e) {
            if (e.target.closest('.debug-controls')) {
                // Don't drag if clicking on control buttons
                return;
            }

            initialX = e.clientX - xOffset;
            initialY = e.clientY - yOffset;

            if (e.target === header || header.contains(e.target)) {
                isDragging = true;
                panel.style.cursor = 'grabbing';
                header.style.cursor = 'grabbing';
            }
        }

        function drag(e) {
            if (isDragging) {
                e.preventDefault();

                currentX = e.clientX - initialX;
                currentY = e.clientY - initialY;

                // Keep panel within viewport bounds
                const maxX = window.innerWidth - panel.offsetWidth;
                const maxY = window.innerHeight - panel.offsetHeight;

                currentX = Math.max(0, Math.min(currentX, maxX));
                currentY = Math.max(0, Math.min(currentY, maxY));

                xOffset = currentX;
                yOffset = currentY;

                panel.style.left = currentX + 'px';
                panel.style.top = currentY + 'px';
                panel.style.right = 'auto'; // Remove right positioning
            }
        }

        function dragEnd() {
            if (isDragging) {
                initialX = currentX;
                initialY = currentY;
                isDragging = false;
                panel.style.cursor = 'move';
                header.style.cursor = 'move';

                // Save position to localStorage
                try {
                    localStorage.setItem('cms_debug_panel_position', JSON.stringify({
                        x: currentX,
                        y: currentY
                    }));
                } catch (e) {
                    console.warn('Failed to save debug panel position:', e);
                }
            }
        }

        // Restore saved position
        this.restorePanelPosition(panel);
    }

    /**
     * Restore panel position from localStorage
     */
    restorePanelPosition(panel) {
        try {
            const saved = localStorage.getItem('cms_debug_panel_position');
            if (saved) {
                const position = JSON.parse(saved);

                // Validate position is within current viewport
                const maxX = window.innerWidth - panel.offsetWidth;
                const maxY = window.innerHeight - panel.offsetHeight;

                const x = Math.max(0, Math.min(position.x, maxX));
                const y = Math.max(0, Math.min(position.y, maxY));

                panel.style.left = x + 'px';
                panel.style.top = y + 'px';
                panel.style.right = 'auto';
            }
        } catch (e) {
            console.warn('Failed to restore debug panel position:', e);
        }
    }

    /**
     * Update visual debugger with current logs
     */
    updateVisualDebugger() {
        if (!this.config.VISUAL_DEBUGGER) return;

        const logsContainer = document.getElementById('debug-logs');
        const countElement = document.getElementById('debug-count');
        const categoryFilter = document.getElementById('debug-category-filter')?.value;
        const levelFilter = document.getElementById('debug-level-filter')?.value;

        if (!logsContainer || !countElement) return;

        // Filter logs
        let filteredLogs = this.logs;
        if (categoryFilter) {
            filteredLogs = filteredLogs.filter(log => log.category === categoryFilter);
        }
        if (levelFilter) {
            filteredLogs = filteredLogs.filter(log => log.level === levelFilter);
        }

        // Update count
        countElement.textContent = `${filteredLogs.length} logs`;

        // Render logs (show last 50 for performance)
        const recentLogs = filteredLogs.slice(-50);
        logsContainer.innerHTML = recentLogs.map(log => this.renderLogEntry(log)).join('');

        // Auto-scroll to bottom
        logsContainer.scrollTop = logsContainer.scrollHeight;
    }

    /**
     * Render a single log entry
     */
    renderLogEntry(log) {
        const time = new Date(log.timestamp).toLocaleTimeString();
        const dataHtml = log.data ? `<div class="debug-log-data">${JSON.stringify(log.data, null, 2)}</div>` : '';

        return `
            <div class="debug-log-entry level-${log.level}">
                <div class="debug-log-header">
                    <span class="debug-log-category">${log.category}</span>
                    <span class="debug-log-time">${time} (+${log.elapsed}ms)</span>
                </div>
                <div class="debug-log-message">${log.message}</div>
                ${dataHtml}
            </div>
        `;
    }

    /**
     * Clear all logs
     */
    clearLogs() {
        this.logs = [];
        if (this.config.PERSIST_LOGS) {
            localStorage.removeItem('cms_debug_logs');
        }
        this.updateVisualDebugger();
        this.log('system', 'Debug logs cleared', null, 'info');
    }

    /**
     * Download logs as JSON file
     */
    downloadLogs() {
        const data = {
            sessionId: this.sessionId,
            timestamp: new Date().toISOString(),
            logs: this.logs
        };

        const blob = new Blob([JSON.stringify(data, null, 2)], { type: 'application/json' });
        const url = URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = `cms-debug-logs-${this.sessionId}.json`;
        document.body.appendChild(a);
        a.click();
        document.body.removeChild(a);
        URL.revokeObjectURL(url);

        this.log('system', 'Debug logs downloaded', { filename: a.download }, 'info');
    }

    /**
     * Intercept console methods for additional logging
     */
    interceptConsole() {
        const originalConsole = {
            log: console.log,
            warn: console.warn,
            error: console.error
        };

        console.log = (...args) => {
            originalConsole.log(...args);
            if (args[0] && typeof args[0] === 'string' && !args[0].includes('[')) {
                this.log('console', args.join(' '), null, 'debug');
            }
        };

        console.warn = (...args) => {
            originalConsole.warn(...args);
            this.log('console', args.join(' '), null, 'warn');
        };

        console.error = (...args) => {
            originalConsole.error(...args);
            this.log('console', args.join(' '), null, 'error');
        };
    }

    /**
     * Setup global error handler
     */
    setupGlobalErrorHandler() {
        window.addEventListener('error', (event) => {
            this.logError(event.error, {
                filename: event.filename,
                lineno: event.lineno,
                colno: event.colno
            });
        });

        window.addEventListener('unhandledrejection', (event) => {
            this.logError(new Error(event.reason), {
                type: 'unhandledrejection',
                reason: event.reason
            });
        });
    }

    /**
     * Get debug statistics
     */
    getStats() {
        const stats = {
            totalLogs: this.logs.length,
            sessionId: this.sessionId,
            uptime: Date.now() - this.startTime,
            categories: {},
            levels: {}
        };

        this.logs.forEach(log => {
            stats.categories[log.category] = (stats.categories[log.category] || 0) + 1;
            stats.levels[log.level] = (stats.levels[log.level] || 0) + 1;
        });

        return stats;
    }

    /**
     * Enable/disable debug system
     */
    toggle(enabled = null) {
        this.enabled = enabled !== null ? enabled : !this.enabled;

        if (this.enabled) {
            this.log('system', 'Debug system enabled', null, 'info');
        } else {
            console.log('Debug system disabled');
        }

        const panel = document.getElementById('cms-debug-panel');
        if (panel) {
            panel.style.display = this.enabled ? 'flex' : 'none';
        }
    }
}

// Create global debug instance
window.CMSDebug = new CMSDebugger();

// Export for module use
if (typeof module !== 'undefined' && module.exports) {
    module.exports = CMSDebugger;
}
