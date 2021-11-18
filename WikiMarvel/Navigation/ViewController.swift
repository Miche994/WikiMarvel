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
    private static let kCellWidth = 150
    private static let kCellHeight = 200
    private static let kHorizontalInset: CGFloat = 20
    private static let kVerticalInset: CGFloat = 10
    private static let kCollectionIndexPathOffset: Int = 20
    
    @IBOutlet private weak var collectionView: UICollectionView!

    //private weak var imageDataSource: ImageDataSource!
    private var networkManager: NetworkManager!
    
    //private let charactersList = MarvelCharacterDataSource().characters
    private var charactersInformationsArray: [CharacterInformations]!
    
    
    public static func newInstance(networkManager: NetworkManager) -> ViewController {
        let vc = UIStoryboard(name: Self.kStoryBoardIdentifier, bundle: nil).instantiateViewController(withIdentifier: Self.kViewControllerIdentifier) as! ViewController
        vc.networkManager = networkManager
        vc.charactersInformationsArray = [CharacterInformations]()  //?????????
        return vc
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        collectionView.register(CharacterCollectionViewCell.nib(), forCellWithReuseIdentifier: CharacterCollectionViewCell.kIdentifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: ViewController.kCellWidth, height: ViewController.kCellHeight)
        
        collectionView.collectionViewLayout = layout
        collectionView!.contentInset = UIEdgeInsets(top: ViewController.kVerticalInset, left: ViewController.kHorizontalInset, bottom: ViewController.kVerticalInset, right: ViewController.kHorizontalInset)
        
        loadCharactersWithOffset()
        
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
        
        if indexPath.row + Self.kCollectionIndexPathOffset == charactersInformationsArray.count {
            loadCharactersWithOffset(startIndex: charactersInformationsArray.count)
        }
        
        cell.configure(urlString: makeUrlStringImage(thumbnail: charactersInformationsArray[indexPath.row].thumbnail), name: charactersInformationsArray[indexPath.row].name, description: charactersInformationsArray[indexPath.row].description)
            
        return cell
        
    }
    
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ViewController.kCellWidth, height: ViewController.kCellHeight)
        
    }
    
    
    
    // MARK: - Characters loading functions

    func loadCharactersWithOffset(startIndex: Int = 0) {
        networkManager.getCharactersWithOffset(startIndex: startIndex) {
            charactersInformations, error in
            
            guard error == nil else {
                print("\(error!)")
                return
            }
            
            guard !charactersInformations!.isEmpty else {
                print("Loading data problem")
                return
            }
            
            self.charactersInformationsArray += charactersInformations!
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
    }
    
    func makeUrlStringImage(thumbnail: Thumbnail) -> String {       //  Where ??????
        return thumbnail.path + "/portrait_medium." + thumbnail.urlExtension
        
    }
    
}

