//
//  CatType.swift
//  PracticeReturnJob
//
//  Created by hirano_tomoka on 2022/10/18.
//



enum CatType: String, CaseIterable {
    case empty = "未選択"
    case persian = "ペルシャ"
    case americanShorthair = "アメリカンショートヘア"
    case exoticShorthair = "エキゾチックショートヘア"
    case munchkin = "マンチカン"

    var id: Int {
        switch self {
        case .empty: return 0
        case .persian: return 1
        case .americanShorthair: return 2
        case .exoticShorthair: return 3
        case .munchkin: return 4
        }
    }
}
