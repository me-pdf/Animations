////
////  CardRotatesAnimation.swift
////  LearningAnimations
////
////  Created by Piera Di Fusco on 24/03/22.
////
//
//import SwiftUI
//
//struct CardRotatesAnimation: View {
//    var body: some View {
//        Card(front: {
//            Text("Front")
//        }, back: {
//            Text("Back")
//        })
//    }
//}
//
//struct Card<Front, Back>: View where Front:View, Back:View{
//    var front: () -> Front
//    var back: () -> Back
//    
//    @State var flipped: Bool = false
//    @State var cardRotation = 0.0
//    @State var contentRotation = 0.0
//    
//    init(@ViewBuilder front: @escaping () -> Front, @ViewBuilder back: @escaping () -> Back
//    {
//        self.front = front
//        self.back = back
//    }
//    
//    var body: some View{
//        ZStack {
//            if flipped{
//            back() }
//            else{
//                front()
//            }
//        }
//        
//        .rotation3DEffect(.degrees(contentRotation), axis: (x: 0, y: 1, z: 0))
//        .padding()
//        .frame(height: 200)
//        .frame(maxWidth: .infinity)
//        .background(Color.white)
//        .overlay(
//            Rectangle()
//                .stroke(Color.black, lineWidth: 2)
//        )
//        .padding()
//        .onTapGesture {
////
//        }
//        .rotation3DEffect(.degrees(cardRotation), axis: (x: 0, y: 1, z: 0))
//    }
//    
//    func flipCard(){
//        let animationTime = 5.0
//        withAnimation(Animation.linear(duration: animationTime)){
//            cardRotation += 180
//        }
//        withAnimation(Animation.linear(duration: 0.001).delay(animationTime / 2)){
//            contentRotation += 180
//            flipped.toggle()
//        }
//    }
//    
//}
//
//
//struct CardRotatesAnimation_Previews: PreviewProvider {
//    static var previews: some View {
//        CardRotatesAnimation()
//    }
//}
