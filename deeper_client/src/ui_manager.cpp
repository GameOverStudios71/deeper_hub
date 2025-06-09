#include "ui_manager.h"

UIManager::UIManager() 
    : m_initialized(false)
    , m_requestInProgress(false)
{
}

UIManager::~UIManager() {
    Shutdown();
}

bool UIManager::Initialize(HWND hwnd) {
    // Configurar ImGui
    IMGUI_CHECKVERSION();
    ImGui::CreateContext();
    ImGuiIO& io = ImGui::GetIO(); (void)io;
    
    // Configurar estilo
    ImGui::StyleColorsDark();
    
    // Configurar backends
    if (!ImGui_ImplWin32_Init(hwnd)) {
        return false;
    }
    
    if (!ImGui_ImplOpenGL3_Init("#version 130")) {
        ImGui_ImplWin32_Shutdown();
        return false;
    }
    
    m_initialized = true;
    return true;
}

void UIManager::Shutdown() {
    if (m_initialized) {
        ImGui_ImplOpenGL3_Shutdown();
        ImGui_ImplWin32_Shutdown();
        ImGui::DestroyContext();
        m_initialized = false;
    }
}

void UIManager::NewFrame() {
    if (!m_initialized) return;
    
    ImGui_ImplOpenGL3_NewFrame();
    ImGui_ImplWin32_NewFrame();
    ImGui::NewFrame();
}

void UIManager::Render() {
    if (!m_initialized) return;
    
    RenderMainWindow();
    
    ImGui::Render();
    ImGui_ImplOpenGL3_RenderDrawData(ImGui::GetDrawData());
}

void UIManager::SetConnectionStatus(bool inProgress, const std::string& response) {
    m_requestInProgress = inProgress;
    m_apiResponse = response;
}

void UIManager::RenderMainWindow() {
    // Criar janela em tela cheia sem bordas
    ImGuiWindowFlags window_flags = ImGuiWindowFlags_NoDecoration | 
                                   ImGuiWindowFlags_NoMove | 
                                   ImGuiWindowFlags_NoResize | 
                                   ImGuiWindowFlags_NoSavedSettings;
    
    // Obter tamanho da tela
    const ImGuiViewport* viewport = ImGui::GetMainViewport();
    ImGui::SetNextWindowPos(viewport->WorkPos);
    ImGui::SetNextWindowSize(viewport->WorkSize);
    
    // Criar janela principal
    ImGui::Begin("Main Window", NULL, window_flags);
    
    ImGui::Text("Bem-vindo ao Deeper Client");
    ImGui::Text("Pressione Alt+Enter para alternar entre tela cheia e modo janela");
    ImGui::Separator();
    
    RenderConnectionPanel();
    ImGui::Separator();
    RenderResponsePanel();
    
    ImGui::End();
}

void UIManager::RenderConnectionPanel() {
    // Botão para fazer requisição HTTP
    if (ImGui::Button("Conectar ao Servidor Local", ImVec2(200, 30))) {
        if (!m_requestInProgress && m_connectCallback) {
            m_connectCallback();
        }
    }
    
    ImGui::SameLine();
    
    // Mostrar status da requisição
    if (m_requestInProgress) {
        ImGui::Text("Conectando...");
    }
}

void UIManager::RenderResponsePanel() {
    // Mostrar resposta da API
    ImGui::Text("Resposta do Servidor:");
    
    // Criar uma área de texto com scroll para mostrar a resposta JSON
    ImGui::BeginChild("JSON Response", ImVec2(0, 300), true, ImGuiWindowFlags_HorizontalScrollbar);
    ImGui::TextWrapped("%s", m_apiResponse.c_str());
    ImGui::EndChild();
}
