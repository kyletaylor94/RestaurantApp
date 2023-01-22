//
//  TableViewDrinks.swift
//  restaurantSwiftUI
//
//  Created by Turdesán Csaba on 2023. 01. 04..
//

import SwiftUI

//MARK: - Sharing DrinkCount Datas to AddtocartView

class DrinksGlobal: ObservableObject{
    @Published var colacounter = 0
    @Published var pepsicounter = 0
    @Published var fantacounter = 0
    @Published var sevenupcounter = 0
    @Published var kinleycounter = 0
    @Published var borcounter = 0
    
    static let shared = DrinksGlobal()
}

//MARK: - Sharing Datas for DrinkViews: names, prices

struct Drinks{
    var name: String
    var price: String
}

var cola = Drinks(name: "Coca Cola", price: "500")
var pepsi = Drinks(name: "Pepsi", price: "490")
var fanta = Drinks(name: "Fanta", price: "600")
var sevenup = Drinks(name: "SevenUp", price: "550")
var kinley = Drinks(name: "Kinley", price: "500")
var irsaifeherbor = Drinks(name: "Irsai Olivér Fehér bor", price: "1000")


//MARK: - DrinkViews in TabView

struct TableViewDrinks: View {
    
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
   
            LinearGradient(gradient: Gradient(colors: [.black, .cyan]), startPoint: .topLeading, endPoint: .bottomLeading)
                .rotationEffect(.degrees(244))
            
            
            GeometryReader { geometry in
                ScrollView{
                    
                    ColaView()
                    
                    PepsiView()
                    
                    FantaView()
                    
                    SevenUpView()
                    
                    KinleyView()
                    
                    BorView()
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

struct TableViewDrinks_Previews: PreviewProvider {
    static var previews: some View {
        TableViewDrinks()
    }
}





