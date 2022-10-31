//
//  ImageCocktailViewModel.swift
//  PracticeReturnJob
//
//  Created by hirano_tomoka on 2022/10/31.
//  Copyright (c) 2022 All rights reserved.
//

import Foundation
import RxSwift
import RxRelay
import RxCocoa

protocol ImageCocktailViewModelInput {

}

protocol ImageCocktailViewModelOutput {
    
}

protocol ImageCocktailViewModelType {
    var inputs: ImageCocktailViewModelInput { get }
    var outputs: ImageCocktailViewModelOutput { get }
}

final class ImageCocktailViewModel: ImageCocktailViewModelInput, ImageCocktailViewModelOutput, ImageCocktailViewModelType {
    
    // MARK: - Input

    // MARK: - Output

    // MARK: - Property
    
    public var inputs: ImageCocktailViewModelInput { return self }
    public var outputs: ImageCocktailViewModelOutput { return self }

    private let disposeBag = DisposeBag()

    // MARK: - Initialize
    
    public init() {}

}