#include "http_client.h"
#include <thread>
#include <chrono>

HttpClient::HttpClient()
    : m_requestInProgress(false)
{
}

HttpClient::~HttpClient() {
    if (m_requestThread.joinable()) {
        m_requestThread.join();
    }
}

void HttpClient::GetAsync(const std::string& server, int port, const std::string& path, ResponseCallback callback) {
    if (m_requestInProgress.load()) {
        return; // Já há uma requisição em andamento
    }

    m_callback = callback;
    m_requestInProgress = true;

    // Aguardar thread anterior se ainda estiver rodando
    if (m_requestThread.joinable()) {
        m_requestThread.join();
    }

    // Criar dados para a thread
    RequestData data{server, port, path, this};

    // Criar thread para fazer a requisição
    m_requestThread = std::thread(&HttpClient::RequestThreadProc, this, data);
}

std::string HttpClient::Get(const std::string& server, int port, const std::string& path) {
    return DoHttpRequest(server, port, path);
}

void HttpClient::RequestThreadProc(const RequestData& data) {
    std::string response = DoHttpRequest(data.server, data.port, data.path);
    m_lastResponse = response;

    // Chamar callback se definido
    if (m_callback) {
        m_callback(response, !response.empty());
    }

    m_requestInProgress = false;
}

std::string HttpClient::DoHttpRequest(const std::string& server, int port, const std::string& path) {
    // Suprimir warnings de parâmetros não utilizados
    (void)server;
    (void)port;
    (void)path;

    // Por enquanto, retornar uma resposta simulada
    // TODO: Implementar requisição HTTP real usando biblioteca multiplataforma como libcurl

    std::string response = "{\n"
        "    \"status\": \"success\",\n"
        "    \"message\": \"Conexão simulada com sucesso (multiplataforma)\",\n"
        "    \"data\": {\n"
        "        \"id\": 1,\n"
        "        \"name\": \"Teste\",\n"
        "        \"value\": 42,\n"
        "        \"timestamp\": \"2024-01-01T12:00:00Z\",\n"
        "        \"server\": \"" + server + "\",\n"
        "        \"port\": " + std::to_string(port) + ",\n"
        "        \"path\": \"" + path + "\"\n"
        "    }\n"
        "}";

    // Simulação de delay para parecer uma requisição real
    std::this_thread::sleep_for(std::chrono::milliseconds(500));

    return response;

    /* TODO: Implementação real com biblioteca multiplataforma
     * Sugestões:
     * - libcurl (mais popular)
     * - cpp-httplib (header-only)
     * - Beast (parte do Boost)
     * - cpr (wrapper moderno do libcurl)
     */
}
