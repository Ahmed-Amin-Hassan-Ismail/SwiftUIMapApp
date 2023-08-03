//
//  ProminentButtonView.swift
//  SwiftUIMapApp
//
//  Created by Ahmed Amin on 03/08/2023.
//

import SwiftUI

struct ProminentButtonView: View {
    
    // MARK: - Properties
    
    let buttonTitle: String
    let buttonTitleColor: Color
    let buttonBackgroundColor: Color
    var buttonAction: (() -> Void)
    
    // MARK: - Init
    
    init(buttonTitle: String,
         buttonTitleColor: Color,
         buttonBackgroundColor: Color,
         buttonAction: @escaping (() -> Void)) {
        
        self.buttonTitle = buttonTitle
        self.buttonTitleColor = buttonTitleColor
        self.buttonBackgroundColor = buttonBackgroundColor
        self.buttonAction = buttonAction
    }
    
    
    var body: some View {
        
        
        Button {
            
            buttonAction()
            
        } label: {
            
            Text(buttonTitle)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(buttonTitleColor)
                .frame(width: 150, height: 55)
                .background(buttonBackgroundColor)
                .cornerRadius(10)
            
        }

        
    }
}

struct ProminentButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ProminentButtonView(buttonTitle: "Learn More", buttonTitleColor: .white, buttonBackgroundColor: .red, buttonAction: { })
    }
}
