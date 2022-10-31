//
//  UITableView+Rx.swift
//  PracticeReturnJob
//
//  Created by hirano_tomoka on 2022/10/18.
//

import RxSwift
import RxCocoa
import RxDataSources

extension Reactive where Base: UITableView {
    func itemSelected<S>(dataSource: TableViewSectionedDataSource<S>) -> ControlEvent<S.Item> {
        let source = self.itemSelected.map { indexPath in
            dataSource[indexPath]
        }
        return ControlEvent(events: source)
    }
}
