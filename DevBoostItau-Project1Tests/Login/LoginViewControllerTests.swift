//
//  LoginViewControllerTests.swift
//  DevBoostItau-Project1Tests
//
//  Created by Matheus Pereira da Silva Souza (P) on 23/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import XCTest
@testable import DevBoostItau_Project1

class LoginViewControllerTests: XCTestCase {
    
    var sut: HomeViewController!//LoginViewController!
    var email: String = "matheus@itau.com"
    var senha: String = "Test*123"
    
    override func setUpWithError() throws {
        try super.setUpWithError()
//        sut = nil
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func testInvalidEmail() {
        XCTAssertEqual(email, "matheus@itau.com", "Usuario já existente")
    }
    
    func testWeakPassword() {
        XCTAssertEqual(senha, "test*123", "senha fraca")
    }
    
    func testIncorrectPassword() {
        XCTAssertEqual(senha, "test*123", "senha incorreta")
    }
    
    func testUserAlreadyExists() {
        XCTAssertEqual(email, "matheus@itau.com", "Usuario já existente")
        XCTAssertEqual(senha, "Test*123", "")
    }
}
