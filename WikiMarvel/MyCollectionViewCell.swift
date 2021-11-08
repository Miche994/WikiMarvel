//
//  MyCollectionViewCell.swift
//  WikiMarvel
//
//  Created by Betacom on 08/11/21.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MyCollectionViewCell"
    
    @IBOutlet var imageView: UIImageView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    public func configure(with image: UIImage){
        imageView.image = image
    }

    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
