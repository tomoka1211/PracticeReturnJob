//
//  Storyboard+.swift
//  PracticeReturnJob
//
//  Created by hirano_tomoka on 2022/10/18.
//

import UIKit

enum Storyboard: String {
    case InputCatalog
    
    func instantiate<VC: UIViewController>(_ viewController: VC.Type) -> VC {
        guard let vc = UIStoryboard(name: self.rawValue, bundle: nil)
            .instantiateViewController(withIdentifier: VC.storyboardIdentifier) as? VC
        else { fatalError("Couldn't instantiate \(VC.storyboardIdentifier) from \(self.rawValue)") }
        
        return vc
    }
    
    func instantiateRoot() -> UIViewController {
        guard let vc = UIStoryboard(name: self.rawValue, bundle: nil)
            .instantiateInitialViewController()
        else { fatalError("Couldn't instantiate root from \(self.rawValue)") }
        
        return vc
    }
}
