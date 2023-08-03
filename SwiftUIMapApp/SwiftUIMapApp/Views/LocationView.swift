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
            
            mapView
            
            VStack {
                headerView
                
                Spacer()
            }
            
            
        }
    }
}


// MARK: - Setup Views

extension LocationView {
    
    private var mapView: some View {
        withAnimation(.easeInOut) {
            Map(coordinateRegion: $viewModel.mapRegion)
                .ignoresSafeArea(.all)
        }
    }
    
    private var headerView: some View {
        VStack(spacing: 0.0) {
            
            
            headerButtonView
            
            if viewModel.showLocationListView {
                LocationListView()
                    .environmentObject(viewModel)
            }
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.25),
                radius: 20, x: 0, y: 15)
        .padding()
    }
    
    
    private var headerButtonView: some View {
        Button {
            
            withAnimation(.easeInOut) {
                
                viewModel.showLocationListView.toggle()
            }
            
        } label: {
            
            headerCityName
        }
    }
    
    private var headerCityName: some View {
        
        lazy var headerName = "\(viewModel.currentLocation?.name ?? ""), \(viewModel.currentLocation?.cityName ?? "")"
        
        return  HStack(spacing: 20) {
            
            Image(systemName: "arrow.down")
                .font(.headline)
                .rotationEffect(Angle(degrees: viewModel.showLocationListView ? 180 : 0))
            
            Text(headerName)
                .font(.title2)
                .fontWeight(.black)
                .frame(height: 55)
            
        }
        .frame(maxWidth: .infinity)
        .foregroundColor(.primary)
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
