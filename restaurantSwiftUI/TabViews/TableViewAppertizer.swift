//
//  TableViewAppertizer.swift
//  restaurantSwiftUI
//
//  Created by Turdesán Csaba on 2023. 01. 04..
//

import SwiftUI

//MARK: - Sharing Appertizercounter Data to AddtocartView
class AppertizerGlobal: ObservableObject{
    
    @Published var husgomboc = 0
    @Published var cordonbleu = 0
    @Published var cezarsalata = 0
    @Published var rantottsajt = 0
    @Published var rantottkarfiol = 0
    @Published var beacontekercs = 0
    
   static let shared = AppertizerGlobal()
}


//MARK: - Sharing Datas for AppertizerViews: names, prices
struct AppertizerData {
    var name: String
    var price: String
}


var husgomboc = AppertizerData(name: "Húsgombóc", price: "1000")
var cordonbleu = AppertizerData(name: "Cordon Bleu", price: "1200")
var cezarsalata = AppertizerData(name: "Cézársaláta", price: "900")
var rantottsajt = AppertizerData(name: "Rántottsajt", price: "1200")
var rantottkarfiol = AppertizerData(name: "RántottKarfiol", price: "1150")
var beacontekercs = AppertizerData(name: "Beacon-Tekercs", price: "1000")

//MARK: - AppertizerViews in TabView

struct TableViewAppertizer: View {
    
    @State private var isFlipped = false
    @State private var isFlipped1 = false
    @State private var isFlipped2 = false
    @State private var isFlipped3 = false
    @State private var isFlipped4 = false
    @State private var isFlipped5 = false
    
    @State var AddtoCartIsOn = false

    
    var body: some View {
        ZStack{
            
            Color(red: 0.96, green: 0.96, blue: 1.1)
            
            LinearGradient(gradient: Gradient(colors: [.red, .purple]), startPoint: .topLeading, endPoint: .bottomLeading)
                .rotationEffect(.degrees(244))
            
            GeometryReader{ geometry in
                ScrollView{
                    
                    HusgombocView()
                    
                    CordonBleuView()
                    
                    SalataView()
                    
                    RantottSajtView()
                    
                    RantottKarfiolView()
                    
                    BeaconTekerecsView()
                }
                .background(Color.clear)
                .overlay(
                    Button(action: {self.AddtoCartIsOn = true
                        
                    }) {
                        HStack {
                            Image(systemName: "cart")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                    }
                    .sheet(isPresented: $AddtoCartIsOn){
                        restaurantSwiftUI.AddtoCartView()}
                    .padding()
                    .background(Circle().fill(Color.black))
                    .position(x: geometry.size.width - 70, y: geometry.size.height - 70)
                    )
            }
        }
    }
}

struct TableViewAppertizer_Previews: PreviewProvider {
    static var previews: some View {
        TableViewAppertizer()
    }
}





    

       

      

      
