//
//  ErolevesView.swift
//  restaurantSwiftUI
//
//  Created by Turdesán Csaba on 2023. 01. 22..
//

import SwiftUI

struct ErolevesView: View {
    
    @State private var isFlipped2 = false
    @ObservedObject var erolevescounter = GlobalSoup.shared
    
    
    var body: some View{
        
        VStack{
            ZStack{
                Image(self.isFlipped2 ? "" : "eroleves")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .cornerRadius(15)
                    .rotation3DEffect(.degrees(self.isFlipped2 ? 180 : 0), axis: (x: 0, y: 1, z: 0)).onTapGesture {
                        withAnimation{
                            self.isFlipped2.toggle()
                        }
                    }
                if self.isFlipped2 {
                    Text(String(self.erolevescounter.erocounter))
                        .position(x: 215 ,y: 40)
                    
                    HStack{
                        Button(action: {
                            if self.erolevescounter.erocounter > 0 {
                                self.erolevescounter.erocounter -= 1
                                print("eroleves: \(self.erolevescounter.erocounter)")
                            }
                        }) {
                            Image(systemName: "minus")
                                .foregroundColor(.black)
                                .frame(width: 70 ,height: 70)
                        }.padding()
                        Button(action: {
                            self.erolevescounter.erocounter += 1
                            print("eroleves: \(self.erolevescounter.erocounter)")
                        }) {
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                        }
                    }
                }
                
                Text(eroleves.name)
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .frame(width: 145, height: 15)
                    .background(Color.black.opacity(0.5))
                    .position(x: 197 , y: 135)
            }
        }
        .shadow(color:.black, radius: 20)
        .position(x: 100 , y: 20)
        
        ZStack{
            Text(eroleves.price + "Ft")
                .font(.system(size: 15))
                .foregroundColor(.black)
                .frame(width: 75, height: 30)
                .background(Color.green)
                .cornerRadius(15)
                .position(x: 100 ,y: -45)
        }
    }
}

struct ErolevesView_Previews: PreviewProvider {
    static var previews: some View {
        ErolevesView()
    }
}
