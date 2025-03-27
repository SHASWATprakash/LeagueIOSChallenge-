//
//  LoginResponse.swift
//  LeagueiOSChallenge
//
//  Copyright © 2024 League Inc. All rights reserved.
//

import Foundation

enum UserAPIError: Error {
    case invalidURL
    case requestFailed
    case decodingError
}

class UserService {
    
    func fetchUsers(apiKey: String) async throws -> [User] {
        guard let url = APIEndpoint.users() else {
            throw UserAPIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(apiKey, forHTTPHeaderField: "x-access-token")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw UserAPIError.requestFailed
        }
        
        do {
            return try JSONDecoder().decode([User].self, from: data)
        } catch {
            throw UserAPIError.decodingError
        }
    }
}
