//
//  LottieView.swift
//  restaurantSwiftUI
//
//  Created by Turdesán Csaba on 2023. 01. 19..
//

import SwiftUI
import Lottie


struct LottieView: UIViewRepresentable {
    
    typealias UIViewType = UIView
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        
        let view = UIView(frame: .zero)
        
        let animationView = LottieAnimationView()
        let animation = LottieAnimation.named("102780-cateringfork-knife")
        animationView.frame = CGRect(x: 0 , y:0 , width: 100, height: 100 )
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .loop
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: -260),
            animationView.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 20)
                                    ])
        return view
    }
    
    func updateUIView(_ uiView: UIView, context:
                      UIViewRepresentableContext<LottieView>) {

    }
}

struct WelcomeLottieView: UIViewRepresentable {
    
    
    typealias UIViewType = UIView
    
    func makeUIView(context: UIViewRepresentableContext<WelcomeLottieView>) -> UIView {
        let view = UIView(frame: .zero)
        
        let animationView = LottieAnimationView()
        let animation = LottieAnimation.named("99279-preparing-food")
        animationView.animation = animation
        animationView.contentMode = .center
        animationView.loopMode = .loop
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalToConstant: 400),
            animationView.heightAnchor.constraint(equalToConstant: 400)
        ])

        return view
    }

    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<WelcomeLottieView>) {
        
    }
    

}
  
