//
//  LocationViewModel.swift
//  SwiftUIMapApp
//
//  Created by Ahmed Amin on 02/08/2023.
//

import Foundation



final class LocationViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published private(set) var locations = [Location]()
    
    
    // MARK: Init
    
    init() {
        
        setupLocations()
    }
    
    // MARK: - Methods
    
    private func setupLocations() {
        
        self.locations.append(contentsOf: LocationsDataService.locations)
        
    }
    
}
