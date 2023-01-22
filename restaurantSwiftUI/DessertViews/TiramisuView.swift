//
//  TiramisuView.swift
//  restaurantSwiftUI
//
//  Created by Turdesán Csaba on 2023. 01. 22..
//

import SwiftUI

struct TiramisuView: View {
    @State private var isFlipped = false
    @ObservedObject var tiramisucounter = DessertsGlobal.shared
    
    
    var body: some View{
        VStack{
            ZStack{
                
                Image(isFlipped ? "" : "tiramisu")
                
                    .resizable()
                    .frame(width: 150 , height: 150)
                    .cornerRadius(15)
                    .rotation3DEffect(.degrees(isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0)).onTapGesture {
                        withAnimation{
                            self.isFlipped.toggle()
                        }
                    }
                //
                if isFlipped {
                    Text(String(tiramisucounter.tiramisucounter))
                        .position(x: 215 ,y: 40)
                    
                    HStack{
                        Button(action: {
                            if tiramisucounter.tiramisucounter > 0 {
                                tiramisucounter.tiramisucounter -= 1
                                print("tiramisu: \(tiramisucounter.tiramisucounter)")
                            }
                        }) {
                            Image(systemName: "minus")
                                .foregroundColor(.black)
                                .frame(width: 70 ,height: 70)
                        }.padding()
                        Button(action: {
                            tiramisucounter.tiramisucounter += 1
                            print("tiramisu:  \(tiramisucounter.tiramisucounter)")
                        }) {
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                        }
                    }
                }
                
                
                Text(tiramisu.name)
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .frame(width: 145, height: 15)
                    .background(Color.black.opacity(0.5))
                    .position(x: 197 , y: 135)
                
                
            }
            .shadow(color:.black, radius: 20)
            .position(x: 100 , y: 165 )
            
            
            ZStack{
                Text(tiramisu.price + "Ft")
                    .font(.system(size: 15))
                    .foregroundColor(.black)
                    .frame(width: 75, height: 30)
                    .background(Color.green)
                    .cornerRadius(15)
                    .position(x: 105 ,y: 102)
            }
        }
    }
}


struct TiramisuView_Previews: PreviewProvider {
    static var previews: some View {
        TiramisuView()
    }
}
