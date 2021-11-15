//
//  DetailViewController.swift
//  WikiMarvel
//
//  Created by Betacom on 10/11/21.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    private static let detailViewControllerIdentifier = "DetailViewController"
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var nameCharacter: UILabel!
    @IBOutlet weak var descriptionCharacter: UILabel!
    
    //private var receivedImageCharacter: UIImage!
    private(set) var urlImageCharacter: String!
    private(set) var receivedNameCharacter: String!
    private(set) var receivedDesCharacter: String!
    
    
    public static func newInstace(urlCharacter: String, nameCharacter: String, descriptionCharacter: String) -> DetailViewController? {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: DetailViewController.detailViewControllerIdentifier) as! DetailViewController
        //vc.receivedImageCharacter = imageCharacter
        vc.urlImageCharacter = urlCharacter
        vc.receivedNameCharacter = nameCharacter
        vc.receivedDesCharacter = descriptionCharacter
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        characterImage.sd_setImage(with: URL(string: urlImageCharacter), placeholderImage: UIImage(named: "placeholder.png"))
        nameCharacter.text = receivedNameCharacter
        descriptionCharacter.text = receivedDesCharacter
    }
    
    /*public func configure(image receivedImage: UIImage, name receivedName: String, description des: String){
        receivedImageCharacter = receivedImage
        receivedNameCharacter = receivedName
        receivedDesCharacter = des
    }*/

}
