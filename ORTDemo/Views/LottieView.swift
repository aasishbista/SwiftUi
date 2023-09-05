//
//  LottieView.swift
//  ORTDemo
//
//  Created by ebpearls on 08/05/2023.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {

    let name: String
    
//    let loopmode: LottieLoopMode
//
//    let animationSpeed: CGFloat
    
    init(name: String){
        self.name = name
//        self.loopmode = loopmode
//        self.animationSpeed = animationSpeed
    }
    
    func makeUIView(context: Context) -> UIView {
         
        let view = UIView(frame: .zero)
         
        let lottieAnimationView = LottieAnimationView(name: name)
        lottieAnimationView.contentMode = .scaleAspectFit
        lottieAnimationView.loopMode = .loop
        lottieAnimationView.play()
         
        lottieAnimationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lottieAnimationView)
         
        NSLayoutConstraint.activate([
            lottieAnimationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            lottieAnimationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            lottieAnimationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lottieAnimationView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
         
        return view
      }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}

struct LottieViewPreview: PreviewProvider {
    static var previews: some View {
        LottieView(name: "bpm")
            .padding()
    }
    
}
