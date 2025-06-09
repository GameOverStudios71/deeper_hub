#include "opengl_context.h"

OpenGLContext::OpenGLContext() 
    : m_hglrc(nullptr)
    , m_hdc(nullptr)
    , m_clearColor(0.15f, 0.15f, 0.15f, 1.00f)
{
}

OpenGLContext::~OpenGLContext() {
    Shutdown();
}

bool OpenGLContext::Initialize(HDC hdc) {
    m_hdc = hdc;
    
    // Configurar formato de pixel
    PIXELFORMATDESCRIPTOR pfd = {
        sizeof(PIXELFORMATDESCRIPTOR),
        1,
        PFD_DRAW_TO_WINDOW | PFD_SUPPORT_OPENGL | PFD_DOUBLEBUFFER,
        PFD_TYPE_RGBA,
        32,
        0, 0, 0, 0, 0, 0,
        0,
        0,
        0,
        0, 0, 0, 0,
        24,
        8,
        0,
        PFD_MAIN_PLANE,
        0,
        0, 0, 0
    };
    
    int pixelFormat = ::ChoosePixelFormat(hdc, &pfd);
    if (pixelFormat == 0) {
        return false;
    }
    
    if (!::SetPixelFormat(hdc, pixelFormat, &pfd)) {
        return false;
    }
    
    // Criar contexto OpenGL
    m_hglrc = ::wglCreateContext(hdc);
    if (!m_hglrc) {
        return false;
    }
    
    // Tornar contexto atual
    if (!::wglMakeCurrent(hdc, m_hglrc)) {
        ::wglDeleteContext(m_hglrc);
        m_hglrc = nullptr;
        return false;
    }
    
    return true;
}

void OpenGLContext::Shutdown() {
    if (m_hglrc) {
        ::wglMakeCurrent(NULL, NULL);
        ::wglDeleteContext(m_hglrc);
        m_hglrc = nullptr;
    }
    m_hdc = nullptr;
}

void OpenGLContext::MakeCurrent() {
    if (m_hglrc && m_hdc) {
        ::wglMakeCurrent(m_hdc, m_hglrc);
    }
}

void OpenGLContext::SwapBuffers() {
    if (m_hdc) {
        ::SwapBuffers(m_hdc);
    }
}

void OpenGLContext::SetClearColor(float r, float g, float b, float a) {
    m_clearColor = ImVec4(r, g, b, a);
}

void OpenGLContext::Clear() {
    glClearColor(m_clearColor.x, m_clearColor.y, m_clearColor.z, m_clearColor.w);
    glClear(GL_COLOR_BUFFER_BIT);
}

void OpenGLContext::SetViewport(int width, int height) {
    glViewport(0, 0, width, height);
}
