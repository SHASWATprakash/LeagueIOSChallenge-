///
//  LoginResponse.swift
//  LeagueiOSChallenge
//
//  Copyright © 2024 League Inc. All rights reserved.
//

import XCTest
@testable import LeagueiOSChallenge

class LeagueiOSChallengeTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Called before each test method runs
    }
    
    override func tearDownWithError() throws {
        // Called after each test method completes
    }
    
    // MARK: - Test API Login Function
    func testLoginAPI() async throws {
        let apiHelper = APIHelper()
        
        do {
            let token = try await apiHelper.fetchUserToken(username: "testuser", password: "password123")
            XCTAssertFalse(token.isEmpty, "API token should not be empty")
        } catch {
            XCTFail("Login API failed with error: \(error)")
        }
    }
    
    // MARK: - Test Fetching Posts
    func testFetchPosts() async throws {
        let postService = PostService()
        let dummyAPIKey = "DUMMY_API_KEY"
        
        do {
            let posts = try await postService.fetchPosts(apiKey: dummyAPIKey)
            XCTAssertFalse(posts.isEmpty, "Posts should not be empty")
        } catch {
            XCTFail("Fetching posts failed: \(error)")
        }
    }
    
    // MARK: - Test Fetching Users
    func testFetchUsers() async throws {
        let userService = UserService()
        let dummyAPIKey = "DUMMY_API_KEY"
        
        do {
            let users = try await userService.fetchUsers(apiKey: dummyAPIKey)
            XCTAssertFalse(users.isEmpty, "Users should not be empty")
        } catch {
            XCTFail("Fetching users failed: \(error)")
        }
    }
    
    // MARK: - Test Email Validation
    func testEmailValidation() {
        let validEmails = ["test@example.com", "user@test.net", "admin@company.biz"]
        let invalidEmails = ["test@example.xyz", "user@test.org", "admin@company.io"]
        
        validEmails.forEach { email in
            XCTAssertTrue(isValidEmail(email), "Valid email failed: \(email)")
        }
        
        invalidEmails.forEach { email in
            XCTAssertFalse(isValidEmail(email), "Invalid email passed: \(email)")
        }
    }
    
    // Helper function for email validation
    private func isValidEmail(_ email: String) -> Bool {
        let regex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.(com|net|biz)$"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: email)
    }
}
