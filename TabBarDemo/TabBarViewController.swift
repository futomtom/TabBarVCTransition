//
//  TabBarViewController.swift
//  TabBarDemo
//
//  Created by alexfu on 9/14/17.
//  Copyright © 2017 alexfu. All rights reserved.
//

import UIKit

// usage:用法:
 

 

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }


}

extension TabBarViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        let customTabBarAnimator = CustomTabBarAnimator()
        customTabBarAnimator.tabBarController = self
        
        return customTabBarAnimator
    }
}
