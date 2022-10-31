//
//  SettingViewSection.swift
//  PracticeReturnJob
//
//  Created by hirano_tomoka on 2022/10/02.
//

import Foundation
import RxDataSources


enum SettingViewSection {
    case setting([Item])
    case other([Item])

    enum Item {
        case inputCatalog
        case imagePreview
        case contact
        case terms
        case privacy
        case version
        case deleteUser
    }
}

// MARK: - SectionModelType

extension SettingViewSection: SectionModelType {
    // 必須
    var items: [SettingViewSection.Item] {
        switch self {
        case .setting(let items): return items
        case .other(let items): return items
        }
    }
    
    // 必須
    init(original: SettingViewSection, items: [SettingViewSection.Item]) {
        switch original {
        case .setting: self = .setting(items)
        case .other: self = .other(items)
        }
    }
    
}

extension SettingViewSection {
    static let defaultSettings: [SettingViewSection] = [
        .setting([
            Item.inputCatalog,
            Item.imagePreview
        ]),
        .other([
            Item.contact,
            Item.terms,
            Item.privacy,
            Item.version
        ])
    ]
}

extension SettingViewSection.Item {
    var title: String {
        switch self {
        case .inputCatalog: return "入力フォームカタログ"
        case .imagePreview: return "画像プレビュー"
        case .contact: return "お問合せ"
        case .terms: return "利用規約"
        case .privacy: return "プライバシーポリシー"
        case .version: return "アプリバージョン"
        case .deleteUser: return "アカウント削除"
        }
    }
    
    var titleColor: UIColor {
        switch self {
        case .deleteUser:
            return .red
        default:
            return .black
        }
    }

    var detail: String? {
        switch self {
        case .version:
            return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        default:
            return nil
        }
    }
    
    var accessoryType: UITableViewCell.AccessoryType {
        switch self {
        case .version:
            return .none
        default:
            return .disclosureIndicator
        }
    }
}

// MARK: - Equatable

extension SettingViewSection: Equatable {
    static func == (lhs: SettingViewSection, rhs: SettingViewSection) -> Bool {
        return lhs.items == rhs.items
    }
}
