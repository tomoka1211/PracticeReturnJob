//
//  SettingTableViewCell.swift
//  PracticeReturnJob
//
//  Created by hirano_tomoka on 2022/10/02.
//

import UIKit
import Instantiate

final class SettingViewCell: UITableViewCell {

    // MARK: - Outlet

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var detailLabel: UILabel!

    // MARK: - Property

    private var item: SettingViewSection.Item! {
        didSet {
            titleLabel.text = item.title
            titleLabel.textColor = item.titleColor
            detailLabel.text = item.detail
            self.accessoryType = item.accessoryType
        }
    }
}

// MARK: - Injectable

extension SettingViewCell: Injectable {
    func inject(_ dependency: SettingViewSection.Item) {
        self.item = dependency
    }
}
