//
//  ScaleAndBlurAnimation.swift
//  LearningAnimations
//
//  Created by Piera Di Fusco on 23/03/22.
//

import SwiftUI

struct ScaleAndBlurAnimation: View {
    @State private var animationCount = 1.0
    var body: some View {
        Button("Tap Me!"){
            animationCount += 1
        }
        .padding(50)
        .background(.orange)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationCount)
        .blur(radius: (animationCount - 1) * 3)
        .animation(.interpolatingSpring(stiffness: 50, damping: 1), value: animationCount)
        
        
        
    }
}

struct ScaleAndBlurAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ScaleAndBlurAnimation()
    }
}
