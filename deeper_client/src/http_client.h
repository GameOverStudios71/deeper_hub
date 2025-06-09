#pragma once

#include <string>
#include <functional>
#include <thread>
#include <atomic>

class HttpClient {
public:
    HttpClient();
    ~HttpClient();
    
    // Callback para quando a requisição for completada
    using ResponseCallback = std::function<void(const std::string& response, bool success)>;
    
    // Fazer requisição HTTP GET de forma assíncrona
    void GetAsync(const std::string& server, int port, const std::string& path, ResponseCallback callback);
    
    // Fazer requisição HTTP GET de forma síncrona
    std::string Get(const std::string& server, int port, const std::string& path);

    // Verificar se há uma requisição em andamento
    bool IsRequestInProgress() const { return m_requestInProgress.load(); }

    // Obter a última resposta
    const std::string& GetLastResponse() const { return m_lastResponse; }

private:
    std::atomic<bool> m_requestInProgress;
    std::string m_lastResponse;
    std::thread m_requestThread;
    ResponseCallback m_callback;

    struct RequestData {
        std::string server;
        int port;
        std::string path;
        HttpClient* client;
    };

    // Thread function para requisições assíncronas
    void RequestThreadProc(const RequestData& data);

    // Implementação da requisição HTTP
    std::string DoHttpRequest(const std::string& server, int port, const std::string& path);
};
