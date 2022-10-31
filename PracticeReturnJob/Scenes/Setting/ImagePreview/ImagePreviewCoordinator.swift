//
//  ImagePreviewCoordinator.swift
//  PracticeReturnJob
//
//  Created by hirano_tomoka on 2022/10/31.
//  Copyright (c) 2022 All rights reserved.
//

import Foundation
import UIKit

protocol ImagePreviewDelegate: AnyObject {
    func dismiss()
}

final class ImagePreviewCoordinator: ImagePreviewDelegate {
    
    // MARK: - Property
    
    var viewController: ImagePreviewViewController!
    var navigator: UINavigationController!
    var parent: UIViewController
    var imageName: String!
    
    // MARK: - Initialize
    
    init(parent: UIViewController, imageName: String) {
        self.parent = parent
        self.imageName = imageName
    }

    // MARK: - Public
    
    func start() {
        viewController = ImagePreviewViewController.configureWith(imageName: imageName)
        viewController.delegate = self
        viewController.modalPresentationStyle = .overCurrentContext
        
        parent.present(viewController, animated: true)
    }
    
    func dismiss() {
        viewController.dismiss(animated: true)
    }
}
