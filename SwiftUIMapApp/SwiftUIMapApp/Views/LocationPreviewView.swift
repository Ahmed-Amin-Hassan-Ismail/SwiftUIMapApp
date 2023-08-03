//
//  LocationPreviewView.swift
//  SwiftUIMapApp
//
//  Created by Ahmed Amin on 03/08/2023.
//

import SwiftUI

struct LocationPreviewView: View {
    
    // MARK: - Properties
    @EnvironmentObject private var viewModel: LocationViewModel
    let location: Location
    
    // MARK: - Init
    
    init(location: Location) {
        self.location = location
    }
    
    // MARK: - Body
    
    var body: some View {
        
        HStack(alignment: .bottom) {
            
            VStack(alignment: .leading, spacing: 16) {
                
                imageSection
                
                titleSection
            }
            
            VStack(spacing: 10) {
                
                learnMoreButton
                
                nextButton
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.white.opacity(0.8))
                .offset(y: 40)
        )
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3),
                radius: 20, x: 0, y: 0)
        .padding()
        .transition(.asymmetric(
            insertion: .move(edge: .trailing),
            removal: .move(edge: .leading)))
    }
}

extension LocationPreviewView {
    
    private var imageSection: some View {
        
        ZStack {
            Image(location.imageNames.first!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .cornerRadius(10)
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }
    
    
    private var titleSection: some View {
        
        VStack(alignment: .leading) {
            Text(location.name)
                .font(.headline)
                .fontWeight(.bold)
            
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    
    private var learnMoreButton: some View {
        ProminentButtonView(buttonTitle: "Learn more",
                            buttonTitleColor: .white,
                            buttonBackgroundColor: .red) {
            // not implemented yet
        }
    }
    
    private var nextButton: some View {
        ProminentButtonView(buttonTitle: "Next",
                            buttonTitleColor: .red,
                            buttonBackgroundColor: .gray.opacity(0.4)) {
            
            withAnimation(.easeInOut) {
                
                viewModel.didTapOnNextLocation()
            }
        }
    }
    
}

struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            LocationPreviewView(location: dev.location)
        }
        .environmentObject(dev.viewModel)
    }
}
