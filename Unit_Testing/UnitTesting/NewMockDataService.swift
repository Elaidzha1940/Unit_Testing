//  /*
//
//  Project: Unit_Testing
//  File: NewMockDataService.swift
//  Created by: Elaidzha Shchukin
//  Date: 08.12.2023
//
//  */

import Foundation
import SwiftUI
import Combine

protocol NewDataServiceProtocol {
    func donwloadItemsWithEscaping(completion: @escaping (_ items: [String]) -> ())
    func donwloadItemsWithCombine() -> AnyPublisher<[String], Error>
}

class NewMockDataService: NewDataServiceProtocol {
    
    let items: [String]
    
    init(items: [String]?) {
        self.items = items ?? [
        "White", "Black", "Blue"
        ]
    }
    
    func donwloadItemsWithEscaping(completion: @escaping (_ items: [String]) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            completion(self.items)
        }
    }
    
    func donwloadItemsWithCombine() -> AnyPublisher<[String], Error> {
        Just(items)
            .tryMap({ publishedItems in
                guard !publishedItems.isEmpty else {
                    throw URLError(.badServerResponse)
                }
                return publishedItems
            })
            .eraseToAnyPublisher()
    }
}
