//
//  StoryboardInstantiatable.swift
//  PracticeReturnJob
//
//  Created by hirano_tomoka on 2022/10/02.
//

import Instantiate
import UIKit

typealias StoryboardInstantiatable = Instantiate.StoryboardInstantiatable
typealias InstantiateSource = Instantiate.InstantiateSource
typealias StoryboardName = Instantiate.StoryboardName

extension StoryboardInstantiatable where Self: UIViewController {
    static var storyboardName: StoryboardName {
        return className.replacingOccurrences(of: "ViewController", with: "")
    }
}


