//
//  ImagePreviewViewController.swift
//  PracticeReturnJob
//
//  Created by hirano_tomoka on 2022/10/31.
//  Copyright (c) 2022 All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

final class ImagePreviewViewController: UIViewController, StoryboardInstantiable {
    
    // MARK: - Outlet
    
    // MARK: - Property

    weak var delegate: ImagePreviewDelegate?
    var viewModel: ImagePreviewViewModelType!
    private var disposeBag = DisposeBag()
    
    // MARK: - Public
    
    static func configureWith() -> ImagePreviewViewController {
        let vc = ImagePreviewViewController.instantiate()
        vc.viewModel = ImagePreviewViewModel()
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
