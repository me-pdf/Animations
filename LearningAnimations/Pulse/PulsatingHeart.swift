//
//  PulsatingHeart.swift
//  LearningAnimations
//
//  Created by Piera Di Fusco on 23/03/22.
//

import SwiftUI

struct PulsatingHeart: View {
    @State var scale: CGFloat = 1

    var body: some View {
//        Circle()
        Image(systemName: "heart.fill")
            .resizable()
            .foregroundColor(.orange)
            .frame(width: 200, height: 200)
            .scaleEffect(scale)
            .onAppear {
                let baseAnimation = Animation.easeInOut(duration: 1)
                let repeated = baseAnimation.repeatForever(autoreverses: true)

                withAnimation(repeated) {
                    scale = 0.8
                }
            }
    }
}

struct PulsatingHeart_Previews: PreviewProvider {
    static var previews: some View {
        PulsatingHeart()
    }
}
