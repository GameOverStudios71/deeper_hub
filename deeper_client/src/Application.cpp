#include "Application.h"
#include <iostream>
#include <cstring>
#include "imgui.h"
#include "imgui_impl_glfw.h"
#include "imgui_impl_opengl3.h"
#include <GL/gl.h>

Application::Application()
    : m_Window(nullptr), m_ImGuiContext(nullptr), m_Backend("http://localhost:4000") {
    InitGLFW();
    InitImGui();
    InitBackend();
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
    while (!glfwWindowShouldClose(m_Window)) {
        glfwPollEvents();

        // Start the Dear ImGui frame
        ImGui_ImplOpenGL3_NewFrame();
        ImGui_ImplGlfw_NewFrame();
        ImGui::NewFrame();

        // Render our UI
        RenderUI();

        // Rendering
        ImGui::Render();
        int display_w, display_h;
        glfwGetFramebufferSize(m_Window, &display_w, &display_h);
        glViewport(0, 0, display_w, display_h);
        glClearColor(0.45f, 0.55f, 0.60f, 1.00f);
        glClear(GL_COLOR_BUFFER_BIT);
        ImGui_ImplOpenGL3_RenderDrawData(ImGui::GetDrawData());

        glfwSwapBuffers(m_Window);
    }
}

void Application::InitGLFW() {
    if (!glfwInit()) {
        std::cerr << "Falha ao inicializar GLFW" << std::endl;
        return;
    }

    // GL 3.0 + GLSL 130
    const char* glsl_version = "#version 130";
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 0);

    // Create window with graphics context
    m_Window = glfwCreateWindow(1280, 720, "DeeperHub Client", nullptr, nullptr);
    if (m_Window == nullptr) {
        std::cerr << "Falha ao criar janela GLFW" << std::endl;
        return;
    }
    glfwMakeContextCurrent(m_Window);
    glfwSwapInterval(1); // Enable vsync
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
    ImGui_ImplOpenGL3_Init("#version 130");
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