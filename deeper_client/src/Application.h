#pragma once
#include <GLFW/glfw3.h>
#include "imgui.h"
#include "BackendConnector.h"
#include <string>
#include <vector>

class Application {
public:
    Application();
    ~Application();
    
    void Run();
    
private:
    GLFWwindow* m_Window;
    ImGuiContext* m_ImGuiContext;
    BackendConnector m_Backend;
    std::string m_CurrentSessionId;
    std::vector<std::string> m_CommandHistory;
    std::string m_Output;
    
    void InitGLFW();
    void InitImGui();
    void InitBackend();
    void Shutdown();
    void RenderUI();
};