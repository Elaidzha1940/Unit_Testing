//  /*
//
//  Project: Unit_Testing
//  File: UnitTestingViewModel.swift
//  Created by: Elaidzha Shchukin
//  Date: 07.12.2023
//
//  */

import Foundation
import SwiftUI

class UnitTestingViewModel: ObservableObject {
    @Published var isPremium: Bool
    @Published var dataArray: [String] = []
    
    init(isPremium: Bool) {
        self.isPremium = isPremium
    }
    
    func addItem(item: String) {
        self.dataArray.append(item)
    }
}
