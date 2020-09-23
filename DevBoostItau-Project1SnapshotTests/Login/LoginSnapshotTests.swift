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
    
//    var sut: HomeViewController!//LoginViewController!
    
    override func setUp() {
        super.setUp()
        
        recordMode = false
        //usesDrawViewHierarchyInRect = true
        fileNameOptions = [.device, .screenSize, .OS]
        
//        sut = HomeViewController()
    }

    override func tearDown() {
//        sut = nil
        super.tearDown()
    }
}
