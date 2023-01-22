//
//  HagymalevesView.swift
//  restaurantSwiftUI
//
//  Created by Turdesán Csaba on 2023. 01. 22..
//

import SwiftUI


struct HagymalevesView: View {
    @State private var isFlipped = false
    @ObservedObject var hagymalevescounter = GlobalSoup.shared
    
    var body: some View{
        
        VStack{
            ZStack{
                Image(self.isFlipped ? "" : "hagymaleves")
                    .resizable()
                    .frame(width: 150 , height: 150)
                    .cornerRadius(15)
                    .rotation3DEffect(.degrees(self.isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                    .onTapGesture {
                        withAnimation{
                            self.isFlipped.toggle()
                        }
                    }
                
                if self.isFlipped {
                    Text(String(self.hagymalevescounter.hagymacounter))
                        .position(x: 215 ,y: 40)
                    
                    HStack{
                        Button(action: {
                            if self.hagymalevescounter.hagymacounter > 0 {
                                self.hagymalevescounter.hagymacounter -= 1
                                print("hagymaleves: \(self.hagymalevescounter)")
                            }
                        }) {
                            Image(systemName: "minus")
                                .foregroundColor(.black)
                                .frame(width: 70 ,height: 70)
                        }.padding()
                        Button(action: {
                            self.hagymalevescounter.hagymacounter += 1
                            print("hagymaleves:  \(self.hagymalevescounter)")
                        }) {
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                        }
                    }
                }
                
                Text(hagymaleves.name)
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .frame(width: 145, height: 15)
                    .background(Color.black.opacity(0.5))
                    .position(x: 197 , y: 135)
                
            }
            .shadow(color:.black, radius: 20)
            .position(x: 100 , y: 165 )
            
            
            ZStack{
                Text(hagymaleves.price + "Ft")
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

struct HagymalevesView_Previews: PreviewProvider {
    static var previews: some View {
        HagymalevesView()
    }
}
