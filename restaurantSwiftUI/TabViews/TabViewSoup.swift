//
//  TabViewSoup.swift
//  restaurantSwiftUI
//
//  Created by Turdesán Csaba on 2023. 01. 04..
//



import SwiftUI

//MARK: - Sharing soupcounters data to AddToCartView
class GlobalSoup: ObservableObject{
    @Published var hagymacounter = 0
    @Published var gulyascounter = 0
    @Published var erocounter = 0
    @Published var csontcounter = 0
    @Published var gyumolcscounter = 0
    @Published var brokkolicounter = 0
    

    static let shared = GlobalSoup()
}


//MARK: - Datas for SoupViews: names,prices

struct SoupData {
    var name: String
    var price: String
}

var hagymaleves = SoupData(name: "Hagymaleves", price: "200")
var gulyasleves = SoupData(name: "Gulyásleves", price: "400")
var eroleves = SoupData(name: "Erőleves", price: "800")
var csontleves = SoupData(name: "Csontleves", price: "600")
var gyumolcsleves = SoupData(name: "Gyümölcsleves", price: "400")
var brokkolileves = SoupData(name: "Brokkolileves", price: "900")


//MARK: - SoupViews in TabView

struct TabViewSoup: View {
        
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
            
            LinearGradient(gradient: Gradient(colors: [.green, .cyan]), startPoint: .topLeading, endPoint: .bottomLeading)
                .rotationEffect(.degrees(244))
            
            GeometryReader{ geometry in
                ScrollView{
                    HagymalevesView()
                    //
                    GulyasLevesView()
                    
                    ErolevesView()
                    
                    CsontLevesView()
                    
                    BrokkoliLevesView()
                    
                    GyumolcslevesView()
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


struct TabViewSoup_Previews: PreviewProvider {
    static var previews: some View {
        TabViewSoup()
    }
}


                

