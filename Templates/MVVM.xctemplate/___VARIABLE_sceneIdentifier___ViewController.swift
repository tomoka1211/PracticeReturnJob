//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

final class ___VARIABLE_sceneIdentifier___ViewController: UIViewController, StoryboardInstantiable {
    
    // MARK: - Outlet
    
    // MARK: - Property

    weak var delegate: ___VARIABLE_sceneIdentifier___Delegate?
    var viewModel: ___VARIABLE_sceneIdentifier___ViewModelType!
    private var disposeBag = DisposeBag()
    
    // MARK: - Public
    
    static func configureWith() -> ___VARIABLE_sceneIdentifier___ViewController {
        let vc = ___VARIABLE_sceneIdentifier___ViewController.instantiate()
        vc.viewModel = ___VARIABLE_sceneIdentifier___ViewModel()
        return vc
    }

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setLayout()
        setBind()
    }
    
    // MARK: - Private

    private func setLayout() {

    }

    private func setBind() {

    }
}
