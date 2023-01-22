//
//  WelcomeButton.swift
//  restaurantSwiftUI
//
//  Created by Turdesán Csaba on 2023. 01. 22..
//

import SwiftUI

struct WelcomeButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label
            .frame(width: 270)
            .tint(Color.black)
            .padding()
            .background(Color(red: 255, green: 255, blue: 255))
            .foregroundColor(.black)
            .clipShape(Capsule())
        
            .background(Color.black)
            .clipShape(Capsule())
        
        
            .frame(width: 200, height: 100)
            .shadow(color: .black, radius: 15)
    
    }
}
