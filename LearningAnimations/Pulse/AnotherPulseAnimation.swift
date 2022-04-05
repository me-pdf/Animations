//
//  AnotherPulseAnimation.swift
//  LearningAnimations
//
//  Created by Piera Di Fusco on 24/03/22.
//

import SwiftUI

struct AnotherPulseAnimation: View {
    @State var animate = false
    var body: some View {
        ZStack{
            Circle().fill(Color.orange.opacity(0.25)).frame(width: 350, height: 350).scaleEffect(self.animate ? 1 : 0)
            Circle().fill(Color.orange.opacity(0.35)).frame(width: 250, height: 250).scaleEffect(self.animate ? 1 : 0)
            Circle().fill(Color.orange.opacity(0.45)).frame(width: 150, height: 150).scaleEffect(self.animate ? 1 : 0)
            Circle().fill(Color.orange).frame(width: 30, height: 30)
        }.onAppear(){
            self.animate.toggle()
        }
        .animation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: true))
    }
}

struct AnotherPulseAnimation_Previews: PreviewProvider {
    static var previews: some View {
        AnotherPulseAnimation()
    }
}
