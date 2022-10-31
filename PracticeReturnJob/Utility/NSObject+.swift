//
//  NSObject+.swift
//  PracticeReturnJob
//
//  Created by hirano_tomoka on 2022/10/02.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }

    var className: String {
        return type(of: self).className
    }
}
