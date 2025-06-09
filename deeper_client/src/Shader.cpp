#include "Shader.h"

// Implementação simplificada - sem shaders, apenas OpenGL 2.1 básico

// Implementação da classe SimpleEffectsRenderer
SimpleEffectsRenderer::SimpleEffectsRenderer() : m_Initialized(false), m_BlurIntensity(1.0f) {}

SimpleEffectsRenderer::~SimpleEffectsRenderer() {
    Cleanup();
}

bool SimpleEffectsRenderer::Initialize() {
    m_Initialized = true;
    std::cout << "Sistema de efeitos simples inicializado" << std::endl;
    return true;
}

void SimpleEffectsRenderer::ApplyBlurEffect() {
    if (!m_Initialized) return;

    // Efeito de blur mais visível usando OpenGL 2.1
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

    // Salvar estado atual
    glPushAttrib(GL_ALL_ATTRIB_BITS);

    // Aplicar um overlay escuro semi-transparente para simular blur
    glColor4f(0.0f, 0.0f, 0.0f, 0.3f);
    glBegin(GL_QUADS);
    glVertex2f(-1.0f, -1.0f);
    glVertex2f(1.0f, -1.0f);
    glVertex2f(1.0f, 1.0f);
    glVertex2f(-1.0f, 1.0f);
    glEnd();

    // Aplicar múltiplas camadas com diferentes offsets para simular blur
    for (int i = 0; i < 8; i++) {
        glPushMatrix();

        // Offsets maiores para efeito mais visível
        float offsetX = (float)(i - 4) * 0.002f;
        float offsetY = (float)(i - 4) * 0.001f;
        glTranslatef(offsetX, offsetY, 0.0f);

        // Cor branca semi-transparente
        glColor4f(1.0f, 1.0f, 1.0f, 0.1f);

        RenderBlurQuad();

        glPopMatrix();
    }

    // Restaurar estado
    glPopAttrib();
    glDisable(GL_BLEND);
}

void SimpleEffectsRenderer::Cleanup() {
    m_Initialized = false;
}

void SimpleEffectsRenderer::ApplyColorOverlay() {
    if (!m_Initialized) return;

    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

    // Overlay azul para efeito "cyberpunk"
    RenderColorQuad(0.0f, 0.3f, 0.8f, 0.2f);

    glDisable(GL_BLEND);
}

void SimpleEffectsRenderer::ApplyDistortionEffect() {
    if (!m_Initialized) return;

    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

    // Efeito de distorção usando múltiplos quads com diferentes cores
    for (int i = 0; i < 5; i++) {
        glPushMatrix();

        float angle = i * 72.0f; // 360/5 = 72 graus
        glRotatef(angle, 0.0f, 0.0f, 1.0f);
        glScalef(0.1f, 0.1f, 1.0f);

        float r = (i % 3 == 0) ? 1.0f : 0.0f;
        float g = (i % 3 == 1) ? 1.0f : 0.0f;
        float b = (i % 3 == 2) ? 1.0f : 0.0f;

        RenderColorQuad(r, g, b, 0.1f);

        glPopMatrix();
    }

    glDisable(GL_BLEND);
}

void SimpleEffectsRenderer::RenderBlurQuad() {
    // Renderizar um quad transparente para simular blur
    glBegin(GL_QUADS);
    glVertex2f(-1.0f, -1.0f);
    glVertex2f(1.0f, -1.0f);
    glVertex2f(1.0f, 1.0f);
    glVertex2f(-1.0f, 1.0f);
    glEnd();
}

void SimpleEffectsRenderer::RenderColorQuad(float r, float g, float b, float a) {
    glColor4f(r, g, b, a);
    glBegin(GL_QUADS);
    glVertex2f(-1.0f, -1.0f);
    glVertex2f(1.0f, -1.0f);
    glVertex2f(1.0f, 1.0f);
    glVertex2f(-1.0f, 1.0f);
    glEnd();
}


