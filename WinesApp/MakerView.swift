//
//  MakerView.swift
//  WinesApp
//
//  Created by Telegey Nurbekova on 09/04/24.
//

import UIKit

final class MakerView {
    
    static let shared = MakerView()
    
    private init(){
        print("init MakerView")
    }
    
    func makeLabel(text: String = "",
                   font: UIFont = .systemFont(ofSize: 16),
                   textColor: UIColor = .black,
                   backgroundColor: UIColor = .clear,
                   textAlignment: NSTextAlignment = .left,
                   numberOfLines: Int = 0,
                   lineBreakMode:NSLineBreakMode = .byWordWrapping,
                   isHidden: Bool = false,
                   translatesAutoresizingMaskIntoConstraints: Bool = false
    ) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = textColor
        label.backgroundColor = backgroundColor
        label.textAlignment = textAlignment
        label.numberOfLines = numberOfLines
        label.lineBreakMode = lineBreakMode
        label.isHidden = isHidden
        label.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        return label
    }
    
    func makeImage(imageName: String = "",
                    translatesAutoresizingMaskIntoConstraints: Bool = false
    ) -> UIImageView {
        let image = UIImageView()
        image.image = UIImage(systemName: imageName)
        image.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        return image
    }
}
