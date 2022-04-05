//
//  AnimationCollection.swift
//  LearningAnimations
//
//  Created by Piera Di Fusco on 04/04/22.
//

import SwiftUI

struct AnimationCollection: View {
    var body: some View {
        NavigationView {
            List{
               

            NavigationLink(destination: ChangingObjectAnimation()) { Text("Changing Object") }
                
            NavigationLink(destination: MovingObjectAnimation()) { Text("Moving Object") }
                
                NavigationLink(destination: ScaleAndBlurAnimation()) { Text("Scale and Blur") }
                
            NavigationLink(destination: PulseEffect()) { Text("Pulse") }
                
            NavigationLink(destination: DeletingAnimation()) { Text("Delete Animation") }
                
            NavigationLink(destination: CardAnimation()) { Text("Cards") }
                
            NavigationLink(destination: SpinningAnimation()) { Text("Spinning Object") }
                
            NavigationLink(destination: DragGestureAnimation()) { Text("Drag Animation") }
                
            NavigationLink(destination: TransitionView()) { Text("Transition Animation") }
                
            NavigationLink(destination: HoverAnimation()) { Text("Hover Animation") }
                
                
            
                
            }.listStyle(.automatic)
                
                .navigationTitle("Animations:")
                
                .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.automatic)
            }
    }
}

struct AnimationCollection_Previews: PreviewProvider {
    static var previews: some View {
        AnimationCollection()
    }
}
