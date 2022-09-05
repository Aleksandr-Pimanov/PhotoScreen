//
//  PhotosCollectionViewCell.swift
//  PhotoScreen
//
//  Created by Aleksandr Pimanov on 02.09.2022.
//

import UIKit
import SnapKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PhotosCollectionViewCell"
    
    private lazy var itemImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var mainFooterLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .label
        return label
    }()
    
    private lazy var subFooterLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var albumStackView = UIStackView(arrangedSubviews: [itemImage,
                                                                     mainFooterLabel,
                                                                     subFooterLabel],
                                                  axis: .vertical,
                                                  spacing: 1)

    func configure(with model: ItemCell) {
        itemImage.image = UIImage(named: model.image ?? "")
        mainFooterLabel.text = model.title
        subFooterLabel.text = model.subtitle
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setAlbumStackViewConstraints()
        setImageConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubviews() {
        contentView.addSubview(albumStackView)
    }
    
    private func setAlbumStackViewConstraints() {
        albumStackView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(contentView)
        }
    }
    
    private func setImageConstraints() {
        itemImage.snp.makeConstraints { make in
            make.bottom.equalTo(albumStackView).multipliedBy(0.8)
        }
    }
}
