//
//  InputCatalogCoordinator.swift
//  PracticeReturnJob
//
//  Created by hirano_tomoka on 2022/10/18.
//

import Foundation
import UIKit

protocol InputCatalogDelegate: AnyObject {
    func dismiss()
    func complete()
}

final class InputCatalogCoordinator: InputCatalogDelegate {
    
    // MARK: - Property
    
    var viewController: InputCatalogViewController!
    var navigator: UINavigationController!
    let either: Either<UIViewController, UINavigationController>
    
    // MARK: - Initialize
    
    init(either: Either<UIViewController, UINavigationController>) {
        self.either = either
    }
    
    func start() {
        viewController = InputCatalogViewController.configureWith()
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
    
    func complete() {
        print("complete")
    }
}

enum Either<L, R> {
    case left(L), right(R)
}
