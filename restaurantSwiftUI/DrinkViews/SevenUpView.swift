//
//  SevenUpView.swift
//  restaurantSwiftUI
//
//  Created by Turdesán Csaba on 2023. 01. 22..
//

import SwiftUI

struct SevenUpView: View {
    @State private var isFlipped3 = false
    @ObservedObject var sevenupcounter = DrinksGlobal.shared
    
    var body: some View{
        VStack{
            ZStack{
                Image(isFlipped3 ? "" : "sevenup")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .cornerRadius(15)
                    .rotation3DEffect(.degrees(isFlipped3 ? 180 : 0), axis: (x: 0, y: 1, z: 0)).onTapGesture {
                        withAnimation{
                            self.isFlipped3.toggle()
                        }
                    }
                
                if isFlipped3 {
                    Text(String(sevenupcounter.sevenupcounter))
                        .position(x: 215 ,y: 40)
                    
                    HStack{
                        Button(action: {
                            if sevenupcounter.sevenupcounter > 0 {
                                sevenupcounter.sevenupcounter -= 1
                                print("sevenup: \(sevenupcounter.sevenupcounter)")
                            }
                        }) {
                            Image(systemName: "minus")
                                .foregroundColor(.black)
                                .frame(width: 70 ,height: 70)
                        }.padding()
                        Button(action: {
                            sevenupcounter.sevenupcounter += 1
                            print("sevenup: \(sevenupcounter.sevenupcounter)")
                        }) {
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                        }
                    }
                }
                
                Text(sevenup.name)
                    .font(.system(size: 13))
                    .foregroundColor(.white)
                    .frame(width: 145, height: 15)
                    .background(Color.black.opacity(0.5))
                    .position(x: 197 , y: 135)
            }
        }
        .shadow(color:.black, radius: 20)
        .position(x:300, y:-172)
        
        ZStack{
            Text(sevenup.price + "Ft")
                .font(.system(size: 15))
                .foregroundColor(.black)
                .frame(width: 75, height: 30)
                .background(Color.green)
                .cornerRadius(15)
                .position(x: 300 ,y: -237)
        }
    }
}

struct SevenUpView_Previews: PreviewProvider {
    static var previews: some View {
        SevenUpView()
    }
}
