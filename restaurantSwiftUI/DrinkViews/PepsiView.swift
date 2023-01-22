//
//  PepsiView.swift
//  restaurantSwiftUI
//
//  Created by Turdesán Csaba on 2023. 01. 22..
//

import SwiftUI

struct PepsiView: View {
    @State private var isFlipped1 = false
    @ObservedObject var pepsicounter = DrinksGlobal.shared
    
    var body: some View{
        VStack{
            ZStack{
                Image(isFlipped1 ? "" : "pepsi")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .cornerRadius(15)
                    .rotation3DEffect(.degrees(isFlipped1 ? 180 : 0), axis: (x: 0, y: 1, z: 0)).onTapGesture {
                        withAnimation{
                            self.isFlipped1.toggle()
                        }
                    }
                if isFlipped1 {
                    Text(String(pepsicounter.pepsicounter))
                        .position(x: 215 ,y: 40)
                    
                    HStack{
                        Button(action: {
                            if pepsicounter.pepsicounter > 0 {
                                pepsicounter.pepsicounter -= 1
                                print("pepsi: \(pepsicounter.pepsicounter)")
                            }
                        }) {
                            Image(systemName: "minus")
                                .foregroundColor(.black)
                                .frame(width: 70 ,height: 70)
                        }.padding()
                        Button(action: {
                            pepsicounter.pepsicounter += 1
                            print("pepsi: \(pepsicounter.pepsicounter)")
                        }) {
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                        }
                    }
                }
                
                Text(pepsi.name)
                    .font(.system(size: 13))
                    .foregroundColor(.white)
                    .frame(width: 145, height: 15)
                    .background(Color.black.opacity(0.5))
                    .position(x: 197 , y: 135)
            }
        }
        .shadow(color:.black, radius: 20)
        .position(x:300 , y: -28)
        
        
        ZStack{
            Text(pepsi.price + "Ft")
                .font(.system(size: 15))
                .foregroundColor(.black)
                .frame(width: 75, height: 30)
                .background(Color.green)
                .cornerRadius(15)
                .position(x: 300 ,y: -92)
        }
    }
}

struct PepsiView_Previews: PreviewProvider {
    static var previews: some View {
        PepsiView()
    }
}
