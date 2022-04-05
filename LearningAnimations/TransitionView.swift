//
//  TransitionView.swift
//  LearningAnimations
//
//  Created by Piera Di Fusco on 23/03/22.
//

import SwiftUI

struct TransitionView: View {
    @State private var showComponent = false

    var body: some View {
        VStack{
            Button("Tap Me"){
                withAnimation{
                    showComponent.toggle()
                }
            }
            if showComponent {
                Rectangle()
                    .fill(.black)
                    .frame(width: 100, height: 100)
                    .transition(.scale)
            }
            
        }
    }
}

struct TransitionView_Previews: PreviewProvider {
    static var previews: some View {
        TransitionView()
    }
}
