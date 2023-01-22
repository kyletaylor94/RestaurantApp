//
//  AddToCartView.swift
//  restaurantSwiftUI
//
//  Created by Turdesán Csaba on 2023. 01. 12..
//

import SwiftUI
import UIKit

import FirebaseFirestore
import FirebaseCore
import FirebaseAuth


struct AddtoCartView: View{
    
    @State var finalView = false
    
    //MARK: - foodcounter datas from TabViews
    //SoupPublished
    var hagymalevescounter =  GlobalSoup.shared.hagymacounter
    var erolevescounter = GlobalSoup.shared.erocounter
    var csontlevescounter = GlobalSoup.shared.csontcounter
    var brokkolilevescounter = GlobalSoup.shared.brokkolicounter
    var gyumolcslevescounter = GlobalSoup.shared.gyumolcscounter
    var gulyaslevescounter = GlobalSoup.shared.gulyascounter
    
    //AppertizerPublished
    var husgomboccounter = AppertizerGlobal.shared.husgomboc
    var cordonbleucounter = AppertizerGlobal.shared.cordonbleu
    var cezarsalatacounter = AppertizerGlobal.shared.cezarsalata
    var rantottsajtcounter = AppertizerGlobal.shared.rantottsajt
    var rantottkarfiolcounter = AppertizerGlobal.shared.rantottkarfiol
    var beacontekerecscounter = AppertizerGlobal.shared.beacontekercs
    
    //DinnerPublished
    var pizzacounter = DinnerGlobal.shared.pizzacounter
    var hamburgercounter = DinnerGlobal.shared.hamburgercounter
    var tukortojasoshuscounter = DinnerGlobal.shared.tukortojasoshuscounter
    var zoldsegesrizseshuscounter = DinnerGlobal.shared.zoldsegesrizseshuscounter
    var krumplishalcounter = DinnerGlobal.shared.krumplishalcounter
    var sertesporkoltcounter = DinnerGlobal.shared.sertesporkoltcounter
    
    //DessertsPublished
    var tiramisucounter = DessertsGlobal.shared.tiramisucounter
    var somloicounter = DessertsGlobal.shared.somloicounter
    var profiterolcounter = DessertsGlobal.shared.profiterolcounter
    var amerikaipalacsintacounter = DessertsGlobal.shared.amerikaipalacsintacounter
    var turospalacsintacounter = DessertsGlobal.shared.turospalacsintacounter
    var erdeigyumolcscounter = DessertsGlobal.shared.erdeigyumolcscounter
    
    //DrinksPublished
    var colacounter = DrinksGlobal.shared.colacounter
    var pepsicounter = DrinksGlobal.shared.pepsicounter
    var fantacounter = DrinksGlobal.shared.fantacounter
    var sevenupcounter = DrinksGlobal.shared.sevenupcounter
    var kinleycounter = DrinksGlobal.shared.kinleycounter
    var borcounter = DrinksGlobal.shared.borcounter
    
    
    //MARK: - finalprice calculation
    struct Dish: Hashable {
        var name: String
        var count: Int
        var price: Int
    }
    
    
    func calculateTotalPrice(dishes: [Dish]) -> Int {
        var totalPrice = 0
        for dish in dishes {
            totalPrice += dish.price
        }
        return totalPrice
    }
    
    
    //MARK: - Send datas to the Firebase Database
    
