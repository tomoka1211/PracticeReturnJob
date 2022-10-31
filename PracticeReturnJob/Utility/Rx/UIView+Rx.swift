//
//  UIView+Rx.swift
//  PracticeReturnJob
//
//  Created by hirano_tomoka on 2022/10/18.
//

import RxSwift
import RxCocoa
import RxGesture

extension Reactive where Base == UIView {
    var tapGes: Observable<Void> {
        return base.rx.tapGesture().when(.recognized).map { _ in }
    }
}

