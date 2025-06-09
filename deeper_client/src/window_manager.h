#pragma once

#include <windows.h>
#include "imgui.h"
#include "imgui_impl_win32.h"

class WindowManager {
public:
    WindowManager();
    ~WindowManager();
    
    bool Initialize(const wchar_t* title, int width = 800, int height = 600);
    void Shutdown();
    
    void ToggleFullscreen();
    bool ProcessMessages();
    
    HWND GetHWND() const { return m_hwnd; }
    HDC GetHDC() const { return m_hdc; }
    bool IsFullscreen() const { return m_isFullscreen; }
    
    // Manipulador de mensagens estático
    static LRESULT WINAPI WndProc(HWND hWnd, UINT msg, WPARAM wParam, LPARAM lParam);
    
private:
    HWND m_hwnd;
    HDC m_hdc;
    bool m_isFullscreen;
    RECT m_windowRect;
    WNDCLASSEXW m_wc;
    
    void SetFullscreenMode(bool fullscreen);
};

// Instância global para acesso no WndProc
extern WindowManager* g_WindowManager;
