//
//  HomeNavigationViewController.swift
//  PracticeReturnJob
//
//  Created by hirano_tomoka on 2022/10/02.
//

import UIKit

final class HomeNavigationViewController: UINavigationController {
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let viewController = HomeViewController.configureWith()
        setViewControllers([viewController], animated: false)
    }

}
