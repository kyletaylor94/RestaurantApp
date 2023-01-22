//
//  AddToCart.swift
//  restaurantSwiftUI
//
//  Created by Turdesán Csaba on 2023. 01. 22..
//

import SwiftUI

struct AddToCart: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label
            .tint(Color.white)
            .clipShape(Circle())
            .background(Color.black)
            .shadow(color: .black, radius: 15)
    }
}


