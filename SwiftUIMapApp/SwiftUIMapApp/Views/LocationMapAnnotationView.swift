//
//  LocationMapAnnotationView.swift
//  SwiftUIMapApp
//
//  Created by Ahmed Amin on 03/08/2023.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    
    // MARK: - Properties
    
   private let accentColor: Color = Color("AccentColor")
    
    
    var body: some View {
                
        VStack(spacing: 0) {
            
            Image(systemName: "map.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(accentColor)
                .clipShape(Circle())
            
            
            
            Image(systemName: "triangle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 10, height: 10)
                .foregroundColor(accentColor)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -2)
                .padding(.bottom, 40)
        }
    }
}

struct LocationMapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapAnnotationView()
    }
}
