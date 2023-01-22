//
//  CordonBleuView.swift
//  restaurantSwiftUI
//
//  Created by Turdesán Csaba on 2023. 01. 22..
//

import SwiftUI

struct CordonBleuView: View{
    @State private var isFlipped1 = false
    @ObservedObject var cordonbleucounter = AppertizerGlobal.shared
    
    
    var body: some View{
        
        VStack{
            ZStack{
                Image(isFlipped1 ? "" : "cordonbleu")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .cornerRadius(15)
                    .rotation3DEffect(.degrees(isFlipped1 ? 180 : 0), axis: (x: 0, y: 1, z: 0)).onTapGesture {
                        withAnimation{
                            self.isFlipped1.toggle()
                        }
                    }
                if isFlipped1 {
                    Text(String(cordonbleucounter.cordonbleu))
                        .position(x: 215 ,y: 40)
                    
                    HStack{
                        Button(action: {
                            if cordonbleucounter.cordonbleu > 0 {
                                cordonbleucounter.cordonbleu -= 1
                                print("cordonbleu: \(cordonbleucounter.cordonbleu)")
                            }
                        }) {
                            Image(systemName: "minus")
                                .foregroundColor(.black)
                                .frame(width: 70 ,height: 70)
                        }.padding()
                        Button(action: {
                            cordonbleucounter.cordonbleu += 1
                            print("cordonbleu: \(cordonbleucounter.cordonbleu)")
                        }) {
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                        }
                    }
                }
                
                Text(cordonbleu.name)
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .frame(width: 145, height: 15)
                    .background(Color.black.opacity(0.5))
                    .position(x: 197 , y: 135)
            }
        }
        .shadow(color:.black, radius: 20)
        .position(x:300 , y: -28)
        
        ZStack{
            Text(cordonbleu.price + "Ft")
                .font(.system(size: 15))
                .foregroundColor(.black)
                .frame(width: 75, height: 30)
                .background(Color.green)
                .cornerRadius(15)
                .position(x: 300 ,y: -92)
        }
    }
}

struct CordonBleuView_Previews: PreviewProvider {
    static var previews: some View {
        CordonBleuView()
    }
}
