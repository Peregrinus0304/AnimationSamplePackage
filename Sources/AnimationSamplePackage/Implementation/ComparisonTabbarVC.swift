//
//  ComparisonTabbarVC.swift
//  AnimationsDemo
//
//  Created by TarasPeregrinus on 14.10.2022.
//

import UIKit
import SwiftUI
public class ComparisonTabbarVC: UITabBarController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        changeTabsAppearance()
        setupTabs()
    }
    
    func setupTabs() {
        // Create Tab one
        let swiftUIView = SwiftUIAnimationsStack()
        var swiftUIViewController: UIViewController
        if #available(iOS 13.0, *) {
            swiftUIViewController = UIHostingController(rootView: swiftUIView)
            swiftUIViewController.view.backgroundColor = .white
            swiftUIViewController.addAnimationsStack()
        } else {
            swiftUIViewController = UIViewController()
        }
        let tabOne = swiftUIViewController
        let tabOneBarItem = UITabBarItem(title: "SwiftUI", image: nil, selectedImage: nil)
        
        tabOne.tabBarItem = tabOneBarItem
        
        // Create Tab two
        let tabTwo = UIViewController()
        tabTwo.view.backgroundColor = .white
        tabTwo.addAnimationsStack()
        let tabTwoBarItem2 = UITabBarItem(title: "UIKit", image: nil, selectedImage: nil)
        
        tabTwo.tabBarItem = tabTwoBarItem2
        
        self.viewControllers = [tabOne, tabTwo]
    }
    
    private func changeTabsAppearance() {
        let fontDict = [NSAttributedString.Key.font : UIFont(name: "American Typewriter", size: 16.0)!]
        
        UITabBarItem.appearance().setTitleTextAttributes(fontDict, for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes(fontDict, for: .selected)
        UITabBar.appearance().unselectedItemTintColor = .darkGray
        UITabBar.appearance().tintColor = .blue
    }
}
