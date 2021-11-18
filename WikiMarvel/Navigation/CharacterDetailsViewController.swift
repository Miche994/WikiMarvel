//
//  DetailViewController.swift
//  WikiMarvel
//
//  Created by Betacom on 10/11/21.
//

import UIKit
import SDWebImage

class CharacterDetailsViewController: UIViewController {
    private static let kViewControllerIdentifier = "CharacterDetailsViewController"
    
    @IBOutlet private weak var characterImageView: UIImageView!
    @IBOutlet private weak var characterNameLabel: UILabel!
    @IBOutlet private weak var characterDescriptionLabel: UILabel!
    
    private var receivedImageUrl: String!
    private var receivedCharacterName: String!
    private var receivedCharacterDescription: String!
    
    public static func newInstance(urlString: String, characterName: String, characterDescription: String) -> CharacterDetailsViewController? {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: Self.kViewControllerIdentifier) as! CharacterDetailsViewController
        vc.receivedImageUrl = urlString
        vc.receivedCharacterName = characterName
        vc.receivedCharacterDescription = characterDescription
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        characterImageView.sd_setImage(with: URL(string: receivedImageUrl))
        characterNameLabel.text = receivedCharacterName
        characterDescriptionLabel.text = receivedCharacterDescription
    }

}
