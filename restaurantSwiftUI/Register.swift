//
//  Register.swift
//  restaurantSwiftUI
//
//  Created by Turdesán Csaba on 2022. 12. 31..
//

import SwiftUI
import FirebaseFirestore
import FirebaseCore
import FirebaseAuth

struct Register: View {
    
    @State var regisztraljon = "Regisztráljon!"
    
    @State private var emailField: String = ""
    @State private var passwordField: String = ""
    
     func newUser(){
        Auth.auth().createUser(withEmail: emailField, password: passwordField) { result, error in
            if error != nil {
                print(error!.localizedDescription)
                regisztraljon = "Probléma a regisztrációval!"
            } else {
                print("everythings ok")
                regisztraljon = "Regisztráció sikeres!"
            }
        }
    }
    
    var body: some View{
        ZStack{
            
            LinearGradient(gradient: Gradient(colors: [.gray, .red]), startPoint: .bottomLeading, endPoint: .topLeading)
                .edgesIgnoringSafeArea(.all)
        
            VStack{
                Text(regisztraljon)
                    .font(.title2)
                    .bold()
                    .lineLimit(1)
                
                    .frame(width: 230 ,height: 200)
                    .position(x: 200 , y: 90)
                
                
                TextField("email..", text: $emailField)
                    .tint(Color.blue)
                    .background(Color(red: 0.93, green: 0.94, blue: 0.95))
                    .clipShape(Capsule())
                    .frame(width: 350, height: 200)
                    .position(x: 200 , y: 10 )
                SecureField("password..", text: $passwordField)
                    .background(Color(red: 0.93, green: 0.94, blue: 0.95))
                    .clipShape(Capsule())
                    .frame(width: 320, height: 200)
                    .position(x: 200 , y: -100)
                Button {
                    newUser()
                    
                }
            label: {
                    Text("Regisztráció")
                    .foregroundColor(Color.black)
                }
                .buttonStyle(WelcomeButton())
                .shadow(radius: 7)
                .frame(width: 800, height: 100)
                .position(x: 190 , y: -150 )
                
                }
            }
        }
    }
