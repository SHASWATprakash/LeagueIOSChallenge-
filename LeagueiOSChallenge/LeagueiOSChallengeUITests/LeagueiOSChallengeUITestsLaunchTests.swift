//
//  LeagueiOSChallengeUITestsLaunchTests.swift
//  LeagueiOSChallengeUITests
//

import XCTest

class LeagueiOSChallengeUITestsLaunchTests: XCTestCase {
    
    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    // MARK: - Test App Launches Successfully
    func testAppLaunch() throws {
        let app = XCUIApplication()
        app.launch()
        
        let loginButton = app.buttons["Login"]
        XCTAssertTrue(loginButton.exists, "Login button should exist on launch screen")
    }
    
    // MARK: - Test Login Page UI Elements
    func testLoginPageElements() throws {
        let app = XCUIApplication()
        app.launch()
        
        XCTAssertTrue(app.textFields["Enter Username"].exists, "Username field should be present")
        XCTAssertTrue(app.secureTextFields["Enter Password"].exists, "Password field should be present")
        XCTAssertTrue(app.buttons["Login"].exists, "Login button should be present")
        XCTAssertTrue(app.buttons["Continue as Guest"].exists, "Guest button should be present")
    }
    
    // MARK: - Test Navigation to Post List
    func testNavigationToPostList() throws {
        let app = XCUIApplication()
        app.launch()
        
        let loginButton = app.buttons["Login"]
        if loginButton.exists {
            loginButton.tap()
            
            let postListTable = app.tables.firstMatch
            XCTAssertTrue(postListTable.waitForExistence(timeout: 5), "Post List screen should load after login")
        }
    }
}