    func addDishesToFirestore(dishes: [Dish]) {
        
        let db = Firestore.firestore()
        let user = Auth.auth().currentUser
        var totalPrice = 0
        var dishesArray: [[String: Any]] = []
        
        for dish in dishes {
            let dishString = "\(dish.name): \(dish.count)x - \(dish.price)Ft"
            totalPrice += dish.price
            let dishDict = ["dishName": dish.name, "dishCount": dish.count, "dishPrice": dish.price, "dishString": dishString] as [String : Any]
            dishesArray.append(dishDict)
        }
        
        db.collection("Rendelés").document(user?.email ?? "").setData([
            "dishes": dishesArray,
            "totalPrice": totalPrice,
            "userEmail": user?.email ?? ""
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document written successfully")
                finalView = true
                
            }
        }
    }
    //MARK: - AddtoCartView: prices,counts
    var body: some View{
        
        
        let hagymalevesprice = 200 * hagymalevescounter
        let erolevesprice = 400 * erolevescounter
        let csontlevesprice = 600 * csontlevescounter
        let brokkolilevesprice = 900 * brokkolilevescounter
        let gyumolcslevesprice = 400 * gyumolcslevescounter
        let gulyaslevesprice = 400 * gulyaslevescounter
        let husgombocprice = 1000 * husgomboccounter
        let cordonbleuprice = 1200 * cordonbleucounter
        let cezarsalataprice = 900 * cezarsalatacounter
        let rantottsajtprice = 1200 * rantottsajtcounter
        let rantottkarfiolprice = 1150 * rantottkarfiolcounter
        let beacontekercsprice = 1000 * beacontekerecscounter
        let pizzaprice = 2000 * pizzacounter
        let hamburgerprice = 2100 * hamburgercounter
        let tukortojasoshusprice = 2300 * tukortojasoshuscounter
        let zoldsegesrizseshusprice = 2000 * zoldsegesrizseshuscounter
        let krumplishalprice = 2700 * krumplishalcounter
        let sertesporkoltprice = 2500 * sertesporkoltcounter
        let timarisuprice = 700 * tiramisucounter
        let somloiprice = 600 * somloicounter
        let profiterolprice = 900 * profiterolcounter
        let amerikaipalacsintaprice = 700 * amerikaipalacsintacounter
        let turospalacsintaprice = 1000 * turospalacsintacounter
        let erdeigyumolcsprice = 400 * erdeigyumolcscounter
        let colaprice = 500 * colacounter
        let pepsiprice = 490 * pepsicounter
        let fantaprice = 600 * fantacounter
        let sevenupprice = 550 * sevenupcounter
        let kinleyprice = 500 * kinleycounter
        let borprice = 1000 * borcounter
        
        
        let dishes = [Dish(name: "Hagymaleves", count: hagymalevescounter, price: hagymalevesprice),
                      Dish(name: "Erőleves", count: erolevescounter, price: erolevesprice),
                      Dish(name: "Csontleves", count: csontlevescounter, price: csontlevesprice),
                      Dish(name: "brokkolileves", count: brokkolilevescounter, price: brokkolilevesprice),
                      Dish(name: "Gulyásleves", count: gulyaslevescounter, price: gulyaslevesprice),
                      Dish(name: "Gyümölcsleves", count: gyumolcslevescounter,price: gyumolcslevesprice),
                      Dish(name: "Húsgombóc", count: husgomboccounter,price: husgombocprice),
                      Dish(name: "Cordonbleu", count: cordonbleucounter,price: cordonbleuprice),
                      Dish(name: "Cézársaláta", count: cezarsalatacounter,price: cezarsalataprice),
                      Dish(name: "Rántottsajt", count: rantottsajtcounter,price: rantottsajtprice),
                      Dish(name: "RántottKarfiol", count: rantottkarfiolcounter,price: rantottkarfiolprice),
                      Dish(name: "BeaconTekercs", count: beacontekerecscounter,price: beacontekercsprice),
                      Dish(name: "Pizza", count: pizzacounter, price: pizzaprice),
                      Dish(name: "Hamburger", count: hamburgercounter,price: hamburgerprice),
                      Dish(name: "Tükörtojásoshús", count: tukortojasoshuscounter, price: tukortojasoshusprice),
                      Dish(name: "Zöldségesrizseshús", count: zoldsegesrizseshuscounter, price: zoldsegesrizseshusprice),
                      Dish(name: "Krumplishal", count: krumplishalcounter, price: krumplishalprice),
                      Dish(name: "Sertéspörkölt", count: sertesporkoltcounter, price: sertesporkoltprice),
                      Dish(name: "Tiramisu", count: tiramisucounter, price: timarisuprice),
                      Dish(name: "Somlóigaluska", count: somloicounter, price: somloiprice),
                      Dish(name: "Profiterol", count: profiterolcounter, price: profiterolprice),
                      Dish(name: "Amerikai palacsinta", count: amerikaipalacsintacounter, price: amerikaipalacsintaprice),
                      Dish(name: "Túrospalacsinta", count: turospalacsintacounter, price: turospalacsintaprice),
                      Dish(name: "Erdeigyümölcs", count: erdeigyumolcscounter, price: erdeigyumolcsprice),
                      Dish(name: "Cola", count: colacounter, price: colaprice),
                      Dish(name: "Pepsi", count: pepsicounter, price: pepsiprice),
                      Dish(name: "Fanta", count: fantacounter, price: fantaprice),
                      Dish(name: "SevenUp", count: sevenupcounter, price: sevenupprice),
                      Dish(name: "Kinley", count: kinleycounter, price: kinleyprice),
                      Dish(name: "Bor", count: borcounter, price: borprice)
        ]
        
        
        ZStack{
            Color(red: 0.96, green: 0.96, blue: 1.1)
            
            LinearGradient(gradient: Gradient(colors: [.gray, .red]), startPoint: .topLeading, endPoint: .bottomLeading)
                .rotationEffect(.degrees(0))
            
            LinearGradient(gradient: Gradient(colors: [.blue, .gray]), startPoint: .bottomLeading, endPoint: .topLeading)
                .rotationEffect(.degrees(0))
            
            if hagymalevescounter == 0 && erolevescounter == 0 && csontlevescounter == 0 && brokkolilevescounter == 0 && gyumolcslevescounter == 0 && gulyaslevescounter == 0 && husgomboccounter == 0 && cordonbleucounter == 0 && rantottsajtcounter == 0 && rantottkarfiolcounter == 0 && cezarsalatacounter == 0 && beacontekerecscounter == 0 && pizzacounter == 0 && hamburgercounter == 0 && tukortojasoshuscounter == 0 && zoldsegesrizseshuscounter == 0 && krumplishalcounter == 0 && sertesporkoltcounter == 0 && tiramisucounter == 0 && somloicounter == 0 && profiterolcounter == 0 && amerikaipalacsintacounter == 0 && turospalacsintacounter == 0 && erdeigyumolcscounter == 0 && colacounter == 0 && pepsicounter == 0 && fantacounter == 0 && sevenupcounter == 0 && kinleycounter == 0 && borcounter == 0{
                
                VStack{
                    Text("A kosár tartalma üres!")
                    
                }
            }
            
            let totalprice = calculateTotalPrice(dishes: dishes)
            let dishesWithCount = dishes.filter { $0.count > 0 }
            
            GeometryReader{ geometry in
                ScrollView{
                    ForEach(dishesWithCount, id: \.self) { dish in
                        VStack {
                            let dish = ("\(dish.name): \(dish.count)x - \(dish.price)Ft")
                            Text(dish)
                        }
                    }
                }
                VStack {
                    Button{
                        addDishesToFirestore(dishes: dishesWithCount)
                    }
                label:{
                    Text("Rendelés elküldése")
                }.buttonStyle(WelcomeButton()).lineLimit(1)
                        .fullScreenCover(isPresented: $finalView){
                            FinalView()}
                    Text("Összesen: \(totalprice)Ft")
                }.position(x: geometry.size.width - 190, y: geometry.size.height - 120)
            }
        }.ignoresSafeArea(.all)
    }
}







