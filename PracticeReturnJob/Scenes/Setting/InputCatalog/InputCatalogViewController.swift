//
//  InputCatalogViewController.swift
//  PracticeReturnJob
//
//  Created by hirano_tomoka on 2022/10/18.
//

import UIKit
import RxSwift

final class InputCatalogViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet private weak var pickerLabel: PickerLabel!
    @IBOutlet private weak var pickerView: PickerView!
    @IBOutlet private weak var selectedLabel: UILabel!
    
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
        let vc = Storyboard.InputCatalog.instantiate(InputCatalogViewController.self)
        //vc.viewModel = InputCatalogViewController(info: info)
        return vc
    }
    
    // MARK: - Private
    
    private func setLayout() {
        navigationItem.title = "入力フォームのカタログ"
        
        pickerLabel.data = catType.map { ($0.rawValue, $0.id) }
        pickerView.data = catType.map { ($0.rawValue, $0.id) }
    }
    
    private func setBind() {
//        pickerView.rx.selectedItem
//            .sub
        
        pickerView.selectedItem.subscribe(onNext: { [unowned self] index in
            selectedLabel.text = CatType.allCases[index].rawValue
        })
        .disposed(by: disposeBag)
    }
}
