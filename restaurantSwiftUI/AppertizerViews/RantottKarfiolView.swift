//
//  RantottKarfiolView.swift
//  restaurantSwiftUI
//
//  Created by Turdesán Csaba on 2023. 01. 22..
//

import SwiftUI

struct RantottKarfiolView:View{
    
    @State private var isFlipped4 = false
    @ObservedObject var rantottkarfiolcounter = AppertizerGlobal.shared
    
    var body: some View{
        
        VStack{
            ZStack{
                Image(isFlipped4 ? "" : "karfiol")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .cornerRadius(15)
                    .rotation3DEffect(.degrees(isFlipped4 ? 180 : 0), axis: (x: 0, y: 1, z: 0)).onTapGesture {
                        withAnimation{
                            self.isFlipped4.toggle()
                        }
                    }
                if isFlipped4 {
                    Text(String(rantottkarfiolcounter.rantottkarfiol))
                        .position(x: 215 ,y: 40)
                    
                    HStack{
                        Button(action: {
                            if rantottkarfiolcounter.rantottkarfiol > 0{
                                rantottkarfiolcounter.rantottkarfiol -= 1
                                print("rantottkarfiol: \(rantottkarfiolcounter.rantottkarfiol)")
                            }
                        }) {
                            Image(systemName: "minus")
                                .foregroundColor(.black)
                                .frame(width: 70 ,height: 70)
                        }.padding()
                        Button(action: {
                            rantottkarfiolcounter.rantottkarfiol += 1
                            print("rantottkarfiol: \(rantottkarfiolcounter.rantottkarfiol)")
                        }) {
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                        }
                    }
                }
                
                
                Text(rantottkarfiol.name)
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .frame(width: 145, height: 15)
                    .background(Color.black.opacity(0.5))
                    .position(x: 197 , y: 135)
            }
        }
        .shadow(color:.black, radius: 20)
        .position(x: 100 , y:-90 )
        
        ZStack{
            Text(rantottkarfiol.price + "Ft")
                .font(.system(size: 15))
                .foregroundColor(.black)
                .frame(width: 75, height: 30)
                .background(Color.green)
                .cornerRadius(15)
                .position(x: 100 ,y: -150)
        }
    }
}

struct RantottKarfiolView_Previews: PreviewProvider {
    static var previews: some View {
        RantottKarfiolView()
    }
}
