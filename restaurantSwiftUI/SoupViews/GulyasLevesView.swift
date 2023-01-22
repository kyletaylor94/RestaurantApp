//
//  GulyasLevesView.swift
//  restaurantSwiftUI
//
//  Created by Turdesán Csaba on 2023. 01. 22..
//

import SwiftUI

struct GulyasLevesView: View {
    @State private var isFlipped1 = false
    @ObservedObject var gulyaslevescounter = GlobalSoup.shared
    
    var body: some View{
        
        VStack{
            ZStack{
                Image(self.isFlipped1 ? "" : "gulyasleves")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .cornerRadius(15)
                    .rotation3DEffect(.degrees(self.isFlipped1 ? 180 : 0), axis: (x: 0, y: 1, z: 0)).onTapGesture {
                        withAnimation{
                            self.isFlipped1.toggle()
                        }
                    }
                if self.isFlipped1 {
                    Text(String(self.gulyaslevescounter.gulyascounter))
                        .position(x: 215 ,y: 40)
                    
                    HStack{
                        Button(action: {
                            if self.gulyaslevescounter.gulyascounter > 0 {
                                self.gulyaslevescounter.gulyascounter -= 1
                                print("gulyásleves: \(self.gulyaslevescounter.gulyascounter)")
                            }
                        }) {
                            Image(systemName: "minus")
                                .foregroundColor(.black)
                                .frame(width: 70 ,height: 70)
                        }.padding()
                        Button(action: {
                            self.gulyaslevescounter.gulyascounter += 1
                            print("gulyásleves: \(self.gulyaslevescounter.gulyascounter)")
                        }) {
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                        }
                    }
                }
                
                Text(gulyasleves.name)
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
            Text(gulyasleves.price + "Ft")
                .font(.system(size: 15))
                .foregroundColor(.black)
                .frame(width: 75, height: 30)
                .background(Color.green)
                .cornerRadius(15)
                .position(x: 300 ,y: -92)
        }
    }
}

struct GulyasLevesView_Previews: PreviewProvider {
    static var previews: some View {
        GulyasLevesView()
    }
}
