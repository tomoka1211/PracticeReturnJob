//
//  CustomInputView.swift
//  PracticeReturnJob
//
//  Created by hirano_tomoka on 2022/11/04.
//

import UIKit
import RxSwift

final class CustomInputView: UIView {

    // MARK: - Outlet
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var requiredLabel: UILabel!
    @IBOutlet private(set) weak var textField: UITextField!
    @IBOutlet fileprivate weak var errorView: UIView!
    @IBOutlet fileprivate weak var errorLabel: UILabel!
    
    // MARK: - Property
    
    var title: String? = nil {
        didSet {
            titleLabel.text = title
        }
    }
    
    var isRequired: Bool = false {
        didSet {
            requiredLabel.isHidden = !isRequired
        }
    }
    
    var placeHolder: String? = nil {
        didSet {
            textField.placeholder = placeHolder
        }
    }
    
    var keyboardType: UIKeyboardType = .default {
        didSet {
            textField.keyboardType = keyboardType
        }
    }
    
    // MARK: - Initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
        setLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
        setLayout()
    }
    
    // MARK: - Private
    
    private func xibSetup() {
        let view = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        self.addSubview(view)
    }
    
    private func setLayout() {
        titleLabel.textColor = .black.withAlphaComponent(0.8)
    }
}

extension Reactive where Base: CustomInputView {
    var validationResult: Binder<ValidationResult> {
        return Binder(base) { view, result in
            view.errorLabel.text = result.description
            view.errorLabel.isHidden = result.isValidOrEmpty
        }
    }
}
