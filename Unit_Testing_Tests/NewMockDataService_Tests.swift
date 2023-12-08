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
    
    var cancellables = Set<AnyCancellable>()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        cancellables.removeAll()
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
    
    func test_NewMockDataService_donwloadItemsWithEscaping_doesReturnValues() {
        // Given
        let dataSevice = NewMockDataService(items: nil)
        
        // When
        var items: [String] = []
        let expectation = XCTestExpectation()
        
        dataSevice.donwloadItemsWithEscaping { returnedItems in
            items  = returnedItems
            expectation.fulfill()
        }
        
        // Then
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(items.count, dataSevice.items.count)
    }
    
    func test_NewMockDataService_donwloadItemsWithCombine_doesReturnValues() {
        // Given
        let dataSevice = NewMockDataService(items: nil)
        
        // When
        var items: [String] = []
        let expectation = XCTestExpectation()
        
        dataSevice.donwloadItemsWithCombine()
            .sink { completion in
                switch completion {
                case .finished:
                    expectation.fulfill()
                case .failure:
                    XCTFail()
                }
            } receiveValue: { returnedItems in
                items  = returnedItems
            }
            .store(in: &cancellables)
        
        // Then
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(items.count, dataSevice.items.count)
    }
    
    func test_NewMockDataService_donwloadItemsWithCombine_doesFail() {
        // Given
        let dataSevice = NewMockDataService(items: [])
        
        // When
        var items: [String] = []
        let expectation = XCTestExpectation(description: "Does throw an error.")
        let expectation2 = XCTestExpectation(description: "Does throw an URLerror.badServerResponse")
        
        dataSevice.donwloadItemsWithCombine()
            .sink { completion in
                switch completion {
                case .finished:
                    XCTFail()
                case .failure(let error):
                    expectation.fulfill()
                    
                    //let urlError = error as? URLError
                    //XCTAssertEqual(urlError, URLError(.badServerResponse))
                    
                    if error as? URLError == URLError(.badServerResponse) {
                        expectation2.fulfill()
                    }
                }
            } receiveValue: { returnedItems in
                items  = returnedItems
            }
            .store(in: &cancellables)
        
        // Then
        wait(for: [expectation, expectation2], timeout: 5)
        XCTAssertEqual(items.count, dataSevice.items.count)
    }
}
