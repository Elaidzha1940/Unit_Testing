//  /*
//
//  Project: Unit_Testing
//  File: UnitTestingView.swift
//  Created by: Elaidzha Shchukin
//  Date: 07.12.2023
//
//  */

// UNIT Test
/*
 Unit Tests
 - tests the business logic in the app
 
 UI Tests
 - tests the UI of app
 */

import SwiftUI

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
