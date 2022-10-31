//
//  ImageCocktailCoordinator.swift
//  PracticeReturnJob
//
//  Created by hirano_tomoka on 2022/10/31.
//  Copyright (c) 2022 All rights reserved.
//

import Foundation
import UIKit

protocol ImageCocktailDelegate: AnyObject {
    func dismiss()
}

final class ImageCocktailCoordinator: ImageCocktailDelegate {
    
    // MARK: - Property
    
    var viewController: ImageCocktailViewController!
    var navigator: UINavigationController!
    var parent: UIViewController
    
    // MARK: - Initialize
    
    init(parent: UIViewController) {
        self.parent = parent
    }

    // MARK: - Public
    
    func start() {
        viewController = ImageCocktailViewController.configureWith()
        viewController.delegate = self
        navigator = UINavigationController(rootViewController: viewController)

        navigator.modalPresentationStyle = .formSheet
        parent.present(navigator, animated: true)
    }
    
    func dismiss() {
        navigator.dismiss(animated: true)
    }
}
