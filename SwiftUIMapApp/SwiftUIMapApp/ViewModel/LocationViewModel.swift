//
//  LocationViewModel.swift
//  SwiftUIMapApp
//
//  Created by Ahmed Amin on 02/08/2023.
//

import Foundation
import MapKit
import Combine


final class LocationViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var locations = [Location]()
    @Published var currentLocation: Location?
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    @Published var showLocationListView: Bool = false
    
    private let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: Init
    
    init() {
        
        setupLocations()
    }
    
    // MARK: - Methods
    
    private func setupLocations() {
        
        locations.append(contentsOf: LocationsDataService.locations)
        addSubscriber()
        
    }
    
    private func addSubscriber() {
        
        $locations
            .sink { [weak self] locations in
                guard let self = self else { return }
                self.currentLocation = locations.first!
            }
            .store(in: &cancellables)
        
        $currentLocation
            .sink { [weak self] location in
                guard let self = self ,
                      let location = location
                else { return }
                
                self.updateMapRegion(with: location)
            }
            .store(in: &cancellables)
        
    }
    
    private func updateMapRegion(with location: Location) {
        
        mapRegion = MKCoordinateRegion(center: location.coordinates, span: span)
    }
    
}
