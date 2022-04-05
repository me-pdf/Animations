//
//  ContentView.swift
//  LearningAnimationsf
//
//  Created by Piera Di Fusco on 23/03/22.
//

import SwiftUI

struct ChangingObjectAnimation: View {

    @State var isAnimated: Bool = false
    var body: some View {
        VStack{
            Button("Animate"){
                withAnimation(
//                    .spring(response: 1, dampingFraction: 0, blendDuration: 1)
                    .easeOut(duration: 2.0).repeatForever(autoreverses: true)
                ){
                    isAnimated.toggle()
                }
            }.padding(.top, 32)
            Spacer()
            RoundedRectangle(cornerRadius: isAnimated ? 50 : 25)
                .fill(isAnimated ? Color.red : Color.orange)
                .frame(
                    width: isAnimated ? 100 : 300,
                    height: isAnimated ? 100 : 300,
                    alignment: isAnimated ? .leading : .trailing)
                .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
                .offset(y: isAnimated ? 300 : 0)
            Spacer()
        }
       
    }
}

struct ChangingObjectAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ChangingObjectAnimation()
    }
}
