//
//  WineCell.swift
//  WinesApp
//
//  Created by Telegey Nurbekova on 09/04/24.
//

import UIKit

class WineCell: UICollectionViewCell {
    static var reuseId = "wine_cell"
    
    private lazy var titleLabel = MakerView.shared.makeLabel()
    private lazy var wineryLabel = MakerView.shared.makeLabel(font: .systemFont(ofSize: 12),textColor: .lightGray)
//    private lazy var ratingLabel = MakerView.shared.makeLabel(font: .systemFont(ofSize: 12),textColor: .lightGray)
    private lazy var wineImage = MakerView.shared.makeImage()
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(wine: Wine) {
        titleLabel.text = wine.wine
        wineryLabel.text = wine.winery
//        wineImage.image = wine.image
        
    }
    
//    func setup2(rating: Rating){
//        ratingLabel.text = rating.reviews
//    }
    
    
    private func setupConstraints() {
        
        contentView.layer.cornerRadius = 16
        contentView.backgroundColor = .white
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.borderWidth = 1
        
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            titleLabel.widthAnchor.constraint(equalToConstant: (contentView.frame.width / 2) + 20 )
        
        ])
        
        contentView.addSubview(wineryLabel)
        NSLayoutConstraint.activate([
            wineryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            wineryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12)
        ])
        
        
        contentView.addSubview(wineImage)
        NSLayoutConstraint.activate([
            wineImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3),
            wineImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            wineImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -3),
            wineImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3)
        ])
    }
}
