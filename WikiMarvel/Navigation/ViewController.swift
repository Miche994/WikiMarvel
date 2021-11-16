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
    
    private let charactersList = MarvelCharacterDataSource().characters
    private weak var imageDataSource: ImageDataSource!


    
    public static func newInstance(dataSource: ImageDataSource) -> ViewController {
        let vc = UIStoryboard(name: Self.kStoryBoardIdentifier, bundle: nil).instantiateViewController(withIdentifier: Self.kViewControllerIdentifier) as! ViewController
        vc.imageDataSource = dataSource
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
        
        
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        imageDataSource?.getMarvelImage(withURL: charactersList[indexPath.row].imageURL, completion: { [self] image, error in
            guard let image = image else { return }
            

            guard let vc = CharacterDetailsViewController.newInstance(characterImage: image, characterName: charactersList[indexPath.row].name, characterDescription: charactersList[indexPath.row].description) else {
                return
            }
            self.navigationController?.pushViewController(vc, animated: true)
        })
        
    }

    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return charactersList.count
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.kIdentifier, for: indexPath) as! CharacterCollectionViewCell
        
        imageDataSource?.getMarvelImage(withURL: charactersList[indexPath.row].imageURL, completion: { image, error in
            guard let image = image else { return }
            cell.configure(with: image, name: self.charactersList[indexPath.row].name, description: self.charactersList[indexPath.row].description)
        })
            
        return cell
    }
    
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ViewController.cellWidth, height: ViewController.cellHeight)
    }
}

