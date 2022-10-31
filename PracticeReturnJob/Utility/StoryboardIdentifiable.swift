//
//  StoryboardIdentifiable.swift
//  PracticeReturnJob
//
//  Created by hirano_tomoka on 2022/10/18.
//

import UIKit

protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}

extension UIViewController: StoryboardIdentifiable {}
