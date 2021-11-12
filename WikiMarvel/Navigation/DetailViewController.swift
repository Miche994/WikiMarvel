//
//  DetailViewController.swift
//  WikiMarvel
//
//  Created by Betacom on 10/11/21.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var nameCharacter: UILabel!
    @IBOutlet weak var descriptionCharacter: UILabel!
    
    private var receivedImageCharacter: UIImage!
    private var receivedNameCharacter: String!
    private var receivedDesCharacter: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        characterImage.image = receivedImageCharacter
        nameCharacter.text = receivedNameCharacter
        descriptionCharacter.text = receivedDesCharacter
    }
    
    public func configure(image receivedImage: UIImage, name receivedName: String, description des: String){
        receivedImageCharacter = receivedImage
        receivedNameCharacter = receivedName
        receivedDesCharacter = des
    }

}
