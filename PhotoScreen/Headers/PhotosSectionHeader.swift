//
//  PhotosHeader.swift
//  PhotoScreen
//
//  Created by Aleksandr Pimanov on 07.09.2022.
//

import UIKit

class PhotosSectionHeader: UICollectionReusableView {
        
    static let identifier = "PhotosHeader"
    
     lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.clipsToBounds = true
        return label
    }()
    
     lazy var subtitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.clipsToBounds = true
        label.textColor = .systemBlue
        return label
    }()
    
    private lazy var separator: UIView = {
            let separtor = UIView()
            separtor.backgroundColor = .quaternaryLabel
            return separtor
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setTitleConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setSubviews() {
        addSubview(title)
        addSubview(subtitle)
        addSubview(separator)
    }
    
    private func setTitleConstraints() {
        title.snp.makeConstraints { make in
            make.bottom.equalTo(self)
            make.left.equalTo(self)
        }
        subtitle.snp.makeConstraints { make in
            make.bottom.equalTo(self)
            make.right.equalTo(self)
        }
        separator.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.width.equalTo(self)
            make.bottom.equalTo(title.snp.top).offset(-10)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
        subtitle.text = nil
    }
}
