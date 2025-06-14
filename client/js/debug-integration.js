/**
 * Debug Integration Helper
 * Adiciona debug automático a todos os módulos do sistema
 */

// Função para adicionar debug a métodos de carregamento
function addDebugToLoadMethods() {
    const modules = ['Media', 'Menus', 'Settings', 'Entities', 'Audit', 'Dashboard'];
    
    modules.forEach(moduleName => {
        const module = window[moduleName];
        if (!module) return;
        
        // Interceptar métodos de carregamento
        const loadMethods = ['loadTabData', 'loadData', 'loadCurrentTab', 'init'];
        
        loadMethods.forEach(methodName => {
            if (typeof module[methodName] === 'function') {
                const originalMethod = module[methodName];
                
                module[methodName] = async function(...args) {
                    const startTime = performance.now();
                    
                    // Debug logging
                    if (window.CMSDebug) {
                        window.CMSDebug.logStateChange(moduleName, methodName, null, args);
                    }
                    
                    try {
                        const result = await originalMethod.apply(this, args);
                        const duration = performance.now() - startTime;
                        
                        // Debug performance logging
                        if (window.CMSDebug) {
                            window.CMSDebug.logPerformance(`${moduleName}.${methodName}`, duration, {
                                args,
                                result: result?.data?.length || 'unknown'
                            });
                        }
                        
                        return result;
                    } catch (error) {
                        // Debug error logging
                        if (window.CMSDebug) {
                            window.CMSDebug.logError(error, { 
                                module: moduleName, 
                                method: methodName, 
                                args 
                            });
                        }
                        throw error;
                    }
                };
            }
        });
        
        // Interceptar métodos de salvamento
        const saveMethods = ['saveRecord', 'save', 'create', 'update'];
        
        saveMethods.forEach(methodName => {
            if (typeof module[methodName] === 'function') {
                const originalMethod = module[methodName];
                
                module[methodName] = async function(...args) {
                    const formData = args[0];
                    const recordId = args[1];
                    
                    // Debug form logging
                    if (window.CMSDebug && formData) {
                        window.CMSDebug.logFormData(`#${moduleName}Form`, formData, recordId ? 'update' : 'create');
                    }
                    
                    try {
                        const result = await originalMethod.apply(this, args);
                        return result;
                    } catch (error) {
                        // Debug error logging
                        if (window.CMSDebug) {
                            window.CMSDebug.logError(error, { 
                                module: moduleName, 
                                method: methodName, 
                                formData,
                                recordId
                            });
                        }
                        throw error;
                    }
                };
            }
        });
    });
}

// Função para interceptar Utils.validateForm
function addDebugToValidation() {
    if (window.Utils && typeof window.Utils.validateForm === 'function') {
        const originalValidateForm = window.Utils.validateForm;
        
        window.Utils.validateForm = function(formSelector, rules) {
            const result = originalValidateForm.apply(this, arguments);
            
            // Debug validation logging
            if (window.CMSDebug) {
                window.CMSDebug.logValidation(formSelector, result.valid, result.errors);
            }
            
            return result;
        };
    }
}

// Função para interceptar Utils.serializeForm
function addDebugToFormSerialization() {
    if (window.Utils && typeof window.Utils.serializeForm === 'function') {
        const originalSerializeForm = window.Utils.serializeForm;
        
        window.Utils.serializeForm = function(formSelector) {
            const result = originalSerializeForm.apply(this, arguments);
            
            // Debug form data logging
            if (window.CMSDebug) {
                window.CMSDebug.log('form', `📋 Form serialized: ${formSelector}`, {
                    fieldCount: Object.keys(result || {}).length,
                    data: result
                }, 'debug');
            }
            
            return result;
        };
    }
}

