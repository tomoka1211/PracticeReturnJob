//
//  ImageCocktailViewController.swift
//  PracticeReturnJob
//
//  Created by hirano_tomoka on 2022/10/31.
//  Copyright (c) 2022 All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

final class ImageCocktailViewController: UIViewController, StoryboardInstantiable {
    
    // MARK: - Outlet
    
    // MARK: - Property

    weak var delegate: ImageCocktailDelegate?
    var viewModel: ImageCocktailViewModelType!
    private var disposeBag = DisposeBag()
    
    // MARK: - Public
    
    static func configureWith() -> ImageCocktailViewController {
        let vc = ImageCocktailViewController.instantiate()
        vc.viewModel = ImageCocktailViewModel()
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
