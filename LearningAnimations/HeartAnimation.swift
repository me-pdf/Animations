//
//  HeartAnimation.swift
//  LearningAnimations
//
//  Created by Piera Di Fusco on 23/03/22.
//

import SwiftUI

struct HeartAnimation: View {
    @State private var animationCount = 1.0
    var body: some View {
        ZStack {

                Image(systemName: "heart.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.red)
                    .scaleEffect(animationCount)
                    .animation(
                        .easeInOut(duration: 1)
                            .delay(0.2)
                            .repeatForever(autoreverses: true),
                        value: animationCount)
                    .onAppear {
                        animationCount = 1.2
       
                            
                        
                    }
            }
    }
}

struct HeartAnimation_Previews: PreviewProvider {
    static var previews: some View {
        HeartAnimation()
    }
}
