//
//  APIHelper.swift
//  LeagueiOSChallenge
//
//  Copyright © 2024 League Inc. All rights reserved.
//


import Foundation

// MARK: - API Error Handling
enum APIError: Error {
    case invalidURL
    case requestFailed
    case decodingFailed
}

// MARK: - API Endpoints
enum APIEndpoint {
    static let baseURL = "https://engineering.league.dev/challenge/api"
    
    static func login() -> URL? {
        return URL(string: "\(baseURL)/login")
    }
    
    static func users() -> URL? {
        return URL(string: "\(baseURL)/users")
    }
    
    static func posts(userId: Int? = nil) -> URL? {
        var urlString = "\(baseURL)/posts"
        if let userId = userId {
            urlString.append("?userId=\(userId)")
        }
        return URL(string: urlString)
    }
}

// MARK: - API Helper Class
class APIHelper {
    
    // MARK: - Login API Request
    func fetchUserToken(username: String?, password: String?) async throws -> String {
        guard let url = APIEndpoint.login() else {
            throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        if let username = username, let password = password {
            let authString = "\(username):\(password)"
            let authData = Data(authString.utf8)
            let base64AuthString = "Basic \(authData.base64EncodedString())"
            request.setValue(base64AuthString, forHTTPHeaderField: "Authorization")
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw APIError.requestFailed
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            let result = try decoder.decode(LoginResponse.self, from: data)
            return result.apiKey
        } catch {
            throw APIError.decodingFailed
        }
    }
}
