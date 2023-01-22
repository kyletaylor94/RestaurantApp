//
//  BorView.swift
//  restaurantSwiftUI
//
//  Created by Turdesán Csaba on 2023. 01. 22..
//

import SwiftUI


struct BorView: View{
    @State private var isFlipped5 = false
    @ObservedObject var borcounter = DrinksGlobal.shared
    
    var body: some View{
        
        VStack{
            ZStack{
                Image(isFlipped5 ? "" : "bor")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .cornerRadius(15)
                    .rotation3DEffect(.degrees(isFlipped5 ? 180 : 0), axis: (x: 0, y: 1, z: 0)).onTapGesture {
                        withAnimation{
                            self.isFlipped5.toggle()
                        }
                    }
                
                if isFlipped5 {
                    Text(String(borcounter.borcounter))
                        .position(x: 215 ,y: 40)
                    
                    HStack{
                        Button(action: {
                            if borcounter.borcounter > 0 {
                                borcounter.borcounter -= 1
                                print("bor: \(borcounter.borcounter)")
                            }
                        }) {
                            Image(systemName: "minus")
                                .foregroundColor(.black)
                                .frame(width: 70 ,height: 70)
                        }.padding()
                        Button(action: {
                            borcounter.borcounter += 1
                            print("bor: \(borcounter.borcounter)")
                        }) {
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                        }
                    }
                }
                
                Text(irsaifeherbor.name)
                    .font(.system(size: 13))
                    .foregroundColor(.white)
                    .frame(width: 145, height: 15)
                    .background(Color.black.opacity(0.5))
                    .position(x: 197 , y: 135)
            }
        }
        .shadow(color:.black, radius: 20)
        .position(x: 300 , y: -282)
        
        ZStack{
            Text(irsaifeherbor.price + "Ft")
                .font(.system(size: 15))
                .foregroundColor(.black)
                .frame(width: 75, height: 30)
                .background(Color.green)
                .cornerRadius(15)
                .position(x: 300 ,y: -345)
        }
    }
}

struct BorView_Previews: PreviewProvider {
    static var previews: some View {
        BorView()
    }
}
