//
//  UIVIewController+AnimationsStack.swift
//  AnimationsDemo
//
//  Created by TarasPeregrinus on 14.10.2022.
//

import UIKit

extension UIViewController {
    
    func addAnimationsStack() {
        let stackView = createStackView()
        view.addSubview(stackView)
        
        AnimationType.allCases.forEach {
            let button = AnimatedButton(animationType: $0)
            stackView.addArrangedSubview(button)
        }
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            stackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 50),
            stackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -50)
        ])
    }
}

fileprivate func createStackView() -> UIStackView {
    let stackView = UIStackView()
    stackView.alignment = .fill
    stackView.spacing = 30
    stackView.axis = .vertical
    stackView.distribution = .equalCentering
    return stackView
}
