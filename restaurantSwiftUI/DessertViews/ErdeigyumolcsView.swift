//
//  ErdeigyumolcsView.swift
//  restaurantSwiftUI
//
//  Created by Turdesán Csaba on 2023. 01. 22..
//

import SwiftUI

struct ErdeigyumolcsView: View {
    @State private var isFlipped5 = false
    @ObservedObject var erdeigyumolcscounter = DessertsGlobal.shared
    
    var body: some View{
        VStack{
            ZStack{
                Image(isFlipped5 ? "" : "erdeigyumolcs")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .cornerRadius(15)
                    .rotation3DEffect(.degrees(isFlipped5 ? 180 : 0), axis: (x: 0, y: 1, z: 0)).onTapGesture {
                        withAnimation{
                            self.isFlipped5.toggle()
                        }
                    }
                
                if isFlipped5 {
                    Text(String(erdeigyumolcscounter.erdeigyumolcscounter))
                        .position(x: 215 ,y: 40)
                    
                    HStack{
                        Button(action: {
                            if erdeigyumolcscounter.erdeigyumolcscounter > 0 {
                                erdeigyumolcscounter.erdeigyumolcscounter -= 1
                                print("erdeigyumolcs: \(erdeigyumolcscounter.erdeigyumolcscounter)")
                            }
                        }) {
                            Image(systemName: "minus")
                                .foregroundColor(.black)
                                .frame(width: 70 ,height: 70)
                        }.padding()
                        Button(action: {
                            erdeigyumolcscounter.erdeigyumolcscounter += 1
                            print("erdeigyumolcs: \(erdeigyumolcscounter.erdeigyumolcscounter)")
                        }) {
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                        }
                    }
                }
                
                Text(erdeigyumolcs.name)
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .frame(width: 145, height: 15)
                    .background(Color.black.opacity(0.5))
                    .position(x: 197 , y: 135)
            }
        }
        .shadow(color:.black, radius: 20)
        .position(x: 300 , y: -282)
        
        ZStack{
            Text(erdeigyumolcs.price + "Ft")
                .font(.system(size: 15))
                .foregroundColor(.black)
                .frame(width: 75, height: 30)
                .background(Color.green)
                .cornerRadius(15)
                .position(x: 300 ,y: -345)
        }
    }
}

struct ErdeigyumolcsView_Previews: PreviewProvider {
    static var previews: some View {
        ErdeigyumolcsView()
    }
}
