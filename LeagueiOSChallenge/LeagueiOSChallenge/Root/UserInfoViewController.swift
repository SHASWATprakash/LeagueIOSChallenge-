//
//  LoginResponse.swift
//  LeagueiOSChallenge
//
//  Copyright © 2024 League Inc. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    var user: User?
    
    private let avatarImageView = UIImageView()
    private let usernameLabel = UILabel()
    private let emailLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        configureView()
    }
    
    private func setupLayout() {
        let stackView = UIStackView(arrangedSubviews: [avatarImageView, usernameLabel, emailLabel])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    private func configureView() {
        guard let user = user else { return }
        avatarImageView.image = UIImage(systemName: "person.circle")
        usernameLabel.text = user.username
        emailLabel.text = user.email
        validateEmail(user.email)
    }
    
    private func validateEmail(_ email: String) {
        let validDomains = ["com", "net", "biz"]
        let domain = email.split(separator: ".").last ?? ""
        if !validDomains.contains(String(domain)) {
            let warningIcon = UIImageView(image: UIImage(systemName: "exclamationmark.triangle.fill"))
            warningIcon.tintColor = .red
            warningIcon.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(warningIcon)
            
            NSLayoutConstraint.activate([
                warningIcon.leadingAnchor.constraint(equalTo: emailLabel.trailingAnchor, constant: 5),
                warningIcon.centerYAnchor.constraint(equalTo: emailLabel.centerYAnchor)
            ])
        }
    }
}
