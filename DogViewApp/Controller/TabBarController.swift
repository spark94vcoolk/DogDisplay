//
//  TabBarController.swift
//  DogViewApp
//
//  Created by spark-02 on 2024/03/06.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newViewController = UIViewController()
        newViewController.tabBarItem = UITabBarItem(title: "New", image: UIImage(systemName: "star"), tag: 0)
        
        viewControllers?.append(newViewController)
    }
}


//配列を作って、左から[0],[1]とアイコンを出すところを指定してあげる必要がある
