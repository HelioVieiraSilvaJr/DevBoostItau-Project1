//
//  LoginView.swift
//  DevBoostItau-Project1
//
//  Created by bruna on 9/23/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func didTapLoginButton()
    func didTapSignupButton()
    func didTapTermsButton()
}

class LoginView: BaseView {
    
    // MARK: Properties
    weak var delegate: LoginViewDelegate?
    var keyboardIsShowing: Bool = false
    var edgeInsetsToRestore: UIEdgeInsets?
    
    convenience init(delegate: LoginViewDelegate){
        self.init()
        self.delegate = delegate
    }
    
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
        textField.placeholder = "Senha"
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
    
    let signUpButton: OutlineButton = {
       let button = OutlineButton()
        button.setTitle("criar cadastro", for: .normal)
//        button.layer.cornerRadius = 25
        button.setTitleColor(.itiGrey, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let termsButton: UIButton = {
       let button = UIButton()
        button.setTitle("termos e privacidade", for: .normal)
        button.setTitleColor(.itiOrange, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    required init() {
        super.init()
        subscribeKeyboardNotifications()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func subscribeKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func initialize() {
        addSubview(scrollView)
        scrollView.addSubview(backImageView)
        scrollView.addSubview(whiteView)
        backImageView.addSubview(itiImageView)
        whiteView.addSubview(welcomeLabel)
        whiteView.addSubview(emailTextField)
        whiteView.addSubview(passwordTextField)
        whiteView.addSubview(loginButton)
        whiteView.addSubview(signUpButton)
        whiteView.addSubview(termsButton)
    }
    
    override func installConstraints() {
        scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
//        whiteView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -Margin.verticalSmall).isActive = true
        backImageView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        backImageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        backImageView.bottomAnchor.constraint(equalTo: whiteView.topAnchor).isActive = true
        backImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        backImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        
        itiImageView.topAnchor.constraint(equalTo: backImageView.topAnchor, constant: 50).isActive = true
        itiImageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        itiImageView.leadingAnchor.constraint(equalTo: backImageView.leadingAnchor, constant: 20).isActive = true
        
        whiteView.heightAnchor.constraint(equalToConstant: 380).isActive = true
        whiteView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        whiteView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        whiteView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        
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
        
        termsButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        termsButton.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor).isActive = true
        termsButton.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor).isActive = true
        termsButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    override func setupExtraConfigurations() {
        self.backgroundColor = .itiOrange
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
        termsButton.addTarget(self, action: #selector(termsTapped), for: .touchUpInside)
    }
    
    @objc func loginTapped(){
        delegate?.didTapLoginButton()
    }
    
    @objc func signUpTapped(){
        delegate?.didTapSignupButton()
    }
    
    @objc func termsTapped(){
        delegate?.didTapTermsButton()
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if !keyboardIsShowing {
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                
                var coveredFrame: CGRect = .zero
                let scrollViewFrame = scrollView.window?.convert(scrollView.frame, from: scrollView.superview)
                coveredFrame = scrollViewFrame!.intersection(keyboardSize)
                
                edgeInsetsToRestore = scrollView.contentInset
                guard let edgeInsetsToRestore = edgeInsetsToRestore else { return }
                
                let contentInsets = UIEdgeInsets.init(top: edgeInsetsToRestore.top,
                                                     left: edgeInsetsToRestore.left,
                                                     bottom: edgeInsetsToRestore.bottom + coveredFrame.size.height,
                                                     right: edgeInsetsToRestore.right)
                scrollView.contentInset = contentInsets
                scrollView.scrollIndicatorInsets = contentInsets
            }
            keyboardIsShowing = true
        }
    }
        
    @objc func keyboardWillHide(notification: NSNotification) {
        if keyboardIsShowing {
            guard let edgeInsetsToRestore = edgeInsetsToRestore else { return }
            scrollView.contentInset = edgeInsetsToRestore
            scrollView.scrollIndicatorInsets = edgeInsetsToRestore
        }
        keyboardIsShowing = false
    }
}
