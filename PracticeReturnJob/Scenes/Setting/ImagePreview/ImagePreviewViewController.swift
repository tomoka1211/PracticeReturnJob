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
    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var dismissButton: UIButton!
    
    // MARK: - Property

    var delegate: ImagePreviewDelegate?
    var viewModel: ImagePreviewViewModelType!
    private let imageView = UIImageView(frame: UIScreen.main.bounds)
    private var disposeBag = DisposeBag()
    private let doubleTapGesture = UITapGestureRecognizer()
    
    // MARK: - Public
    
    static func configureWith(imageName: String) -> ImagePreviewViewController {
        let vc = ImagePreviewViewController.instantiate()
        vc.viewModel = ImagePreviewViewModel(imageName: imageName)
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
        self.view.backgroundColor = .black.withAlphaComponent(0.5)
        scrollView.backgroundColor = .clear
        scrollView.delegate = self
        scrollView.minimumZoomScale = 1.0
        // 拡大倍率
        scrollView.maximumZoomScale = 2.0
        
        // 画像の設定
        imageView.contentMode = .scaleAspectFit
        scrollView.addSubview(imageView)
        
        // タップ回数判定
        doubleTapGesture.numberOfTapsRequired = 2
        
        dismissButton.setImage(UIImage(named: "cancel-cancel_symbol"), for: .normal)
    }

    private func setBind() {
        viewModel.outputs.previewImageName
            .drive(onNext: { [unowned self] imageName in
                guard let image = UIImage(named: imageName) else { return }
                self.imageView.image = image
            })
            .disposed(by: disposeBag)
        
        scrollView.rx
            .gesture(doubleTapGesture)
            .when(.recognized)
            .subscribe(onNext: { [unowned self] gesture in
                let scale = min(self.scrollView.zoomScale * 2, self.scrollView.maximumZoomScale)
                
                if scale != self.scrollView.zoomScale {
                    let tapPoint = gesture.location(in: self.imageView)
                    let size = CGSize(width: self.scrollView.frame.size.width / scale,
                                      height: self.scrollView.frame.size.height / scale)
                    let origin = CGPoint(x: tapPoint.x - size.width / 2,
                                         y: tapPoint.y - size.height / 2)
                    self.scrollView.zoom(to: CGRect(origin: origin, size: size), animated: true)
                } else {
                    self.scrollView.zoom(to: self.scrollView.frame, animated: true)
                }
            })
            .disposed(by: disposeBag)
        
        dismissButton.rx.tap
            .subscribe(onNext: { [unowned self] _ in
                self.delegate?.dismiss()
            })
            .disposed(by: disposeBag)
    }
}

extension ImagePreviewViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
