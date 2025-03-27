///
//  LoginResponse.swift
//  LeagueiOSChallenge
//
//  Copyright © 2024 League Inc. All rights reserved.
//

import Foundation

enum PostAPIError: Error {
    case invalidURL
    case requestFailed
    case decodingError
}

class PostService {
    
    func fetchPosts(apiKey: String, userId: Int? = nil) async throws -> [Post] {
        guard let url = APIEndpoint.posts(userId: userId) else {
            throw PostAPIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(apiKey, forHTTPHeaderField: "x-access-token")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw PostAPIError.requestFailed
        }
        
        do {
            return try JSONDecoder().decode([Post].self, from: data)
        } catch {
            throw PostAPIError.decodingError
        }
    }
}
