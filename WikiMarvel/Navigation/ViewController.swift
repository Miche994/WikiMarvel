//
//  ViewController.swift
//  WikiMarvel
//
//  Created by Betacom on 08/11/21.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private static let kSomeString = "You Tapped me!"
    private static let cellWidth = 150
    private static let cellHeight = 200
    private static let horizontalInset: CGFloat = 20
    private static let verticalInset: CGFloat = 10
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private let charactersList = MarvelCharacterDataSource().characters
    private weak var imageDataSource: ImageDataSource!


    
    public static func newInstance(dataSource: ImageDataSource) -> ViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        vc.imageDataSource = dataSource
        return vc
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: ViewController.cellWidth, height: ViewController.cellHeight)
        
        collectionView.collectionViewLayout = layout
        collectionView!.contentInset = UIEdgeInsets(top: ViewController.verticalInset, left: ViewController.horizontalInset, bottom: ViewController.verticalInset, right: ViewController.horizontalInset)
        
        
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        imageDataSource?.getMarvelImage(withURL: charactersList[indexPath.row].imageURL, completion: { image, error in
            guard let image = image else { return }
            
            /*guard let vc = self.storyboard?.instantiateViewController(withIdentifier: ViewController.detailViewControllerIdentifier) as? DetailViewController else {
                return
            }
            
            vc.configure(image: image, name: self.charactersList[indexPath.row].name, description: self.charactersList[indexPath.row].description)*/
            
            guard let vc = DetailViewController.newInstance(imageCharacter: image, nameCharacter: self.charactersList[indexPath.row].name, descriptionCharacter: self.charactersList[indexPath.row].description) else {
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        
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

