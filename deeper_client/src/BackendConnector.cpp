#include "BackendConnector.h"
#include <cpr/cpr.h>
#include <nlohmann/json.hpp>
#include <iostream>

using json = nlohmann::json;

BackendConnector::BackendConnector(const std::string& baseUrl)
    : m_BaseUrl(baseUrl) {
}

bool BackendConnector::Connect() {
    try {
        cpr::Response r = cpr::Get(cpr::Url{m_BaseUrl + "/api/terminal/status"});
        return r.status_code == 200;
    } catch (const std::exception& e) {
        std::cerr << "Erro ao conectar ao backend: " << e.what() << std::endl;
        return false;
    }
}

std::string BackendConnector::CreateSession() {
    try {
        cpr::Response r = cpr::Post(
            cpr::Url{m_BaseUrl + "/api/terminal/sessions"},
            cpr::Header{{"Content-Type", "application/json"}}
        );
        
        if (r.status_code == 201) {
            json response = json::parse(r.text);
            return response["session_id"];
        }
        return "";
    } catch (const std::exception& e) {
        std::cerr << "Erro ao criar sessão: " << e.what() << std::endl;
        return "";
    }
}

std::string BackendConnector::ExecuteCommand(const std::string& sessionId, const std::string& command) {
    try {
        json body = {
            {"command", command}
        };
        
        cpr::Response r = cpr::Post(
            cpr::Url{m_BaseUrl + "/api/terminal/sessions/" + sessionId + "/execute"},
            cpr::Header{{"Content-Type", "application/json"}},
            cpr::Body{body.dump()}
        );
        
        if (r.status_code == 200) {
            json response = json::parse(r.text);
            return response["output"];
        }
        return "Erro: " + std::to_string(r.status_code);
    } catch (const std::exception& e) {
        std::cerr << "Erro ao executar comando: " << e.what() << std::endl;
        return "Erro: " + std::string(e.what());
    }
}

std::vector<std::string> BackendConnector::ListSessions() {
    std::vector<std::string> sessions;
    try {
        cpr::Response r = cpr::Get(cpr::Url{m_BaseUrl + "/api/terminal/sessions"});
        
        if (r.status_code == 200) {
            json response = json::parse(r.text);
            for (const auto& session : response["sessions"]) {
                sessions.push_back(session["id"]);
            }
        }
    } catch (const std::exception& e) {
        std::cerr << "Erro ao listar sessões: " << e.what() << std::endl;
    }
    return sessions;
}