//
//  LoginResponse.swift
//  LeagueiOSChallenge
//
//  Copyright © 2024 League Inc. All rights reserved.
//

import Foundation

// MARK: - Post Model
struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

// MARK: - User Model
struct User: Codable {
    let id: Int
    let avatar: String
    let name: String
    let username: String
    let email: String
    
    enum CodingKeys: String, CodingKey {
        case id, avatar, name, username, email
    }
}
