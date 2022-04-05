//
//  DeletingAnimation.swift
//  LearningAnimations
//
//  Created by Piera Di Fusco on 24/03/22.
//

import SwiftUI

    struct DeletingAnimation: View {
        @State var ContentArray = ["One","Two","Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"]
        var body: some View {
            ScrollView{
            VStack{
                ForEach(Array(ContentArray.enumerated()), id: \.element){ (i, item) in // << 1) !
                    ZStack{
                    // Object
                        Text(item)
                            .foregroundColor(.white)
                            .font(.title)
                        .frame(width:200,height:200)
                        .background(Color.orange)
                        .cornerRadius(20)
                        .padding()
                    //Delete button
                        Button(action: {
                           withAnimation { () -> () in              // << 2) !!
                               self.ContentArray.remove(at: i)
                           }
                        }){
                        Text("✕")
                        .foregroundColor(.white)
                        .frame(width:40,height:40)
                        .background(Color.red)
                        .cornerRadius(100)
                        }.offset(x: 65,y:-65)
                    }.transition(AnyTransition.scale)              // << 3) !!!
               }
             }
           }
       }
    }

struct DeletingAnimation_Previews: PreviewProvider {
    static var previews: some View {
        DeletingAnimation()
    }
}
