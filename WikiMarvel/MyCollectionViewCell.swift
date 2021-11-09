//
//  MyCollectionViewCell.swift
//  WikiMarvel
//
//  Created by Betacom on 08/11/21.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    public static let identifier = "MyCollectionViewCell"
    private static let radius = 8.0
    
    @IBOutlet private var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    public static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .lightGray
        layer.cornerRadius = MyCollectionViewCell.radius
        layer.masksToBounds = true
    }
    
    public func configure(with image: UIImage, name: String) {
        imageView.image = image
        nameLabel.text = name
    }

    
}
