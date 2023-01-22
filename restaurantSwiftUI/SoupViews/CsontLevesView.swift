//
//  CsontLevesView.swift
//  restaurantSwiftUI
//
//  Created by Turdesán Csaba on 2023. 01. 22..
//

import SwiftUI

struct CsontLevesView: View {
    
    @State private var isFlipped3 = false
    @ObservedObject var csontlevescounter = GlobalSoup.shared
    
    var body: some View{
        
        VStack{
            ZStack{
                Image(self.isFlipped3 ? "" : "csontleves")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .cornerRadius(15)
                    .rotation3DEffect(.degrees(self.isFlipped3 ? 180 : 0), axis: (x: 0, y: 1, z: 0)).onTapGesture {
                        withAnimation{
                            self.isFlipped3.toggle()
                        }
                    }
                
                if self.isFlipped3 {
                    Text(String(self.csontlevescounter.csontcounter))
                        .position(x: 215 ,y: 40)
                    
                    HStack{
                        Button(action: {
                            if self.csontlevescounter.csontcounter > 0{
                                self.csontlevescounter.csontcounter -= 1
                                print("csontleves: \(self.csontlevescounter.csontcounter)")
                            }
                        }) {
                            Image(systemName: "minus")
                                .foregroundColor(.black)
                                .frame(width: 70 ,height: 70)
                        }.padding()
                        Button(action: {
                            self.csontlevescounter.csontcounter += 1
                            print("csontleves: \(self.csontlevescounter.csontcounter)")
                        }) {
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                        }
                    }
                }
                
                Text(csontleves.name)
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .frame(width: 145, height: 15)
                    .background(Color.black.opacity(0.5))
                    .position(x: 197 , y: 135)
            }
        }
        .shadow(color:.black, radius: 20)
        .position(x:300, y:-172)
        
        ZStack{
            Text(csontleves.price + "Ft")
                .font(.system(size: 15))
                .foregroundColor(.black)
                .frame(width: 75, height: 30)
                .background(Color.green)
                .cornerRadius(15)
                .position(x: 300 ,y: -237)
        }
    }
}

struct CsontLevesView_Previews: PreviewProvider {
    static var previews: some View {
        CsontLevesView()
    }
}
