//
//  TukotojasosCsirkemellView.swift
//  restaurantSwiftUI
//
//  Created by Turdesán Csaba on 2023. 01. 22..
//

import SwiftUI

struct TukotojasosCsirkemellView: View {
    @State private var isFlipped2 = false
    @ObservedObject  var tukortojasoshuscounter = DinnerGlobal.shared
    
    
    var body: some View {
        
        VStack{
            ZStack{
                Image(isFlipped2 ? "" : "tojasoshus")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .cornerRadius(15)
                    .rotation3DEffect(.degrees(isFlipped2 ? 180 : 0), axis: (x: 0, y: 1, z: 0)).onTapGesture {
                        withAnimation{
                            self.isFlipped2.toggle()
                        }
                    }
                if isFlipped2 {
                    Text(String(tukortojasoshuscounter.tukortojasoshuscounter))
                        .position(x: 215 ,y: 40)
                    
                    HStack{
                        Button(action: {
                            if tukortojasoshuscounter.tukortojasoshuscounter > 0 {
                                tukortojasoshuscounter.tukortojasoshuscounter -= 1
                                print("tukortojasoshus: \(tukortojasoshuscounter.tukortojasoshuscounter)")
                            }
                        }) {
                            Image(systemName: "minus")
                                .foregroundColor(.black)
                                .frame(width: 70 ,height: 70)
                        }.padding()
                        Button(action: {
                            tukortojasoshuscounter.tukortojasoshuscounter += 1
                            print("tukortojasoshus: \(tukortojasoshuscounter.tukortojasoshuscounter)")
                        }) {
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                        }
                    }
                }
                
                Text(tukortojasoshus.name)
                    .font(.system(size: 11))
                    .foregroundColor(.white)
                    .frame(width: 145, height: 15)
                    .background(Color.black.opacity(0.5))
                    .position(x: 197 , y: 135)
            }
        }
        .shadow(color:.black, radius: 20)
        .position(x: 100 , y: 20)
        
        ZStack{
            Text(tukortojasoshus.price + "Ft")
                .font(.system(size: 15))
                .foregroundColor(.black)
                .frame(width: 75, height: 30)
                .background(Color.green)
                .cornerRadius(15)
                .position(x: 100 ,y: -45)
            
        }
    }
}

struct TukotojasosCsirkemellView_Previews: PreviewProvider {
    static var previews: some View {
        TukotojasosCsirkemellView()
    }
}
