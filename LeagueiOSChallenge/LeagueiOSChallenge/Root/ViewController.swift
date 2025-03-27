///
//  LoginResponse.swift
//  LeagueiOSChallenge
//
//  Copyright © 2024 League Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // UI Elements
    private let usernameField: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter Username"
        field.borderStyle = .roundedRect
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter Password"
        field.borderStyle = .roundedRect
        field.isSecureTextEntry = true
        return field
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = UIColor.systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        return button
    }()
    
    private let guestButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue as Guest", for: .normal)
        button.backgroundColor = UIColor.systemGray
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(continueAsGuestTapped), for: .touchUpInside)
        return button
    }()
    
    private var apiKey: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set background color
        view.backgroundColor = UIColor.systemTeal
        
        setupLayout()
    }
    
    // MARK: - UI Layout
    private func setupLayout() {
        let stackView = UIStackView(arrangedSubviews: [usernameField, passwordField, loginButton, guestButton])
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            loginButton.heightAnchor.constraint(equalToConstant: 44),
            guestButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    // MARK: - Login Handling
    @objc private func loginTapped() {
        guard let username = usernameField.text, let password = passwordField.text, !username.isEmpty, !password.isEmpty else {
            showAlert(message: "Please enter valid credentials")
            return
        }
        
        Task {
            do {
                apiKey = try await APIHelper().fetchUserToken(username: username, password: password)
                navigateToPostList()
            } catch {
                showAlert(message: "Login failed. Please check your credentials.")
            }
        }
    }
    
    // MARK: - Continue as Guest
    @objc private func continueAsGuestTapped() {
        Task {
            do {
                apiKey = try await APIHelper().fetchUserToken(username: nil, password: nil) // Random token
                navigateToPostList()
            } catch {
                showAlert(message: "Failed to continue as guest")
            }
        }
    }
    
    // MARK: - Navigation to Post List
    private func navigateToPostList() {
        DispatchQueue.main.async {
            let postListVC = PostListViewController(apiKey: self.apiKey)
            self.navigationController?.pushViewController(postListVC, animated: true)
        }
    }
    
    // MARK: - Show Alert
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
