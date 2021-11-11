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
    private var receivedNameCharacter: String = ""
    private var receivedDesCharacter: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        characterImage.image = receivedImageCharacter
        nameCharacter.text = receivedNameCharacter
        descriptionCharacter.text = receivedDesCharacter
        // Do any additional setup after loading the view.
    }
    
    public func configure(image receivedImage: UIImage, name receivedName: String, description des: String){
        receivedImageCharacter = receivedImage
        receivedNameCharacter = receivedName
        receivedDesCharacter = des
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
