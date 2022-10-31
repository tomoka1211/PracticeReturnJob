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
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Property
    
    var delegate: ImageCocktailDelegate?
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
        navigationItem.title = "画像カクテル"
    }
    
    private func setBind() {
        imageView.rx
            .tapGesture()
            .when(.recognized)
            .subscribe(onNext: { [unowned self] _ in
                self.delegate?.transitionNext(imageName: "mikan_koko")
            }).disposed(by: disposeBag)
    }
}
