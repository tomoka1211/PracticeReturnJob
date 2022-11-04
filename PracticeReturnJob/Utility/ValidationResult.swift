//
//  ValidationResult.swift
//  PracticeReturnJob
//
//  Created by hirano_tomoka on 2022/11/04.
//

import RxSwift
import RxCocoa

public enum ValidationResult {
    case ok
    case empty
    case validating
    case failed(message: String)
}

extension ValidationResult {
    public var isValid: Bool {
        switch self {
        case .ok:
            return true
        default:
            return false
        }
    }
    
    public var isEmpty: Bool {
        switch self {
        case .empty:
            return true
        default:
            return false
        }
    }
    
    public var isValidOrEmpty: Bool {
        switch self {
        case .ok:
            return true
        case .empty:
            return true
        default:
            return false
        }
    }
}

extension ValidationResult: CustomStringConvertible {
    public var description: String {
        switch self {
        case .ok, .empty, .validating:
            return ""
        case let .failed(message):
            return message
        }
    }
}

public enum ValidationType {
    case phone
    case email
}

public func validateRx(input: String, type: ValidationType) -> Observable<ValidationResult> {
    return Observable.create { observer in
        let result = validate(input: input, type: type)
        
        switch result {
        case .failed(let message):
            observer.onError(CustomError(message: message))
        default:
            observer.onNext(result)
        }
        observer.onCompleted()
        return Disposables.create()
    }
}

public func validate(input: String, type: ValidationType) -> ValidationResult {
    switch type {
    case .phone:
        if input.isEmpty { return .empty }
        return input.isValidPhone ? .ok : .failed(message: "※電話番号の入力の形式に誤りがあります")
    case .email:
        if input.isEmpty { return .empty }
        return input.isValidEmail ? .ok : .failed(message: "※メールアドレスの入力の形式に誤りがあります")
    }
}

public struct CustomError: Error {
    let message: String
    
    var localizedDescription: String {
        return NSLocalizedString(message, comment: "")
    }
}

extension String {
    var isValidEmail: Bool {
        // http://emailregex.com/
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }
    
    var isValidPhone: Bool {
        // https://github.com/sakatam/a-better-jp-phone-regex
        let regex = "^(0([1-9]{1}-?[1-9]\\d{3}|[1-9]{2}-?\\d{3}|[1-9]{2}\\d{1}-?\\d{2}|[1-9]{2}\\d{2}-?\\d{1})-?\\d{4}|0[789]0-?\\d{4}-?\\d{4}|050-?\\d{4}-?\\d{4})$"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }
}
