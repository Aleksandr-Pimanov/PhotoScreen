//
//  AlbumsViewController.swift
//  PhotoScreen
//
//  Created by Aleksandr Pimanov on 04.09.2022.
//

import UIKit
import SnapKit

class AlbumsViewController: UIViewController {
    
    var items = Section.configure()
    
    private lazy var photoScreenCollectionView: UICollectionView = {
        let layout = createLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(PhotosCollectionViewCell.self,
                            forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        collection.register(MediaCollectionViewCell.self,
                            forCellWithReuseIdentifier: MediaCollectionViewCell.identifier)
        collection.register(PhotosSectionHeader.self,
                            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                            withReuseIdentifier: PhotosSectionHeader.identifier)
        collection.delegate = self
        collection.dataSource = self
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Альбомы"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        addSubviews()
        setCollectionViewConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(photoScreenCollectionView)
    }
    
    private func setCollectionViewConstraints() {
        photoScreenCollectionView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(view)
        }
    }
}

extension AlbumsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items[section].item.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = items[indexPath.section].item[indexPath.item]

        switch indexPath.section {
        case 0, 1:
            
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier,
                                                                for: indexPath)
                    as? PhotosCollectionViewCell else { return UICollectionViewCell() }
            item.configure(with: model)
            return item
            
        case 2, 3:
            
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: MediaCollectionViewCell.identifier,
                                                                for: indexPath)
                    as? MediaCollectionViewCell else { return UICollectionViewCell() }
            item.configure(with: model)
            return item
            
        default:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier,
                                                                for: indexPath)
                    as? PhotosCollectionViewCell else { return UICollectionViewCell() }
            item.configure(with: model)
            return item
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: PhotosSectionHeader.identifier, for: indexPath) as? PhotosSectionHeader else
        { return UICollectionReusableView() }
        
        switch indexPath.section {
        case 0:
            header.title.text = "Мои альбомы"
            header.subtitle.text = "Все"
        case 1:
            header.title.text = "Люди и места"
        case 2:
            header.title.text = "Типы медиафайлов"
        case 3:
            header.title.text = "Другое"
        default:
            header.title.text = ""
        }
        return header
    }
}

extension AlbumsViewController {
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection in
            
            switch sectionIndex {
            case 0:
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                 heightDimension: .fractionalHeight(1))

            let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
            layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 2.2),
                                                   heightDimension: .fractionalWidth(1 / 1.8 * 2))
            let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                               subitem: layoutItem,
                                                               count: 2)
            
            layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                leading: 5,
                                                                bottom: 0,
                                                                trailing: 5)
            
            let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
            layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                  leading: 10,
                                                                  bottom: 10,
                                                                  trailing: 10)
            layoutSection.orthogonalScrollingBehavior = .groupPaging
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93),
                                                                     heightDimension: .estimated(50))
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                
                return layoutSection
                
            case 1:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                     heightDimension: .fractionalHeight(1))

                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 10)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .fractionalWidth(0.58))
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                                   subitem: layoutItem,
                                                                   count: 2)
                
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                    leading: 12,
                                                                    bottom: 0,
                                                                    trailing: 10)
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                      leading: 5,
                                                                      bottom: 0,
                                                                      trailing: 5)
                layoutSection.orthogonalScrollingBehavior = .none
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93),
                                                                     heightDimension: .estimated(50))
                
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]

            return layoutSection
                
            case 2, 3:
                let layoutList = UICollectionLayoutListConfiguration(appearance: .plain)
                let layoutSection = NSCollectionLayoutSection.list(using: layoutList,
                                                                   layoutEnvironment: layoutEnvironment)
                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93),
                                                                     heightDimension: .estimated(50))
                
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 30, trailing: 0)

            return layoutSection
                
            default:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 2.2),
                                                       heightDimension: .fractionalWidth(1 / 1.8 * 2))
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                                   subitem: layoutItem,
                                                                   count: 2)
                
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                    leading: 10,
                                                                    bottom: 0,
                                                                    trailing: 10)
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                      leading: 10,
                                                                      bottom: 0,
                                                                      trailing: 10)
                layoutSection.orthogonalScrollingBehavior = .groupPaging
                
                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93),
                                                                     heightDimension: .estimated(80))
                
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                
                return layoutSection
            }
        }
    }
}
