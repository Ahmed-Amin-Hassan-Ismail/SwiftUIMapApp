//
//  PreviewProvider + EXT.swift
//  SwiftUIMapApp
//
//  Created by Ahmed Amin on 02/08/2023.
//

import SwiftUI


extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        
        return DeveloperPreview.instance
    }
}


final class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    
    private init() { }
    
    let viewModel = LocationViewModel()
}

