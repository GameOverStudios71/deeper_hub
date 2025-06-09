#include "Application.h"
#include <iostream>
#include <cstring>
#include "imgui.h"
#include "imgui_impl_glfw.h"
#include "imgui_impl_opengl3.h"
#include <GL/gl.h>

Application::Application()
    : m_Window(nullptr), m_ImGuiContext(nullptr), m_Backend("http://localhost:4000"),
      m_BlurEnabled(false), m_ColorOverlayEnabled(false), m_DistortionEnabled(false) {
    InitGLFW();
    if (m_Window != nullptr) {
        InitImGui();
        InitBackend();

        // Inicializar sistema de efeitos simples
        if (!m_EffectsRenderer.Initialize()) {
            std::cerr << "Aviso: Sistema de efeitos visuais não pôde ser inicializado" << std::endl;
        }
    }
}

// Adicionar método
void Application::InitBackend() {
    if (m_Backend.Connect()) {
        std::cout << "Conectado ao backend com sucesso!" << std::endl;
        m_CurrentSessionId = m_Backend.CreateSession();
        if (!m_CurrentSessionId.empty()) {
            std::cout << "Sessão criada: " << m_CurrentSessionId << std::endl;
            m_Output = "Conectado ao servidor. Sessão iniciada.\n";
        } else {
            m_Output = "Erro ao criar sessão.\n";
        }
    } else {
        m_Output = "Erro ao conectar ao servidor.\n";
    }
}

// Atualizar RenderUI
void Application::RenderUI() {
    // Janela principal
    ImGui::Begin("DeeperHub Terminal");

    // Controles de efeitos visuais
    ImGui::Text("=== Efeitos Visuais ===");
    ImGui::Checkbox("Ativar Blur Gaussiano", &m_BlurEnabled);
    ImGui::Checkbox("Ativar Overlay de Cor", &m_ColorOverlayEnabled);
    ImGui::Checkbox("Ativar Distorção", &m_DistortionEnabled);

    // Controle de intensidade do blur
    if (m_BlurEnabled) {
        float intensity = m_EffectsRenderer.GetBlurIntensity();
        if (ImGui::SliderFloat("Intensidade do Blur", &intensity, 0.1f, 3.0f)) {
            m_EffectsRenderer.SetBlurIntensity(intensity);
        }
    }

    ImGui::Separator();
    
    // Área de saída
    ImGui::BeginChild("Saída", ImVec2(0, -ImGui::GetFrameHeightWithSpacing()), true);
    ImGui::TextWrapped("%s", m_Output.c_str());
    ImGui::SetScrollHereY(1.0f);
    ImGui::EndChild();
    
    // Campo de entrada
    static char command[256] = "";
    if (ImGui::InputText("Comando", command, IM_ARRAYSIZE(command), 
                         ImGuiInputTextFlags_EnterReturnsTrue)) {
        if (strlen(command) > 0) {
            // Adicionar à história
            m_CommandHistory.push_back(command);
            
            // Executar comando
            if (!m_CurrentSessionId.empty()) {
                std::string result = m_Backend.ExecuteCommand(m_CurrentSessionId, command);
                m_Output += "> " + std::string(command) + "\n" + result + "\n";
            } else {
                m_Output += "> " + std::string(command) + "\n[Não conectado ao servidor]\n";
            }
            
            command[0] = '\0'; // Limpar campo
        }
    }
    
    // Foco no campo de entrada
    ImGui::SetItemDefaultFocus();
    ImGui::SetKeyboardFocusHere(-1);
    
    ImGui::End();
}

Application::~Application() {
    Shutdown();
}

void Application::Run() {
    if (m_Window == nullptr) {
        std::cerr << "Não é possível executar: janela não foi criada." << std::endl;
        return;
    }

    while (!glfwWindowShouldClose(m_Window)) {
        glfwPollEvents();

        int display_w, display_h;
        glfwGetFramebufferSize(m_Window, &display_w, &display_h);

        // Start the Dear ImGui frame
        ImGui_ImplOpenGL3_NewFrame();
        ImGui_ImplGlfw_NewFrame();
        ImGui::NewFrame();

        // Render our UI
        RenderUI();

        // Rendering
        ImGui::Render();
        glViewport(0, 0, display_w, display_h);
        glClearColor(0.45f, 0.55f, 0.60f, 1.0f);
        glClear(GL_COLOR_BUFFER_BIT);

        // Aplicar efeitos visuais se habilitados
        if (m_BlurEnabled) {
            m_EffectsRenderer.ApplyBlurEffect();
        }

        if (m_ColorOverlayEnabled) {
            m_EffectsRenderer.ApplyColorOverlay();
        }

        if (m_DistortionEnabled) {
            m_EffectsRenderer.ApplyDistortionEffect();
        }

        ImGui_ImplOpenGL3_RenderDrawData(ImGui::GetDrawData());

        glfwSwapBuffers(m_Window);
    }
}

void Application::InitGLFW() {
    // Set error callback before initialization
    glfwSetErrorCallback([](int error, const char* description) {
        std::cerr << "Erro GLFW " << error << ": " << description << std::endl;
    });

    if (!glfwInit()) {
        std::cerr << "Falha ao inicializar GLFW" << std::endl;
        return;
    }

    // Use OpenGL 2.1 for better compatibility
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 2);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 1);

    // Make window resizable and visible
    glfwWindowHint(GLFW_RESIZABLE, GLFW_TRUE);
    glfwWindowHint(GLFW_VISIBLE, GLFW_TRUE);

    // Create window with graphics context
    m_Window = glfwCreateWindow(1280, 720, "DeeperHub Client", nullptr, nullptr);
    if (m_Window == nullptr) {
        std::cerr << "Falha ao criar janela GLFW. Verifique se o OpenGL está disponível." << std::endl;
        glfwTerminate();
        return;
    }
    glfwMakeContextCurrent(m_Window);
    glfwSwapInterval(1); // Enable vsync

    std::cout << "Janela GLFW criada com sucesso!" << std::endl;
    std::cout << "OpenGL Version: " << glGetString(GL_VERSION) << std::endl;
}

void Application::InitImGui() {
    // Setup Dear ImGui context
    IMGUI_CHECKVERSION();
    ImGui::CreateContext();
    ImGuiIO& io = ImGui::GetIO(); (void)io;
    io.ConfigFlags |= ImGuiConfigFlags_NavEnableKeyboard;

    // Setup Dear ImGui style
    ImGui::StyleColorsDark();

    // Setup Platform/Renderer backends
    ImGui_ImplGlfw_InitForOpenGL(m_Window, true);
    ImGui_ImplOpenGL3_Init("#version 110");
}

void Application::Shutdown() {
    // Cleanup
    ImGui_ImplOpenGL3_Shutdown();
    ImGui_ImplGlfw_Shutdown();
    ImGui::DestroyContext();

    if (m_Window) {
        glfwDestroyWindow(m_Window);
    }
    glfwTerminate();
}