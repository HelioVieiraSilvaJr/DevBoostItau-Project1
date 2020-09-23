//
//  LoginView.swift
//  DevBoostItau-Project1
//
//  Created by bruna on 9/23/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

class LoginView: BaseView {
    
    private let whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let welcomeLabel: UILabel = {
       let label = UILabel()
        label.text = "Bem vindo"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .itiGrey
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.backgroundColor = UIColor.groupTableViewBackground
        textField.placeholder = "E-mail"
        textField.layer.cornerRadius = 25
        textField.clipsToBounds = true
        textField.keyboardType = .default
        textField.autocapitalizationType = .words
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.backgroundColor = UIColor.groupTableViewBackground
        textField.placeholder = "senha"
        textField.layer.cornerRadius = 25
        textField.clipsToBounds = true
        textField.keyboardType = .default
        textField.autocapitalizationType = .words
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let loginButton: GradientButton = {
       let button = GradientButton()
        button.setTitle("entrar", for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let signUpButton: GradientButton = {
       let button = GradientButton()
        button.setTitle("criar cadastro", for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let termsButton: UIButton = {
       let button = UIButton()
        button.setTitle("termos e privacidade", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func initialize() {
        addSubview(whiteView)
        whiteView.addSubview(welcomeLabel)
        whiteView.addSubview(emailTextField)
        whiteView.addSubview(passwordTextField)
        whiteView.addSubview(loginButton)
        whiteView.addSubview(signUpButton)
        whiteView.addSubview(termsButton)
    }
    
    override func installConstraints() {
//        whiteView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -Margin.verticalSmall).isActive = true
        whiteView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/2).isActive = true
        whiteView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        whiteView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        whiteView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        welcomeLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 10).isActive = true
        welcomeLabel.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: 30).isActive = true
        welcomeLabel.centerXAnchor.constraint(equalToSystemSpacingAfter: whiteView.centerXAnchor, multiplier: 1).isActive = true
        
        emailTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -10).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 16).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -16).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        passwordTextField.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -10).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 16).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -16).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        loginButton.bottomAnchor.constraint(equalTo: signUpButton.topAnchor, constant: -10).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 16).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -16).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        signUpButton.bottomAnchor.constraint(equalTo: termsButton.topAnchor, constant: -10).isActive = true
        signUpButton.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 16).isActive = true
        signUpButton.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -16).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        termsButton.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -10).isActive = true
        termsButton.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor).isActive = true
        termsButton.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor).isActive = true
        termsButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
