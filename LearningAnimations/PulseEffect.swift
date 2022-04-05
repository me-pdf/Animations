//
//  PulseEffect.swift
//  LearningAnimations
//
//  Created by Piera Di Fusco on 05/04/22.
//

import SwiftUI

struct PulseEffect: View {
    var body: some View {
        ScrollView(showsIndicators: false){
        VStack{
            
            PulsatingHeart()
                .padding(50)
            PulsatingAnimation()
                .padding(50)
            AnotherPulseAnimation()
        }
    }
    }
}

struct PulseEffect_Previews: PreviewProvider {
    static var previews: some View {
        PulseEffect()
    }
}
