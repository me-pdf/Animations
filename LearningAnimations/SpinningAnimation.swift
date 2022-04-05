//
//  SpinningAnimation.swift
//  LearningAnimations
//
//  Created by Piera Di Fusco on 23/03/22.
//

import SwiftUI

struct SpinningAnimation: View {
    @State private var animationCount = 0.0
    var body: some View {
        Button("Spin Me"){
            withAnimation{
                animationCount += 360
            }
        }
        .padding(50)
        .background(.orange)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationCount), axis: (x: 0, y: 1, z: 0))
    }
}

struct SpinningAnimation_Previews: PreviewProvider {
    static var previews: some View {
        SpinningAnimation()
    }
}
