//
//  SomloiGaluskaView.swift
//  restaurantSwiftUI
//
//  Created by Turdesán Csaba on 2023. 01. 22..
//

import SwiftUI


struct SomloiGaluskaView: View {
    @State private var isFlipped1 = false
    @ObservedObject var somloicounter = DessertsGlobal.shared
    
    var body: some View{
        VStack{
            ZStack{
                Image(isFlipped1 ? "" : "somloi")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .cornerRadius(15)
                    .rotation3DEffect(.degrees(isFlipped1 ? 180 : 0), axis: (x: 0, y: 1, z: 0)).onTapGesture {
                        withAnimation{
                            self.isFlipped1.toggle()
                        }
                    }
                if isFlipped1 {
                    Text(String(somloicounter.somloicounter))
                        .position(x: 215 ,y: 40)
                    
                    HStack{
                        Button(action: {
                            if somloicounter.somloicounter > 0 {
                                somloicounter.somloicounter -= 1
                                print("somloi: \(somloicounter.somloicounter)")
                            }
                        }) {
                            Image(systemName: "minus")
                                .foregroundColor(.black)
                                .frame(width: 70 ,height: 70)
                        }.padding()
                        Button(action: {
                            somloicounter.somloicounter += 1
                            print("somloi: \(somloicounter.somloicounter)")
                        }) {
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                        }
                    }
                }
                
                Text(somloi.name)
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
            Text(somloi.price + "Ft")
                .font(.system(size: 15))
                .foregroundColor(.black)
                .frame(width: 75, height: 30)
                .background(Color.green)
                .cornerRadius(15)
                .position(x: 300 ,y: -92)
        }
    }
}

struct SomloiGaluskaView_Previews: PreviewProvider {
    static var previews: some View {
        SomloiGaluskaView()
    }
}
