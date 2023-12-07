//  /*
//
//  Project: Unit_Testing_Tests
//  File: UnitTestingViewModel_Tests.swift
//  Created by: Elaidzha Shchukin
//  Date: 07.12.2023
//
//  */

import XCTest
@testable import Unit_Testing

// Naming Srtucture: test_UnitOfWork_StateUnderTest_Expected
// Naming Srtucture: test_[struct or class]_[variable or function]_[expected result]
// Testing Srtucture: Given, When, Then

final class UnitTestingViewModel_Tests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_UnitTestingViewModel_isPremium_shouldBeTrue() {
        // Given
        let userIsPremium: Bool = true
        
        // When
        let vm = UnitTestingViewModel(isPremium: userIsPremium)
        
        // Then
        XCTAssertTrue(vm.isPremium)
    }
    
    func test_UnitTestingViewModel_isPremium_shouldBeFalse() {
        // Given
        let userIsPremium: Bool = false
        
        // When
        let vm = UnitTestingViewModel(isPremium: userIsPremium)
        
        // Then
        XCTAssertFalse(vm.isPremium)
    }

}
