//
//  ImagePreviewViewModel.swift
//  PracticeReturnJob
//
//  Created by hirano_tomoka on 2022/10/31.
//  Copyright (c) 2022 All rights reserved.
//

import Foundation
import RxSwift
import RxRelay
import RxCocoa

protocol ImagePreviewViewModelInput {

}

protocol ImagePreviewViewModelOutput {
    
}

protocol ImagePreviewViewModelType {
    var inputs: ImagePreviewViewModelInput { get }
    var outputs: ImagePreviewViewModelOutput { get }
}

final class ImagePreviewViewModel: ImagePreviewViewModelInput, ImagePreviewViewModelOutput, ImagePreviewViewModelType {
    
    // MARK: - Input

    // MARK: - Output

    // MARK: - Property
    
    public var inputs: ImagePreviewViewModelInput { return self }
    public var outputs: ImagePreviewViewModelOutput { return self }

    private let disposeBag = DisposeBag()

    // MARK: - Initialize
    
    public init() {}

}