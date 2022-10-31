//
//  HomeViewController.swift
//  PracticeReturnJob
//
//  Created by hirano_tomoka on 2022/10/02.
//

import UIKit

final class HomeViewController: UIViewController {
    typealias DataSourceType = UICollectionViewDiffableDataSource<Int, String>

    // MARK: - IBOutlet
    
    @IBOutlet weak private var collectionView: UICollectionView!
    
    // MARK: - Property
    
    private var dataSource: DataSourceType!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureLayout(to: collectionView)
        dataSource = configureCellRegistration(to: collectionView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        initData()
    }
    
    // MARK: - Private
    
    private func configureLayout(to collectionView: UICollectionView){
        let configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        collectionView.collectionViewLayout = layout
    }
    
    private func configureCellRegistration(to collectionView: UICollectionView) -> DataSourceType {
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, String> { (cell, indexPath, item) in
            var content = cell.defaultContentConfiguration()
            content.text = item
            cell.contentConfiguration = content
        }

        return DataSourceType(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, item: String) -> UICollectionViewCell? in
                return collectionView.dequeueConfiguredReusableCell(using: cellRegistration,
                                                                    for: indexPath,
                                                                    item: item)
        }
    }

    // MARK: - Public
    
    func initData() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, String>()
        snapshot.appendSections([0])
        snapshot.appendItems(["🍇", "🍈", "🍉", "🍊", "🍋"])
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - StoryboardInstantiatable

extension HomeViewController: StoryboardInstantiatable {}
