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

        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier,
                                                            for: indexPath)
                as? PhotosCollectionViewCell else { return UICollectionViewCell() }
        
        let model = items[indexPath.section].item[indexPath.item]
        item.configure(with: model)

        return item
    }
}

extension AlbumsViewController {
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, _ in
            
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
                                                                leading: 10,
                                                                bottom: 0,
                                                                trailing: 10)
            
            let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
            layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                  leading: 10,
                                                                  bottom: 0,
                                                                  trailing: 10)
            layoutSection.orthogonalScrollingBehavior = .groupPaging
                
                return layoutSection
                
            case 1:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                     heightDimension: .fractionalHeight(1))

                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 10)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9),
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

            return layoutSection
                
            case 2:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                     heightDimension: .fractionalHeight(1))

                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 10)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9),
                                                       heightDimension: .fractionalWidth(0.58))
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
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
                
                return layoutSection
            }
        }
    }
}
