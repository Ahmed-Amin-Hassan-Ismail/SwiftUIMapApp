//
//  LocationView.swift
//  SwiftUIMapApp
//
//  Created by Ahmed Amin on 02/08/2023.
//

import SwiftUI
import MapKit

struct LocationView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject private var viewModel: LocationViewModel
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.mapRegion)
                .ignoresSafeArea(.all)
        }
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
