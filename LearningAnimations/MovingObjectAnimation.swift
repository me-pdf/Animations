//
//  MovingObjectAnimation.swift
//  LearningAnimations
//
//  Created by Piera Di Fusco on 24/03/22.
//

import SwiftUI

struct MovingObjectAnimation: View {
    @State private var isPressed = false
    var body: some View {
        Button("MOVE ME"){
            isPressed.toggle()
        }
        .padding(50)
        .background(.orange)
        .foregroundColor(.white)
        .clipShape(Circle())
//        .frame(width: 100,
//               height: 100)
        
        .offset(x: isPressed ? 100 : -100, y: 0)
        .animation(.default.delay(0.1), value: isPressed)
        
    }
}

struct MovingObjectAnimation_Previews: PreviewProvider {
    static var previews: some View {
        MovingObjectAnimation()
    }
}
