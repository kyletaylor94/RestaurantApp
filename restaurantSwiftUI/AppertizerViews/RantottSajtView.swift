//
//  RantottSajtView.swift
//  restaurantSwiftUI
//
//  Created by Turdesán Csaba on 2023. 01. 22..
//

import SwiftUI

struct RantottSajtView:View{
    @State private var isFlipped3 = false
    @ObservedObject var rantottsajtcounter = AppertizerGlobal.shared
    
    var body: some View{
        VStack{
            ZStack{
                Image(isFlipped3 ? "" : "rantottsajt")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .cornerRadius(15)
                    .rotation3DEffect(.degrees(isFlipped3 ? 180 : 0), axis: (x: 0, y: 1, z: 0)).onTapGesture {
                        withAnimation{
                            self.isFlipped3.toggle()
                        }
                    }
                
                if isFlipped3 {
                    Text(String(rantottsajtcounter.rantottsajt))
                        .position(x: 215 ,y: 40)
                    
                    HStack{
                        Button(action: {
                            if rantottsajtcounter.rantottsajt > 0 {
                                rantottsajtcounter.rantottsajt -= 1
                                print("rantottsajt: \(rantottsajtcounter.rantottsajt)")
                            }
                        }) {
                            Image(systemName: "minus")
                                .foregroundColor(.black)
                                .frame(width: 70 ,height: 70)
                        }.padding()
                        Button(action: {
                            rantottsajtcounter.rantottsajt += 1
                            print("rantottsajt: \(rantottsajtcounter.rantottsajt)")
                        }) {
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                        }
                    }
                }
                
                Text(rantottsajt.name)
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .frame(width: 145, height: 15)
                    .background(Color.black.opacity(0.5))
                    .position(x: 197 , y: 135)
            }
        }
        .shadow(color:.black, radius: 20)
        .position(x:300, y:-172)
        
        
        ZStack{
            Text(rantottsajt.price + "Ft")
                .font(.system(size: 15))
                .foregroundColor(.black)
                .frame(width: 75, height: 30)
                .background(Color.green)
                .cornerRadius(15)
                .position(x: 300 ,y: -237)
        }
    }
}

struct RantottSajtView_Previews: PreviewProvider {
    static var previews: some View {
        RantottSajtView()
    }
}
