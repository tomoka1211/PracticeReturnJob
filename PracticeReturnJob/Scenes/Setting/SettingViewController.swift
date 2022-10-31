//
//  SettingViewController.swift
//  PracticeReturnJob
//
//  Created by hirano_tomoka on 2022/10/02.
//

import Instantiate
import RxSwift
import RxDataSources
import UIKit

final class SettingViewController: UIViewController {
    
    typealias DataSource = RxTableViewSectionedReloadDataSource<SettingViewSection>
    
    // MARK: - IBOutlet
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Property
    
    var disposeBag = DisposeBag()
    
    private lazy var dataSource: DataSource = { [unowned self] in
        DataSource(configureCell: { _, tableView, indexPath, item -> UITableViewCell in
            let cell = tableView.dequeue(SettingViewCell(), identifier: "SettingViewCell", for: indexPath, with: item)
            return cell
        })
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "設定"
        Observable.just(SettingViewSection.defaultSettings)
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        tableView.rx.itemSelected(dataSource: dataSource)
            .subscribe(onNext: { [unowned self] transition in
                switch transition {
                case .contact:
                    let coordinator = InputCatalogCoordinator(parent: self)
                    coordinator.start()
                default:
                    print("遷移作ってね！")
                }
            })
            .disposed(by: disposeBag)
    }

}

// MARK: - StoryboardInstantiatable

extension SettingViewController: StoryboardInstantiatable {}
