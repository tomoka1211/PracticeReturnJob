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
    let either: Either<UIViewController, UINavigationController>
    
    // MARK: - Initialize
    
    init(either: Either<UIViewController, UINavigationController>) {
        self.either = either
    }

    // MARK: - Public
    
    func start() {
        viewController = ___VARIABLE_sceneIdentifier___ViewController.configureWith()
        viewController.delegate = self
        switch either {
        case .left(let parent):
            // モーダル遷移
            navigator = UINavigationController(rootViewController: viewController)
            navigator.modalPresentationStyle = .formSheet
            parent.present(navigator, animated: true)
        case .right(let navigationController):
            // プッシュ遷移
            navigator = navigationController
            navigator.pushViewController(viewController, animated: true)
        }
    }
    
    func dismiss() {
        navigator.dismiss(animated: true)
    }
}
