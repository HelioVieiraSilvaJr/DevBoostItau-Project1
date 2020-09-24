//
//  LoginSnapshotTests.swift
//  DevBoostItau-Project1SnapshotTests
//
//  Created by Matheus Pereira da Silva Souza (P) on 23/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import XCTest
import FBSnapshotTestCase
@testable import DevBoostItau_Project1

class LoginSnapshotTests: FBSnapshotTestCase {
    
    var sut: LoginViewController!
    
    var email: String = "matheus@itau.com"
    var senha: String = "Test*123"
    
    override func setUp() {
        super.setUp()
        
//        sut = LoginViewController()
        self.recordMode = false
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
//    func testLogin() {
//        sut.be
//        FBSnapshotVerifyView(sut.view)
//    }
    
    func testView() {
        //Give
        var viewModel: LoginViewModel?
        viewModel?.createUser(email: email, password: senha)
        sut.viewModel = viewModel!
        
        //When
        sut.beginAppearanceTransition(true, animated: false)
        sut.endAppearanceTransition()
        
        //Then
        FBSnapshotVerifyView(sut.view)
    }
}
