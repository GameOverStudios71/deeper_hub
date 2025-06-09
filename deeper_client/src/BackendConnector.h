#pragma once
#include <string>
#include <vector>

class BackendConnector {
public:
    BackendConnector(const std::string& baseUrl = "http://localhost:4000");
    
    bool Connect();
    std::string CreateSession();
    std::string ExecuteCommand(const std::string& sessionId, const std::string& command);
    std::vector<std::string> ListSessions();
    
private:
    std::string m_BaseUrl;
};