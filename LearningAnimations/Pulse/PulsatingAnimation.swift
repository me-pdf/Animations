//
//  PulsatingAnimation.swift
//  LearningAnimations
//
//  Created by Piera Di Fusco on 23/03/22.
//

import SwiftUI

struct PulsatingAnimation: View {
    @State private var animationCount = 0.1
    var body: some View {
        Button("Pulse"){
            
        }
        .padding(50)
        .background(.orange)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(.orange)
                .scaleEffect(animationCount)
                .opacity(2 - animationCount)
                .animation(.easeInOut(duration: 1).repeatForever(autoreverses: false), value: animationCount)
            )
        .onAppear{
            animationCount = 2
        }
    }
}

struct PulsatingAnimation_Previews: PreviewProvider {
    static var previews: some View {
        PulsatingAnimation()
    }
}
