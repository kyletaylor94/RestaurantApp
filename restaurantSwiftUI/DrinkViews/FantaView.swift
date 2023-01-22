//
//  FantaView.swift
//  restaurantSwiftUI
//
//  Created by Turdesán Csaba on 2023. 01. 22..
//

import SwiftUI

struct FantaView: View {
    
    @State private var isFlipped2 = false
    @ObservedObject var fantacounter = DrinksGlobal.shared
    
    var body: some View{
        VStack{
            ZStack{
                Image(isFlipped2 ? "" : "fanta")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .cornerRadius(15)
                    .rotation3DEffect(.degrees(isFlipped2 ? 180 : 0), axis: (x: 0, y: 1, z: 0)).onTapGesture {
                        withAnimation{
                            self.isFlipped2.toggle()
                        }
                    }
                if isFlipped2 {
                    Text(String(fantacounter.fantacounter))
                        .position(x: 215 ,y: 40)
                    
                    HStack{
                        Button(action: {
                            if fantacounter.fantacounter > 0{
                                fantacounter.fantacounter -= 1
                                print("fanta: \(fantacounter.fantacounter)")
                            }
                        }) {
                            Image(systemName: "minus")
                                .foregroundColor(.black)
                                .frame(width: 70 ,height: 70)
                        }.padding()
                        Button(action: {
                            fantacounter.fantacounter += 1
                            print("fanta: \(fantacounter.fantacounter)")
                        }) {
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                        }
                    }
                }
                
                Text(fanta.name)
                    .font(.system(size: 13))
                    .foregroundColor(.white)
                    .frame(width: 145, height: 15)
                    .background(Color.black.opacity(0.5))
                    .position(x: 197 , y: 135)
            }
        }
        .shadow(color:.black, radius: 20)
        .position(x: 100 , y: 20)
        
        ZStack{
            Text(fanta.price + "Ft")
                .font(.system(size: 15))
                .foregroundColor(.black)
                .frame(width: 75, height: 30)
                .background(Color.green)
                .cornerRadius(15)
                .position(x: 100 ,y: -45)
            
        }
    }
}

struct FantaView_Previews: PreviewProvider {
    static var previews: some View {
        FantaView()
    }
}
