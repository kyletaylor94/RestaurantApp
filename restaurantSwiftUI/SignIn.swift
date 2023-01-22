//
//  SignIn.swift
//  restaurantSwiftUI
//
//  Created by Turdesán Csaba on 2023. 01. 19..
//

import SwiftUI
import FirebaseFirestore
import FirebaseCore
import FirebaseAuth

struct SignInView: View {
   
    @State private var emailFieldSignIn : String = ""
    @State private var passwordFieldSignIn : String = ""
    @State var isLoggedIn = false
    
    @State var loginlabel = "Jelentkezzen be!"
    
 
    func login() {
        Auth.auth().signIn(withEmail: emailFieldSignIn, password: passwordFieldSignIn) { result, error in
            if error != nil {
                print(error!.localizedDescription)
                loginlabel = "Hiba! Próbálja újra!"
            } else {
                print("sign in was successfull")
                isLoggedIn = true
            }
        }
    }
    
    var body: some View {
        ZStack{
        LinearGradient(gradient: Gradient(colors: [.white, .cyan]), startPoint: .leading, endPoint: .trailing)
                .edgesIgnoringSafeArea(.all)
        
            
                Text(loginlabel)
                .lineLimit(1)
                .position(x: 200 , y: 100 )
                .bold()
                .font(.largeTitle)
            
            
            VStack{
                TextField("email",text: $emailFieldSignIn)
                    .background(Color(red: 0.93, green: 0.94, blue: 0.95))
                    .clipShape(Capsule())
                    .frame(width: 300)
                    .shadow(radius: 9)
                    .padding(.vertical)
                
                SecureField("password", text: $passwordFieldSignIn)
                    .background(Color(red: 0.93, green: 0.94, blue: 0.95))
                    .clipShape(Capsule())
                    .shadow(radius: 9)
                    .frame(width: 300)
                
                Button{
                    login()
                }
                

            label: {
                    Text("Bejelentkezés")
                        .bold()
                        .italic()
                      
            }
            .buttonStyle(WelcomeButton())
            .shadow(radius: 8)
            .fullScreenCover(isPresented: $isLoggedIn){
                MainPage()
                }
            }
        }
    }
}
