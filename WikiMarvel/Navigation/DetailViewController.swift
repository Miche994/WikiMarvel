//
//  DetailViewController.swift
//  WikiMarvel
//
//  Created by Betacom on 10/11/21.
//

import UIKit

class DetailViewController: UIViewController {
    private static let detailViewControllerIdentifier = "DetailViewController"
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var nameCharacter: UILabel!
    @IBOutlet weak var descriptionCharacter: UILabel!
    
    private var receivedImageCharacter: UIImage!
    private var receivedNameCharacter: String!
    private var receivedDesCharacter: String!
    
    public static func newInstance(imageCharacter: UIImage, nameCharacter: String, descriptionCharacter: String) -> DetailViewController? {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: DetailViewController.detailViewControllerIdentifier) as! DetailViewController
        vc.receivedImageCharacter = imageCharacter
        vc.receivedNameCharacter = nameCharacter
        vc.receivedDesCharacter = descriptionCharacter
        return vc
    }
    
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
