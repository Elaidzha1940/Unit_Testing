//  /*
//
//  Project: Unit_Testing_Tests
//  File: NewMockDataService_Tests.swift
//  Created by: Elaidzha Shchukin
//  Date: 08.12.2023
//
//  */

import XCTest
import Combine
@testable import Unit_Testing

final class NewMockDataService_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_NewMockDataService_init_doesSetValuesCorrectly() {
        // Given
        let items: [String]? = nil
        let items2: [String]? = []
        let items3: [String]? = [UUID().uuidString, UUID().uuidString, UUID().uuidString]
        
        // When
        let dataSevice = NewMockDataService(items: items)
        let dataSevice2 = NewMockDataService(items: items2)
        let dataSevice3 = NewMockDataService(items: items3)
        
        // Then
        XCTAssertFalse(dataSevice.items.isEmpty)
        XCTAssertTrue(dataSevice2.items.isEmpty)
        XCTAssertEqual(dataSevice3.items.count, items3?.count)
        
    }
}
