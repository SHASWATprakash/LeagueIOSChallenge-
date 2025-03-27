README - League iOS Challenge
Overview
This project is an iOS application built using Swift 6.2 and UIKit. It implements a simple social media interface with authentication, post listing, and user information retrieval using the provided API.

Table of Contents
Project Structure
Features
Tech Stack
Installation
Assumptions
Future Improvements
Architecture & Design
Testing
Project Structure
The project follows the MVC (Model-View-Controller) architecture with a focus on SOLID principles for clean code and maintainability.




LeagueiOSChallenge/
│── Models/              # Data structures (Post, User, LoginResponse)
│── Views/               # UI components (PostCell)
│── ViewControllers/     # Screens (Login, Post List, User Info)
│── Services/            # API communication (APIHelper, PostService, UserService)
│── Utilities/           # Helper functions (Validation, Extensions)
│── Resources/           # Images, assets
│── Tests/               # Unit and UI tests
│── README.md            # Project documentation
Features
✅ Login Page

Username & Password authentication
Continue as guest (random API key generation)
✅ Post List Page

Displays posts with title, body, and user details
Logout option for authenticated users
Exit option for guests
✅ User Information Page

Displays user avatar, name, and email
Validates email domain (.com, .net, .biz)
✅ API Integration

Authentication with API key
Fetching posts and user details
✅ Unit & UI Tests

Tests for authentication, post fetching, and email validation
UI tests for login and navigation
Tech Stack
Language: Swift 6.2
Framework: UIKit
Networking: URLSession (No third-party libraries)
Architecture: MVC with SOLID principles
Testing: XCTest
Installation
Prerequisites
Xcode 15+
iOS 18.3 simulator or physical device
Swift Package Manager (SPM) for dependency management
Steps
open zip file
cd LeagueiOSChallenge
Open in Xcode
bash
Copy
Edit
open LeagueiOSChallenge.xcodeproj
Run the app
Select iPhone 15 Simulator (or physical device).
Press Command + R to build and run.
Assumptions
No third-party libraries are allowed, so all networking is done using URLSession.
If no username or password is provided, a random API key is generated.
Guest users cannot log out, but they can exit the app.
The API may return dummy data, so actual user authentication is not enforced.
Future Improvements
🚀 Enhance UI Design

Improve layout with auto-layout refinements
Add animations for smooth transitions
📌 Better State Management

Use Combine or SwiftData for better data handling
Implement offline caching for posts
🔒 Security & Authentication

Secure API keys using Keychain
Implement OAuth for real authentication
📊 Performance Optimization

Use background threading for API calls
Implement lazy loading for images
Architecture & Design
1. MVC Pattern
Models: Represent data structures
Views: Handle UI elements
Controllers: Manage business logic and user interaction
2. SOLID Principles Applied
✅ Single Responsibility - Each class has a clear purpose
✅ Open-Closed - Code is extendable without modification
✅ Dependency Inversion - Services are injected instead of hardcoded

Testing
Unit Tests
Run tests using:

terminal
xcodebuild test -scheme LeagueiOSChallenge -destination 'platform=iOS Simulator,name=iPhone 15,OS=18.3'
Tests Included:

Login API response validation
Fetching posts and user details
Email validation logic
UI Tests
Run UI tests using:

terminal 
xcodebuild test -scheme LeagueiOSChallengeUITests -destination 'platform=iOS Simulator,name=iPhone 15,OS=18.3'
UI Tests Included:

Ensuring login page elements exist
Navigating from login to post list
Validating post details display
Final Notes
This project is a fully functional iOS app with clean code, structured architecture, and fully tested API integrations. 🚀

If you have any suggestions or feedback, feel free to contribute! 🎉

📌 Maintained by: SHASWAT PRAKASH
📅 Last Updated: March 2025
