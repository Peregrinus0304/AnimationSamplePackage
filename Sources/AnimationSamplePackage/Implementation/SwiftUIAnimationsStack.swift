//
//  SwiftUIAnimationsStack.swift
//  AnimationsDemo
//
//  Created by TarasPeregrinus on 13.10.2022.
//

import SwiftUI

struct SwiftUIAnimationsStack: View {
    let animations = AnimationType.allCases
    var body: some View {
        VStack {
            ForEach(animations, id: \.self) { animation in
                SwiftUIAnimatedButtonView(type: animation)
                    .padding()
            }
        }
        .background(.white)
    }
}

struct SwiftUIAnimationsStack_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIAnimationsStack()
    }
}
