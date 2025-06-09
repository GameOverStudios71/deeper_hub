#pragma once

#include "imgui.h"
#include "imgui_impl_win32.h"
#include "imgui_impl_opengl3.h"
#include <windows.h>
#include <string>
#include <functional>

class UIManager {
public:
    UIManager();
    ~UIManager();
    
    bool Initialize(HWND hwnd);
    void Shutdown();
    
    void NewFrame();
    void Render();
    
    // Callbacks para eventos da UI
    using ConnectCallback = std::function<void()>;
    
    void SetConnectCallback(ConnectCallback callback) { m_connectCallback = callback; }
    
    // Atualizar estado da conexão
    void SetConnectionStatus(bool inProgress, const std::string& response);
    
private:
    bool m_initialized;
    ConnectCallback m_connectCallback;
    
    // Estado da UI
    bool m_requestInProgress;
    std::string m_apiResponse;
    
    void RenderMainWindow();
    void RenderConnectionPanel();
    void RenderResponsePanel();
};
