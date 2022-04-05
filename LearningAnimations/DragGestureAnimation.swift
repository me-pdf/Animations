//
//  DragGestureAnimation.swift
//  LearningAnimations
//
//  Created by Piera Di Fusco on 23/03/22.
//

import SwiftUI

struct DragGestureAnimation: View {
    let letters = Array("I Love Animations")
    @State private var enabled: Bool = false
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        
         HStack(spacing: -9) {
            
            ForEach(0..<letters.count){ num in
            
                Text(String(letters[num]))
                .padding(5)
                .font(.title)
                .foregroundColor(Color.orange)
                .offset(dragAmount)
                .animation(
                    .default.delay(Double(num) / 20),
                    value: dragAmount
                )
            }
        }
        .gesture(
            DragGesture()
                .onChanged{ dragAmount = $0.translation}
                .onEnded { _ in
                    dragAmount = .zero
                    enabled.toggle()
                }
        )
    }
}

struct DragGestureAnimation_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureAnimation()
    }
}
