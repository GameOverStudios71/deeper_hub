#!/usr/bin/env python3
"""
Script para testar a integração entre o cliente CMS e o backend DeeperHub.
Verifica se todos os endpoints estão funcionando corretamente.
"""

import requests
import json
import sys
from typing import Dict, Any, Optional

class CMSIntegrationTester:
    def __init__(self, base_url: str = "http://localhost:4000/api/cms"):
        self.base_url = base_url
        self.token = None
        self.session = requests.Session()
        self.session.headers.update({
            'Content-Type': 'application/json',
            'Accept': 'application/json'
        })

    def log(self, message: str, level: str = "INFO"):
        """Log message with level"""
        colors = {
            "INFO": "\033[94m",
            "SUCCESS": "\033[92m", 
            "ERROR": "\033[91m",
            "WARNING": "\033[93m"
        }
        reset = "\033[0m"
        print(f"{colors.get(level, '')}{level}: {message}{reset}")

    def test_connection(self) -> bool:
        """Test basic connection to backend"""
        try:
            response = self.session.get(f"{self.base_url.replace('/api/cms', '')}/")
            if response.status_code == 200:
                data = response.json()
                if data.get('status') == 'ok':
                    self.log("✅ Backend connection successful", "SUCCESS")
                    return True
            
            self.log(f"❌ Backend connection failed: {response.status_code}", "ERROR")
            return False
        except Exception as e:
            self.log(f"❌ Backend connection error: {e}", "ERROR")
            return False

    def test_login(self, email: str = "admin@example.com", password: str = "password123") -> bool:
        """Test authentication"""
        try:
            data = {"email": email, "password": password}
            response = self.session.post(f"{self.base_url}/auth/login", json=data)
            
            if response.status_code == 200:
                result = response.json()
                if result.get('status') == 'success' and 'data' in result:
                    self.token = result['data'].get('token')
                    if self.token:
                        self.session.headers.update({
                            'Authorization': f'Bearer {self.token}'
                        })
                        self.log("✅ Authentication successful", "SUCCESS")
                        return True
            
            self.log(f"❌ Authentication failed: {response.status_code} - {response.text}", "ERROR")
            return False
        except Exception as e:
            self.log(f"❌ Authentication error: {e}", "ERROR")
            return False

    def test_endpoint(self, method: str, endpoint: str, data: Optional[Dict] = None) -> bool:
        """Test a specific endpoint"""
        try:
            url = f"{self.base_url}{endpoint}"
            
            if method.upper() == 'GET':
                response = self.session.get(url)
            elif method.upper() == 'POST':
                response = self.session.post(url, json=data)
            elif method.upper() == 'PUT':
                response = self.session.put(url, json=data)
            elif method.upper() == 'DELETE':
                response = self.session.delete(url)
            else:
                self.log(f"❌ Unsupported method: {method}", "ERROR")
                return False

            if 200 <= response.status_code < 300:
                result = response.json()
                if result.get('status') == 'success':
                    self.log(f"✅ {method} {endpoint} - Success", "SUCCESS")
                    return True
                else:
                    self.log(f"⚠️ {method} {endpoint} - API Error: {result.get('message', 'Unknown')}", "WARNING")
                    return False
            else:
                self.log(f"❌ {method} {endpoint} - HTTP {response.status_code}", "ERROR")
                return False
                
        except Exception as e:
            self.log(f"❌ {method} {endpoint} - Error: {e}", "ERROR")
            return False

    def test_pages_crud(self) -> bool:
        """Test Pages CRUD operations"""
        self.log("Testing Pages CRUD...", "INFO")
        
        # Test GET pages
        if not self.test_endpoint('GET', '/pages'):
            return False
        
        # Test CREATE page
        page_data = {
            "name": "test_page",
            "uri": "/test-page",
            "title": "Test Page",
            "title_system": "Test Page",
            "description": "A test page created by integration test",
            "author_id": 1
        }
        
        if not self.test_endpoint('POST', '/pages', page_data):
            return False
        
        # For a complete test, we would also test GET by ID, UPDATE, and DELETE
        # But this requires storing the created page ID
        
        return True

    def test_auth_endpoints(self) -> bool:
        """Test authentication endpoints"""
        self.log("Testing Auth endpoints...", "INFO")
        
        # Test current user
        if not self.test_endpoint('GET', '/auth/me'):
            return False
        
        # Test token refresh
        if not self.test_endpoint('POST', '/auth/refresh'):
            return False
        
        return True

    def test_users_endpoints(self) -> bool:
        """Test Users endpoints"""
        self.log("Testing Users endpoints...", "INFO")
        
        # Test GET users
        if not self.test_endpoint('GET', '/users'):
            return False
        
        return True

    def test_forms_endpoints(self) -> bool:
        """Test Forms endpoints"""
        self.log("Testing Forms endpoints...", "INFO")
        
        # Test GET forms
        if not self.test_endpoint('GET', '/forms'):
            return False
        
        return True

    def test_widgets_endpoints(self) -> bool:
        """Test Widgets endpoints"""
        self.log("Testing Widgets endpoints...", "INFO")
        
        # Test GET widgets
        if not self.test_endpoint('GET', '/widgets'):
            return False
        
        return True

    def test_media_endpoints(self) -> bool:
        """Test Media endpoints"""
        self.log("Testing Media endpoints...", "INFO")
        
        # Test GET media files
        if not self.test_endpoint('GET', '/media/files'):
            return False
        
        # Test GET media folders
        if not self.test_endpoint('GET', '/media/folders'):
            return False
        
        return True

    def test_menus_endpoints(self) -> bool:
        """Test Menus endpoints"""
        self.log("Testing Menus endpoints...", "INFO")
        
        # Test GET menu sets
        if not self.test_endpoint('GET', '/menus/sets'):
            return False
        
        return True

    def test_settings_endpoints(self) -> bool:
        """Test Settings endpoints"""
        self.log("Testing Settings endpoints...", "INFO")
        
        # Test GET settings
        if not self.test_endpoint('GET', '/settings'):
            return False
        
        # Test GET themes
        if not self.test_endpoint('GET', '/themes'):
            return False
        
        return True

    def test_audit_endpoints(self) -> bool:
        """Test Audit endpoints"""
        self.log("Testing Audit endpoints...", "INFO")
        
        # Test GET audit logs
        if not self.test_endpoint('GET', '/audit/logs'):
            return False
        
        return True

    def run_all_tests(self) -> bool:
        """Run all integration tests"""
        self.log("🚀 Starting CMS Integration Tests", "INFO")
        self.log("=" * 50, "INFO")
        
        tests = [
            ("Backend Connection", self.test_connection),
            ("Authentication", self.test_login),
            ("Auth Endpoints", self.test_auth_endpoints),
            ("Pages Endpoints", self.test_pages_crud),
            ("Users Endpoints", self.test_users_endpoints),
            ("Forms Endpoints", self.test_forms_endpoints),
            ("Widgets Endpoints", self.test_widgets_endpoints),
            ("Media Endpoints", self.test_media_endpoints),
            ("Menus Endpoints", self.test_menus_endpoints),
            ("Settings Endpoints", self.test_settings_endpoints),
            ("Audit Endpoints", self.test_audit_endpoints),
        ]
        
        passed = 0
        total = len(tests)
        
        for test_name, test_func in tests:
            self.log(f"\n📋 Testing {test_name}...", "INFO")
            if test_func():
                passed += 1
            else:
                self.log(f"❌ {test_name} failed", "ERROR")
        
        self.log("\n" + "=" * 50, "INFO")
        self.log(f"🎯 Test Results: {passed}/{total} passed", "INFO")
        
        if passed == total:
            self.log("🎉 All tests passed! Integration is working correctly.", "SUCCESS")
            return True
        else:
            self.log(f"⚠️ {total - passed} tests failed. Check the backend configuration.", "WARNING")
            return False

def main():
    """Main function"""
    import argparse
    
    parser = argparse.ArgumentParser(description='Test CMS Backend Integration')
    parser.add_argument('--url', default='http://localhost:4000/api/cms', 
                       help='Backend API URL (default: http://localhost:4000/api/cms)')
    parser.add_argument('--email', default='admin@example.com',
                       help='Login email (default: admin@example.com)')
    parser.add_argument('--password', default='password123',
                       help='Login password (default: password123)')
    
    args = parser.parse_args()
    
    tester = CMSIntegrationTester(args.url)
    
    # Override login credentials if provided
    if args.email != 'admin@example.com' or args.password != 'password123':
        tester.test_login = lambda: tester.test_login(args.email, args.password)
    
    success = tester.run_all_tests()
    
    if success:
        print("\n✅ Integration test completed successfully!")
        print("🚀 You can now use the CMS client with the real backend.")
        sys.exit(0)
    else:
        print("\n❌ Integration test failed!")
        print("🔧 Please check the backend configuration and try again.")
        sys.exit(1)

if __name__ == "__main__":
    main()
