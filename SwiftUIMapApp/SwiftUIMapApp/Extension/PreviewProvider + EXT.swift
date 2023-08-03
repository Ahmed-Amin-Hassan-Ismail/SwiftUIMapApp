//
//  PreviewProvider + EXT.swift
//  SwiftUIMapApp
//
//  Created by Ahmed Amin on 02/08/2023.
//

import SwiftUI
import MapKit


extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        
        return DeveloperPreview.instance
    }
}


final class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    
    private init() { }
    
    let viewModel = LocationViewModel()
    
    let location = Location(
        name: "Colosseum",
        cityName: "Rome",
        coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922),
        description: "The Colosseum is an oval amphitheatre in the centre of the city of Rome, Italy, just east of the Roman Forum. It is the largest ancient amphitheatre ever built, and is still the largest standing amphitheatre in the world today, despite its age.",
        imageNames: [
            "rome-colosseum-1",
            "rome-colosseum-2",
            "rome-colosseum-3",
        ],
        link: "https://en.wikipedia.org/wiki/Colosseum")
}

