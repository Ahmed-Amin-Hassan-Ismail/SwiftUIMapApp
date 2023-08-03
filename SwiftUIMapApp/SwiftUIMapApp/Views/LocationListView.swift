//
//  LocationListView.swift
//  SwiftUIMapApp
//
//  Created by Ahmed Amin on 03/08/2023.
//

import SwiftUI

struct LocationListView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject private var viewModel: LocationViewModel
    
    var body: some View {
        List {
            
            ForEach(viewModel.locations) { location in
                setupListRow(with: location)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            viewModel.showNextLocation(location: location)
                        }
                    }
            }
            .listRowBackground(Color.clear)
        }
        .listStyle(.plain)
        .clipped()
    }
}



extension LocationListView {
    
    private func setupListRow(with location: Location) -> some View {
        
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            
            
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView()
            .environmentObject(dev.viewModel)
    }
}
