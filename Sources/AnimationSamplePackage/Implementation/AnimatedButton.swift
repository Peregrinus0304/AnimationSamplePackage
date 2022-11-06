//
//  AnimatedButton.swift
//  AnimationsDemo
//
//  Created by TarasPeregrinus on 09.10.2022.
//

import UIKit

public final class AnimatedButton: UIButton {
    
    private var type: AnimationType
    private var selectedText: String
    
    private let colors: [UIColor] = [.red, .gray, .green, .yellow, .blue].shuffled()
    
    init(animationType: AnimationType) {
        type = animationType
        selectedText = "\(type)"
        super.init(frame: .zero)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUp() {
        self.layer.cornerRadius = 10
        self.setTitle(selectedText, for: .normal)
        self.backgroundColor = .systemMint
        self.setTitleColor(.white, for: .normal)
        self.addTarget(self, action: #selector(onPress), for: .touchUpInside)
    }
    
    @objc func onPress() {
        switch type {
            case .alphaChange: alphaChangeAnimation()
            case .sliding: slidingAnimation()
            case .colorChange: colorChangeAnimation()
            case .dimensional: dimensionalAnimation()
            case .rotation: rotationAnimation()
            case .scaling: scalingAnimation()
        }
    }
}

// MARK: - Animations

extension AnimatedButton {
    
    func animateButton(animation: @escaping ()->(), completion: @escaping ()->()) {
        let duration = 1.0
        let delay = 0.2
        UIView.animate(withDuration: duration, delay: delay) {
            animation()
        } completion: { _ in
            UIView.animate(withDuration: duration, delay: delay) {
                completion()
            }
        }
    }
    
    func alphaChangeAnimation() {
        animateButton {
            self.alpha = 0
        } completion: {
            self.alpha = 1
        }
    }
    
    func scalingAnimation() {
        animateButton {
            self.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        } completion: {
            self.transform = .identity
        }
    }
    
    func rotationAnimation() {
        animateButton {
            self.transform = CGAffineTransform(rotationAngle: (180.0 * .pi) / 180.0)
        } completion: {
            self.transform = .identity
        }
    }
    
    func colorChangeAnimation() {
        animateButton {
            self.backgroundColor = self.colors.randomElement() ?? .systemMint
        } completion: {
            self.backgroundColor = .systemMint
        }
    }
    
    func slidingAnimation() {
        let currentX = self.frame.origin.x
        animateButton {
            self.frame.origin.x = -(self.frame.width * 2)
        } completion: {
            self.frame.origin.x = currentX
        }
    }
    
    func dimensionalAnimation() {
        // TODO: Have not found the way how to do it in UIKit yet.
    }
}
