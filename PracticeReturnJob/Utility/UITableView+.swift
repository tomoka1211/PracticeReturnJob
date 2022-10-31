//
//  UITableView+.swift
//  PracticeReturnJob
//
//  Created by hirano_tomoka on 2022/10/02.
//

import UIKit
import Instantiate

extension UITableView {
    func dequeue<Cell: Instantiate.Injectable>(_ cell: Cell, identifier: String , for indexPath: IndexPath, with dependency: Cell.Dependency) -> Cell {
        let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! Cell // swiftlint:disable:this force_cast
        cell.inject(dependency)
        return cell
    }
}
