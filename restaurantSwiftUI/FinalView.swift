//
//  FinalView.swift
//  restaurantSwiftUI
//
//  Created by Turdesán Csaba on 2023. 01. 19..
//

import SwiftUI
import Lottie


//MARK: - After order

struct FinalView: View {
    var body: some View{
        ZStack{
            Color(red: 0.96, green: 0.96, blue: 1.1)
            
            LinearGradient(gradient: Gradient(colors: [.gray, .red]), startPoint: .topLeading, endPoint: .bottomLeading)
                .rotationEffect(.degrees(0))
            
            LinearGradient(gradient: Gradient(colors: [.blue, .gray]), startPoint: .bottomLeading, endPoint: .topLeading)
                .rotationEffect(.degrees(0))
            
        
            VStack{
                LottieView()
                Text("Köszönjük rendelését!")
            }.position(x:200 , y:100)
        }.ignoresSafeArea(.all)
    }
}


 


    

