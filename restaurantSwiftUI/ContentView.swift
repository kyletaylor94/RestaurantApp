//
//  ContentView.swift
//  restaurantSwiftUI
//
//  Created by Turdesán Csaba on 2022. 12. 30..
//

import SwiftUI
import FirebaseFirestore
import FirebaseCore
import FirebaseAuth


struct ContentView: View {
    
    @State private var SignInView = false
    @State private var Register = false
    @State var isLoggedIn = false
            
     var body: some View{
     
             ZStack{
                 
                 LinearGradient(gradient: Gradient(colors: [.white, .green]), startPoint: .topLeading, endPoint: .bottomLeading)
                     .edgesIgnoringSafeArea(.all)
                 
                 VStack {
                     Text("Üdvözöljük!")
                         .lineLimit(1)
                         .font(.largeTitle)
                         .bold()
                     
                 }
                 .position(x:185, y: 100)
                 .padding()
                 WelcomeLottieView()
                     .position(x: 200 ,y: 550)
              
                 
                 VStack {
                     Button(action: {
                         self.SignInView = true
                     }) {
                         Text("Bejelentkezés")
                     }
                     .sheet(isPresented: $SignInView) {
                         restaurantSwiftUI.SignInView()}
                     .buttonStyle(WelcomeButton())
                     .font(.title)
                     
                     
                     Button(action: {
                         self.Register = true
                         
                     }) {
                         Text("Regisztráció")
                     }
                     .sheet(isPresented: $Register){
                         restaurantSwiftUI.Register()}
                     .buttonStyle(WelcomeButton())
                     .font(.title.italic())
                    
                    }.position(x: 200 , y: 600 )
                }
            }
        }

        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }
        
  //MARK: - Home page buttonstyles
     

//MARK: - Register Page
//Register()
 

    

//MARK: - Sign in Page

//signin()

//MARK: - AFTER SIGN IN ( MAIN PAGE - Tabviews)

struct MainPage: View {
    
    var body: some View {
        ZStack{
  
            TabBar().position(x: 195 , y: 400)
                
            }.ignoresSafeArea(.all)
        }
    }

struct TabBar: View {

    var body: some View{
        
            VStack{
            
                TabView() {
                
                    TabViewSoup().tabItem() {
                        Label("Levesek", image: "soup")
                    }
                    
                    TableViewAppertizer().tabItem(){
                        Label("Előételek", image: "appertizer")
                    }
                    
                    TableViewdinner().tabItem(){
                        Label("Főételek", image: "dinner")
                    }
                    
                    TableViewDesserts().tabItem(){
                        Label("Desszertek", image: "desserts")
                    }
                   
                    TableViewDrinks().tabItem(){
                        Label("Italok", image: "drink")
                    }
                }
            }
        }
    }


