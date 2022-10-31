//
//  SettingNavigationViewController.swift
//  PracticeReturnJob
//
//  Created by hirano_tomoka on 2022/10/02.
//

import UIKit

class SettingNavigationViewController: UINavigationController {

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let viewController = SettingViewController(with: ())
        setViewControllers([viewController], animated: false)
    }
}
