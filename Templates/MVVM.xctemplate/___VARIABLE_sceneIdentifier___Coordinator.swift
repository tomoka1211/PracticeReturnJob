//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ All rights reserved.
//

import Foundation
import UIKit

protocol ___VARIABLE_sceneIdentifier___Delegate: AnyObject {
    func dismiss()
}

final class ___VARIABLE_sceneIdentifier___Coordinator: ___VARIABLE_sceneIdentifier___Delegate {
    
    // MARK: - Property
    
    var viewController: ___VARIABLE_sceneIdentifier___ViewController!
    var navigator: UINavigationController!
    var parent: UIViewController
    
    // MARK: - Initialize
    
    init(parent: UIViewController) {
        self.parent = parent
    }

    // MARK: - Public
    
    func start() {
        viewController = ___VARIABLE_sceneIdentifier___ViewController.configureWith()
        viewController.delegate = self
        navigator = UINavigationController(rootViewController: viewController)

        navigator.modalPresentationStyle = .formSheet
        parent.present(navigator, animated: true)
    }
    
    func dismiss() {
        navigator.dismiss(animated: true)
    }
}
