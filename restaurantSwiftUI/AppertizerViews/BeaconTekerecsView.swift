//
//  BeaconTekerecsView.swift
//  restaurantSwiftUI
//
//  Created by Turdesán Csaba on 2023. 01. 22..
//

import SwiftUI

struct BeaconTekerecsView: View{
    
    @ObservedObject var beacontekercscounter = AppertizerGlobal.shared
    @State private var isFlipped5 = false
    
    var body: some View {
        
        VStack{
            ZStack{
                Image(isFlipped5 ? "" : "beacon")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .cornerRadius(15)
                    .rotation3DEffect(.degrees(isFlipped5 ? 180 : 0), axis: (x: 0, y: 1, z: 0)).onTapGesture {
                        withAnimation{
                            self.isFlipped5.toggle()
                        }
                    }
                
                if isFlipped5 {
                    Text(String(beacontekercscounter.beacontekercs))
                        .position(x: 215 ,y: 40)
                    
                    HStack{
                        Button(action: {
                            if beacontekercscounter.beacontekercs > 0 {
                                beacontekercscounter.beacontekercs -= 1
                                print("beacontekercs: \(beacontekercscounter.beacontekercs)")
                            }
                        }) {
                            Image(systemName: "minus")
                                .foregroundColor(.black)
                                .frame(width: 70 ,height: 70)
                        }.padding()
                        Button(action: {
                            beacontekercscounter.beacontekercs += 1
                            print("beacontekercs: \(beacontekercscounter.beacontekercs)")
                        }) {
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                        }
                    }
                }
                
                Text(beacontekercs.name)
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
            Text(beacontekercs.price + "Ft")
                .font(.system(size: 15))
                .foregroundColor(.black)
                .frame(width: 75, height: 30)
                .background(Color.green)
                .cornerRadius(15)
                .position(x: 300 ,y: -345)
        }
    }
}


struct BeaconTekerecsView_Previews: PreviewProvider {
    static var previews: some View {
        BeaconTekerecsView()
    }
}
