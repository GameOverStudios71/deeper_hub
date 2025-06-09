#pragma once

#include <windows.h>
#include <GL/gl.h>
#include "imgui.h"

class OpenGLContext {
public:
    OpenGLContext();
    ~OpenGLContext();
    
    bool Initialize(HDC hdc);
    void Shutdown();
    
    void MakeCurrent();
    void SwapBuffers();
    
    void SetClearColor(float r, float g, float b, float a);
    void Clear();
    void SetViewport(int width, int height);
    
    bool IsInitialized() const { return m_hglrc != nullptr; }
    
private:
    HGLRC m_hglrc;
    HDC m_hdc;
    ImVec4 m_clearColor;
};
