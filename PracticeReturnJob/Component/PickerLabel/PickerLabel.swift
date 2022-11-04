//
//  PickerLabel.swift
//  PracticeReturnJob
//
//  Created by hirano_tomoka on 2022/10/18.
//

import UIKit
import RxSwift
import RxCocoa

final class PickerLabel: UILabel {
    
    // MARK: - Property
    
    internal var data: [(String, Int)] = [] {
        didSet {
            pickerView.reloadAllComponents()
        }
    }
    
    var selected: Driver<Int> {
        return publishSelected.asDriver(onErrorJustReturn: 0)
    }
    
    private var publishSelected = BehaviorRelay<Int>(value: 0)
    let pickerView = UIPickerView()
    private let disposeBag = DisposeBag()
    
    private let toolBar: UIToolbar = {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
        let spaceItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: PickerLabel.self, action: nil)
        let doneItem = UIBarButtonItem(title: "完了", style: .done, target: self, action: #selector(didTapDone(sender:)))
        let cancelItem = UIBarButtonItem(title: "キャンセル", style: .done, target: self, action: #selector(didTapCancel(sender:)))
        toolbar.setItems([cancelItem, spaceItem, doneItem], animated: true)
        return toolbar
    }()
    
    // MARK: - Initializer
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        pickerView.delegate = self
    }
    
    // MARK: - Override
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override var inputView: UIView? {
        let row = data.map { $0.0 }.firstIndex(of: text ?? "") ?? -1
        pickerView.selectRow(row, inComponent: 0, animated: false)
        return pickerView
    }
    
    override var inputAccessoryView: UIView? {
        return toolBar
    }
    
    override var text: String? {
        didSet {
            if let text = text {
                let row = data.map { $0.0 }.firstIndex(of: text) ?? -1
                pickerView.selectRow(row, inComponent: 0, animated: false)
            }
        }
    }
    
    // MARK: - Private
    
    @objc
    private func didTap(sender: PickerLabel) {
        becomeFirstResponder()
    }
    
    @objc
    func didTapCancel(sender: PickerLabel) {
        resignFirstResponder()
    }
    
    @objc
    func didTapDone(sender: UIButton) {
        let row = data.map { $0.0 }.firstIndex(of: text ?? "") ?? -1
        if row != -1 {
            publishSelected.accept(data[row].1)
        } else {
            text = data[0].0
            publishSelected.accept(data[0].1)
        }
        resignFirstResponder()
    }
    
}

// MARK: - Reactive

extension Reactive where Base: PickerLabel {
    var didTapDone: Observable<Void> {
        return self.sentMessage(#selector(base.didTapDone(sender:)))
            .map { _ -> Void in return () }
            .share(replay: 1)
    }
    
    var didTapCancel: Observable<Void> {
        return self.sentMessage(#selector(base.didTapCancel(sender:)))
            .map { _ -> Void in return () }
            .share(replay: 1)
    }
}

// MARK: - UIKeyInput

extension PickerLabel: UIKeyInput {
    
    var hasText: Bool {
        return !(text?.isEmpty ?? false)
    }
    
    func insertText(_ text: String) {
        self.text! += text
        setNeedsDisplay()
    }
    
    func deleteBackward() {
        text = String(text!.prefix(text!.count - 1))
        setNeedsDisplay()
    }
}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource

extension PickerLabel: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row].0
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        text = data[row].0
        setNeedsDisplay()
    }
}
