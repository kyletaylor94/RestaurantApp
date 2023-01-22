//
//  TableViewDesserts.swift
//  restaurantSwiftUI
//
//  Created by Turdesán Csaba on 2023. 01. 04..
//

import SwiftUI

//MARK: - Sharing Dessertcounts Data to AddtocartView

class DessertsGlobal:ObservableObject{
   @Published var tiramisucounter = 0
   @Published var somloicounter = 0
   @Published var profiterolcounter = 0
   @Published var amerikaipalacsintacounter = 0
   @Published var turospalacsintacounter = 0
   @Published var erdeigyumolcscounter = 0
    
    static let shared = DessertsGlobal()
}

//MARK: - Sharing Datas for DessertViews: names, prices

struct Desserts {
    var name: String
    var price: String
}

var tiramisu = Desserts(name: "Tiramisu", price: "700")
var somloi = Desserts(name: "Somlói Galuska", price: "600")
var turospalacsinta = Desserts(name: "Túrós-palacsinta", price: "1000")
var profiterol = Desserts(name: "Profiterol", price: "900")
var amerikaipalacsinta = Desserts(name: "Amerikai-palacsinta", price: "700")
var erdeigyumolcs = Desserts(name: "Erdeigyümölcs", price: "400")


//MARK: - DessertViews in TabView

struct TableViewDesserts: View {
    
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
            
            LinearGradient(gradient: Gradient(colors: [.orange, .brown]), startPoint: .topLeading, endPoint: .bottomLeading)
                .rotationEffect(.degrees(244))
            
            GeometryReader { geometry in
                ScrollView{
                    
                    TiramisuView()
                    
                    SomloiGaluskaView()
                    
                    ProfiterolView()
                    
                    AmcsiPancsi()
                    
                    Turospalacsinta()
                    
                    ErdeigyumolcsView()
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
    
        
struct TableViewDesserts_Previews: PreviewProvider {
    static var previews: some View {
        TableViewDesserts()
    }
}






