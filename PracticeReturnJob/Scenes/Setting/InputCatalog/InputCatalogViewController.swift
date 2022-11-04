//
//  InputCatalogViewController.swift
//  PracticeReturnJob
//
//  Created by hirano_tomoka on 2022/10/18.
//

import UIKit
import RxSwift

final class InputCatalogViewController: UIViewController, StoryboardInstantiable {
    
    // MARK: - IBOutlet
    
    @IBOutlet private weak var pickerView: PickerView!
    @IBOutlet private weak var selectedLabel: UILabel!
    @IBOutlet private weak var phoneInputView: CustomInputView!
    @IBOutlet private weak var emailInputView: CustomInputView!
    
    // MARK: - Property
    
    weak var delegate: InputCatalogDelegate?
    private let catType = CatType.allCases
    private var disposeBag = DisposeBag()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setBind()
    }
    
    // MARK: - Public
    
    static func configureWith() -> InputCatalogViewController {
        let vc = InputCatalogViewController.instantiate()
        return vc
    }
    
    // MARK: - Private
    
    private func setLayout() {
        navigationItem.title = "入力フォームのカタログ"
        
        pickerView.data = catType.map { ($0.rawValue, $0.id) }
        
        phoneInputView.title = "電話番号"
        phoneInputView.keyboardType = .numberPad
        phoneInputView.placeHolder = "電話番号を入力してください"
        phoneInputView.isRequired = true
        
        emailInputView.title = "メールアドレス"
        emailInputView.keyboardType = .emailAddress
        emailInputView.placeHolder = "メールアドレスを入力してください"
        emailInputView.isRequired = false
    }
    
    private func setBind() {
        pickerView.selectedItem.subscribe(onNext: { [unowned self] index in
            selectedLabel.text = CatType.allCases[index].rawValue
        })
        .disposed(by: disposeBag)
        
        phoneInputView.textField.rx.text.orEmpty
            .debounce(.microseconds(500), scheduler: MainScheduler.instance)
            .map { PracticeReturnJob.validate(input: $0, type: .phone) }
            .bind(to: phoneInputView.rx.validationResult)
            .disposed(by: disposeBag)
        
        emailInputView.textField.rx.text.orEmpty
                    .debounce(.microseconds(500), scheduler: MainScheduler.instance)
                    .map { PracticeReturnJob.validate(input: $0, type: .email) }
                    .bind(to: emailInputView.rx.validationResult)
                    .disposed(by: disposeBag)
    }
}
