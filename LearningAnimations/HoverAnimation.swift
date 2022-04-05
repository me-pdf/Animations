//
//  HoverAnimationw.swift
//  LearningAnimations
//
//  Created by Piera Di Fusco on 24/03/22.
//

import SwiftUI

struct HoverAnimation: View {
    @State var isActive = false
    var body: some View {
        Button("Hover"){
            
        }
        .frame(width: 300, height: 90)
        .background(Color.white)
        .cornerRadius(100)
        .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 5)
        .offset(x: 0, y: isActive ? 3 : 0)
        .animation(.easeOut(duration: 0.2))
        .gesture(DragGesture(minimumDistance: 0)
            .onChanged({ _in in
                self.isActive = true
            })
                .onEnded({ _ in
                    self.isActive = false
                })
        
        )
        
        }
    }


struct HoverAnimation_Previews: PreviewProvider {
    static var previews: some View {
        HoverAnimation()
    }
}
