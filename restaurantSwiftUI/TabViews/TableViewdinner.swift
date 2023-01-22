//
//  TableViewdinner.swift
//  restaurantSwiftUI
//
//  Created by Turdesán Csaba on 2023. 01. 04..
//



import SwiftUI

//MARK: - Sharing Dinnercounter Data to AddtocartView

class DinnerGlobal:ObservableObject{
    @Published var pizzacounter = 0
    @Published var hamburgercounter = 0
    @Published var tukortojasoshuscounter = 0
    @Published var zoldsegesrizseshuscounter = 0
    @Published var sertesporkoltcounter = 0
    @Published var krumplishalcounter = 0
    
    static let shared = DinnerGlobal()
}

//MARK: - Sharing Datas for DinnerViews: names, prices

struct Dinner {
    var name: String
    var price: String
}

var pizza = Dinner(name: "Pizza", price: "2000")
var hambi = Dinner(name: "Kézműves Hamburger", price: "2100")
var tukortojasoshus = Dinner(name: "Tükörtojásos-Csirkemell", price: "2300")
var zoldsegesrizseshus = Dinner(name: "Zöldséges Rizses Hús", price: "2000")
var sertesporkolt = Dinner(name: "Sertés Pörkölt", price: "2500")
var krumplishal = Dinner(name: "Krumplis Hal", price: "2700")

//MARK: - DinnerViews in TabView


struct TableViewdinner: View {
    
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
            
            LinearGradient(gradient: Gradient(colors: [.red, .yellow]), startPoint: .topLeading, endPoint: .bottomLeading)
                .rotationEffect(.degrees(244))
            
            GeometryReader{ geometry in
                ScrollView{
                    
                    PizzaView()
                    
                    HambiView()
                    
                    TukotojasosCsirkemellView()
                    
                    ZoldsegesRizsesHusView()
                    
                    SertesPorkoltView()
                    
                    KrumplishalView()
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

struct TableViewdinner_Previews: PreviewProvider {
    static var previews: some View {
        TableViewdinner()
    }
}







  

   

  
    

   
