//  /*
//
//  Project: Unit_Testing
//  File: UnitTestingView.swift
//  Created by: Elaidzha Shchukin
//  Date: 07.12.2023
//
//  */

/*
 Unit Tests
 - test the business logic in the app
 
 UI Tests
 - tests the UI of app
 */

import SwiftUI

class UnitTestingViewModel: ObservableObject {
    @Published var isPremium: Bool
    
    init(isPremium: Bool) {
        self.isPremium = isPremium
    }
}

struct UnitTestingView: View {
    @StateObject private var vm: UnitTestingViewModel
    
    init(isPremium: Bool) {
        _vm = StateObject(wrappedValue: UnitTestingViewModel(isPremium: isPremium))
    }
    
    var body: some View {
        // content layer
        Text(vm.isPremium.description)
        
    }
}

#Preview {
    UnitTestingView(isPremium: true)
}
