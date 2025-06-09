#pragma once
#include <GL/gl.h>
#include <string>
#include <iostream>
#include <fstream>
#include <sstream>

// Classes de shader removidas - usando apenas OpenGL 2.1 básico

// Classe simplificada para efeitos visuais (compatível com OpenGL 2.1)
class SimpleEffectsRenderer {
public:
    SimpleEffectsRenderer();
    ~SimpleEffectsRenderer();

    bool Initialize();
    void ApplyBlurEffect();
    void ApplyColorOverlay();
    void ApplyDistortionEffect();
    void Cleanup();

    void SetBlurIntensity(float intensity) { m_BlurIntensity = intensity; }
    float GetBlurIntensity() const { return m_BlurIntensity; }

private:
    bool m_Initialized;
    float m_BlurIntensity;

    void RenderBlurQuad();
    void RenderColorQuad(float r, float g, float b, float a);
};
