//
//  MediaCollectionViewCell.swift
//  PhotoScreen
//
//  Created by Aleksandr Pimanov on 07.09.2022.
//

import UIKit

class MediaCollectionViewCell: UICollectionViewListCell {

    static let identifier = "MediaCollectionViewCell"
    
    private lazy var itemImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var mainTitleLabel: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 15)
        title.textColor = .label
       return title
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 15)
        title.textColor = .systemGray
        return title
    }()
    
    private lazy var chevronImage: UIImageView = {
        let chevron = UIImageView()
        chevron.tintColor = .systemGray
        chevron.contentMode = .scaleAspectFill
        chevron.clipsToBounds = true
        return chevron
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setImageConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(with model: ItemCell) {
        itemImage.image = UIImage(systemName: model.image ?? "")
        mainTitleLabel.text = model.title
        subTitleLabel.text = model.subtitle
        chevronImage.image = UIImage(systemName: model.additionalElements ?? "")
    }
    
    private func setSubviews() {
        contentView.addSubview(itemImage)
        contentView.addSubview(mainTitleLabel)
        contentView.addSubview(subTitleLabel)
        contentView.addSubview(chevronImage)
    }
    
    private func setImageConstraints() {
        itemImage.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(contentView).offset(13)
        }
        mainTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(itemImage.snp.right).offset(10)
            make.centerY.equalTo(itemImage)
        }
        chevronImage.snp.makeConstraints { make in
            make.right.equalTo(contentView).offset(-10)
            make.centerY.equalTo(itemImage)
        }
        subTitleLabel.snp.makeConstraints { make in
            make.right.equalTo(chevronImage.snp.left).offset(-7)
            make.centerY.equalTo(itemImage)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        itemImage.image = nil
        mainTitleLabel.text = nil
        subTitleLabel.text = nil
        chevronImage.image = nil
    }
}
