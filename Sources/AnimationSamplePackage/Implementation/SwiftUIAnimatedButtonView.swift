//
//  SwiftUIAnimatedButtonView.swift
//  AnimationsDemo
//
//  Created by TarasPeregrinus on 09.10.2022.
//

import SwiftUI

struct SwiftUIAnimatedButtonView: View {
    
    private var type: AnimationType 
    private var selectedText: String
    
    // Animated properties
    @State private var buttonX: CGFloat = .zero
    @State private var opacity: CGFloat = 1.0
    @State private var width: CGFloat = 200
    @State private var height: CGFloat = 70
    @State private var backgroundColor: Color = .mint
    @State private var degrees: CGFloat = .zero
    @State private var scale = false
    @State private var rotate = false
    
    @State private var screenWidth: CGFloat = .zero
    
    var colors: [Color] = [.red, .gray, .green, .yellow, .blue].shuffled()
    
    init(type: AnimationType) {
        self.type = type
        self.selectedText = "\(type)"
    }
    
    var body: some View {
        GeometryReader { reader in
            
            Button(action: {
                animateButton()
            }) {
                Text(selectedText)
                    .padding()
            }
            .foregroundColor(.white)
            .background(backgroundColor)
            .cornerRadius(10)
            .opacity(opacity)
            .frame(width: width, height: height)
            .rotationEffect(.degrees(rotate ? 359 : .zero))
            .scaleEffect(scale ? 1.5 : 1)
            .offset(x: buttonX, y: reader.size.height/2)
            .rotation3DEffect(.degrees(degrees), axis: (x: 1, y: 1, z: 1))
            .onAppear{
                buttonX = reader.size.width/2 - 100
                screenWidth = reader.size.width
            }
        }
        
    }
}

// MARK: - Animations

extension SwiftUIAnimatedButtonView {
    
    func animateButton() {
        switch type {
            case .sliding:
                composedAnimation(animation: {
                    buttonX = -width
                }, completion: {
                    buttonX = screenWidth/2 - 100
                })
            case .alphaChange:
                composedAnimation(animation: {
                    opacity = .zero
                }, completion: {
                    opacity = 1.0
                })
            case .scaling:
                composedAnimation {
                    scale.toggle()
                } completion: {
                    scale.toggle()
                }
            case .rotation:
                composedAnimation {
                    rotate.toggle()
                } completion: {
                    rotate.toggle()
                }
            case .colorChange:
                composedAnimation {
                    backgroundColor = colors.randomElement() ?? .mint
                } completion: {
                    backgroundColor = .mint
                }
            case .dimensional:
                composedAnimation {
                    degrees += 359
                } completion: {
                    degrees = .zero
                }
        }
    }
    
    func composedAnimation(animation: @escaping ()->(), completion: @escaping ()->()) {
        
        let duration = 1.0
        let delay = 0.2
        
        withAnimation(Animation
            .easeInOut(duration: duration)
            .delay(delay)) {
                animation()
            }
        
        withAnimation(Animation
            .easeInOut(duration: duration)
            .delay(delay + duration)) {
                completion()
            }
    }
}

struct SwiftUIAnimatedButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIAnimatedButtonView(type: .dimensional)
    }
}

