//
//  Location.swift
//  SwiftUIMapApp
//
//  Created by Ahmed Amin on 02/08/2023.
//

import Foundation
import MapKit

struct Location {
    
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
}

extension Location: Identifiable {
    
    var id: String {
        
        UUID().uuidString
    }
}


extension Location: Equatable {
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        
        lhs.name == rhs.name && lhs.cityName == rhs.cityName
        
    }
    
    
}
