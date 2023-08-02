//
//  LocationView.swift
//  SwiftUIMapApp
//
//  Created by Ahmed Amin on 02/08/2023.
//

import SwiftUI

struct LocationView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject private var viewModel: LocationViewModel
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(viewModel.locations[1].cityName)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LocationView()
                .environmentObject(dev.viewModel)
        }
    }
}
