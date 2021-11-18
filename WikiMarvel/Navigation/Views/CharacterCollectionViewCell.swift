//
//  MyCollectionViewCell.swift
//  WikiMarvel
//
//  Created by Betacom on 08/11/21.
//

import UIKit
import SDWebImage

class CharacterCollectionViewCell: UICollectionViewCell {
    
    public static let kIdentifier = "CharacterCollectionViewCell"
    private static let kCornerRadius = 8.0
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    private var descriptionCharacter: String!
    
    
    public static func nib() -> UINib {
        return UINib(nibName: Self.kIdentifier, bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .lightGray
        layer.cornerRadius = Self.kCornerRadius
        layer.masksToBounds = true
    }
    
    public func configure(urlString: String, name: String, description: String) {
        imageView.sd_setImage(with: URL(string: urlString))
        nameLabel.text = name
        descriptionCharacter = description
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        nameLabel.text = nil
    }
    
}
