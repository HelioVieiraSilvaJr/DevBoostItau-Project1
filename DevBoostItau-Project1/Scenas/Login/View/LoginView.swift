//
//  LoginView.swift
//  DevBoostItau-Project1
//
//  Created by bruna on 9/23/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

class LoginView: BaseView {
    
    var backImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "loginBack")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var itiImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "itiOrangeLogo")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let welcomeLabel: UILabel = {
       let label = UILabel()
        label.text = "Bem-vindo"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .itiDarkGrey
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityLabel = Localization.labelWelcome
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
        textField.accessibilityLabel = Localization.textFieldEmail
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
        textField.accessibilityLabel = Localization.textFieldPassword
        return textField
    }()
    
    let loginButton: GradientButton = {
       let button = GradientButton()
        button.setTitle("entrar", for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityLabel = Localization.buttonLogin
        return button
    }()
    
    let signUpButton: OutlineButton = {
       let button = OutlineButton()
        button.setTitle("criar cadastro", for: .normal)
//        button.layer.cornerRadius = 25
        button.setTitleColor(.itiGrey, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityLabel = Localization.buttonSignUp
        return button
    }()
    
    let termsButton: UIButton = {
       let button = UIButton()
        button.setTitle("termos e privacidade", for: .normal)
        button.setTitleColor(.itiOrange, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityLabel = "Botão Termos de Uso"
        return button
    }()
    
    
    override func initialize() {
        addSubview(backImageView)
        backImageView.addSubview(itiImageView)
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
        backImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        backImageView.bottomAnchor.constraint(equalTo: whiteView.topAnchor).isActive = true
        backImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        backImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        itiImageView.topAnchor.constraint(equalTo: backImageView.topAnchor, constant: 50).isActive = true
        itiImageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        itiImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        
        whiteView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/2).isActive = true
        whiteView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        whiteView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        whiteView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        welcomeLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 0).isActive = true
        welcomeLabel.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: 30).isActive = true
        welcomeLabel.centerXAnchor.constraint(equalToSystemSpacingAfter: whiteView.centerXAnchor, multiplier: 1).isActive = true
        
        emailTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -10).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 16).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -16).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        passwordTextField.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -30).isActive = true
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
        
        termsButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        termsButton.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor).isActive = true
        termsButton.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor).isActive = true
        termsButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    override func setupExtraConfigurations() {
        self.backgroundColor = .itiOrange
    }
}
