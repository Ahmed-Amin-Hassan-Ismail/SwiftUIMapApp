//
//  SwiftUIMapAppApp.swift
//  SwiftUIMapApp
//
//  Created by Ahmed Amin on 02/08/2023.
//

import SwiftUI

@main
struct SwiftUIMapAppApp: App {
    
    // MARK: - Properties
    
    @StateObject private var viewModel: LocationViewModel = LocationViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                LocationView()
                    .environmentObject(viewModel)
            }
        }
    }
}