// Função para interceptar jQuery AJAX (se usado)
function addDebugToJQueryAjax() {
    if (window.$ && $.ajaxSetup) {
        // Interceptar todas as requisições AJAX do jQuery
        $(document).ajaxSend(function(event, xhr, settings) {
            if (window.CMSDebug) {
                window.CMSDebug.logApiRequest(settings.type || 'GET', settings.url, settings.data);
            }
        });
        
        $(document).ajaxComplete(function(event, xhr, settings) {
            if (window.CMSDebug) {
                let responseData = null;
                try {
                    responseData = JSON.parse(xhr.responseText);
                } catch (e) {
                    responseData = xhr.responseText;
                }
                
                window.CMSDebug.logApiResponse(
                    settings.type || 'GET', 
                    settings.url, 
                    xhr.status, 
                    responseData,
                    xhr.status >= 400 ? new Error(`HTTP ${xhr.status}`) : null
                );
            }
        });
    }
}

// Função para interceptar erros globais
function addDebugToGlobalErrors() {
    // Interceptar erros de JavaScript
    window.addEventListener('error', (event) => {
        if (window.CMSDebug) {
            window.CMSDebug.logError(event.error || new Error(event.message), {
                filename: event.filename,
                lineno: event.lineno,
                colno: event.colno,
                type: 'javascript_error'
            });
        }
    });
    
    // Interceptar promises rejeitadas
    window.addEventListener('unhandledrejection', (event) => {
        if (window.CMSDebug) {
            window.CMSDebug.logError(new Error(event.reason), {
                type: 'unhandled_promise_rejection',
                reason: event.reason
            });
        }
    });
}

// Função para adicionar debug a mudanças de estado
function addDebugToStateChanges() {
    const modules = ['Pages', 'Forms', 'Widgets', 'Users', 'Media', 'Menus', 'Settings', 'Entities', 'Audit'];
    
    modules.forEach(moduleName => {
        const module = window[moduleName];
        if (!module) return;
        
        // Interceptar mudanças de currentTab
        if (module.hasOwnProperty('currentTab')) {
            let currentTabValue = module.currentTab;
            
            Object.defineProperty(module, 'currentTab', {
                get: function() {
                    return currentTabValue;
                },
                set: function(newValue) {
                    if (window.CMSDebug && currentTabValue !== newValue) {
                        window.CMSDebug.logStateChange(moduleName, 'currentTab', currentTabValue, newValue);
                    }
                    currentTabValue = newValue;
                }
            });
        }
        
        // Interceptar mudanças de currentPage
        if (module.hasOwnProperty('currentPage')) {
            let currentPageValue = module.currentPage;
            
            Object.defineProperty(module, 'currentPage', {
                get: function() {
                    return currentPageValue;
                },
                set: function(newValue) {
                    if (window.CMSDebug && currentPageValue !== newValue) {
                        window.CMSDebug.logStateChange(moduleName, 'currentPage', currentPageValue, newValue);
                    }
                    currentPageValue = newValue;
                }
            });
        }
    });
}

// Função principal para inicializar todo o debug
function initializeDebugIntegration() {
    if (!window.CMSDebug || !window.CMS_CONFIG?.DEBUG?.ENABLED) {
        return;
    }
    
    // Aguardar um pouco para garantir que todos os módulos estejam carregados
    setTimeout(() => {
        addDebugToLoadMethods();
        addDebugToValidation();
        addDebugToFormSerialization();
        addDebugToJQueryAjax();
        addDebugToGlobalErrors();
        addDebugToStateChanges();
        
        if (window.CMSDebug) {
            window.CMSDebug.log('system', '🔧 Debug integration completed for all modules', {
                modules: ['Pages', 'Forms', 'Widgets', 'Users', 'Media', 'Menus', 'Settings', 'Entities', 'Audit', 'Dashboard'],
                features: ['Load methods', 'Save methods', 'Validation', 'Form serialization', 'AJAX', 'Global errors', 'State changes']
            }, 'info');
        }
    }, 1000);
}

// Auto-inicializar quando o DOM estiver pronto
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initializeDebugIntegration);
} else {
    initializeDebugIntegration();
}

// Exportar para uso manual se necessário
window.DebugIntegration = {
    init: initializeDebugIntegration,
    addDebugToLoadMethods,
    addDebugToValidation,
    addDebugToFormSerialization,
    addDebugToJQueryAjax,
    addDebugToGlobalErrors,
    addDebugToStateChanges
};
