//
//  InputCatalogCoordinator.swift
//  PracticeReturnJob
//
//  Created by hirano_tomoka on 2022/10/18.
//

import Foundation
import UIKit

protocol InputCatalogDelegate {
    func dismiss()
    func complete()
}

final class InputCatalogCoordinator: InputCatalogDelegate {
    
    // MARK: - Property
    
    var viewController: InputCatalogViewController!
    var selfNavigator: UINavigationController!
    var parent: UIViewController
    
    // MARK: - Initialize
    

    
    init(parent: UIViewController) {
        self.parent = parent
    }
    
    func start() {
        viewController = InputCatalogViewController.configureWith()
        viewController.delegate = self
        selfNavigator = UINavigationController(rootViewController: viewController)

        selfNavigator.modalPresentationStyle = .formSheet
        parent.present(selfNavigator, animated: true)
    }
    
    func dismiss() {
        print("dismiss")
    }
    
    func complete() {
        print("complete")
    }
}
