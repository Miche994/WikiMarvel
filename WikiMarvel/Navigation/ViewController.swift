//
//  ViewController.swift
//  WikiMarvel
//
//  Created by Betacom on 08/11/21.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private static let kStoryBoardIdentifier = "Main"
    private static let kViewControllerIdentifier = "ViewController"
    private static let cellWidth = 150
    private static let cellHeight = 200
    private static let horizontalInset: CGFloat = 20
    private static let verticalInset: CGFloat = 10
    
    @IBOutlet private weak var collectionView: UICollectionView!

    //private weak var imageDataSource: ImageDataSource!
    private var networkManager: NetworkManager!
    
    //private let charactersList = MarvelCharacterDataSource().characters
    private var charactersInformationsArray = [CharacterInformations]()  //?????????
    
    public static func newInstance(networkManager: NetworkManager) -> ViewController {
        let vc = UIStoryboard(name: Self.kStoryBoardIdentifier, bundle: nil).instantiateViewController(withIdentifier: Self.kViewControllerIdentifier) as! ViewController
        vc.networkManager = networkManager
        return vc
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        
        
        collectionView.register(CharacterCollectionViewCell.nib(), forCellWithReuseIdentifier: CharacterCollectionViewCell.kIdentifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: ViewController.cellWidth, height: ViewController.cellHeight)
        
        collectionView.collectionViewLayout = layout
        collectionView!.contentInset = UIEdgeInsets(top: ViewController.verticalInset, left: ViewController.horizontalInset, bottom: ViewController.verticalInset, right: ViewController.horizontalInset)
        
        updateUI()
        
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        guard let vc = CharacterDetailsViewController.newInstance(urlString: makeUrlStringImage(thumbnail: charactersInformationsArray[indexPath.row].thumbnail), characterName: charactersInformationsArray[indexPath.row].name, characterDescription: charactersInformationsArray[indexPath.row].description) else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return charactersInformationsArray.count
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.kIdentifier, for: indexPath) as! CharacterCollectionViewCell
        
        cell.configure(urlString: makeUrlStringImage(thumbnail: charactersInformationsArray[indexPath.row].thumbnail), name: charactersInformationsArray[indexPath.row].name, description: charactersInformationsArray[indexPath.row].description)
            
        return cell
    }
    
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ViewController.cellWidth, height: ViewController.cellHeight)
    }
    
    
    func makeUrlStringImage(thumbnail: Thumbnail) -> String {       //  Where ?
        return thumbnail.path + "/portrait_medium." + thumbnail.urlExtension
    }
    
    func updateUI() {
        networkManager.getCharacters {
            charactersInformations, error in
            
            guard !charactersInformations!.isEmpty else {
                print("Loading data problem")
                return
            }
            
            self.charactersInformationsArray = charactersInformations!
            //print(self.charactersInformationsArray!)
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
          
        }
        
    }
}

