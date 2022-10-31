//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ All rights reserved.
//

import Foundation
import RxSwift
import RxRelay
import RxCocoa

protocol ___VARIABLE_sceneIdentifier___ViewModelInput {

}

protocol ___VARIABLE_sceneIdentifier___ViewModelOutput {
    
}

protocol ___VARIABLE_sceneIdentifier___ViewModelType {
    var inputs: ___VARIABLE_sceneIdentifier___ViewModelInput { get }
    var outputs: ___VARIABLE_sceneIdentifier___ViewModelOutput { get }
}

final class ___VARIABLE_sceneIdentifier___ViewModel: ___VARIABLE_sceneIdentifier___ViewModelInput, ___VARIABLE_sceneIdentifier___ViewModelOutput, ___VARIABLE_sceneIdentifier___ViewModelType {
    
    // MARK: - Input

    // MARK: - Output

    // MARK: - Property
    
    public var inputs: ___VARIABLE_sceneIdentifier___ViewModelInput { return self }
    public var outputs: ___VARIABLE_sceneIdentifier___ViewModelOutput { return self }

    private let disposeBag = DisposeBag()

    // MARK: - Initialize
    
    public init() {}

}