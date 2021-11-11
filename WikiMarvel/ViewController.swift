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
    private static let orizontalInset: CGFloat = 20
    private static let verticalInset: CGFloat = 10
    
    private let charactersList = MarvelCharacterDataSource().characters
    private let imageDownloader = Downloader()
    
    private let imageCacher = ImageChacher()

    @IBOutlet private weak var collectionView: UICollectionView!
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: ViewController.cellWidth, height: ViewController.cellHeight)
        
        collectionView.collectionViewLayout = layout
        collectionView!.contentInset = UIEdgeInsets(top: ViewController.verticalInset, left: ViewController.orizontalInset, bottom: ViewController.verticalInset, right: ViewController.orizontalInset)
        
        
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //collectionView.deselectItem(at: indexPath, animated: true)
        
        if let cell = collectionView.cellForItem(at: indexPath) as? MyCollectionViewCell {
            print(cell.nameLabel.text!)
        
        
            if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            
                vc.configure(image: cell.imageView.image!, name: cell.nameLabel.text!, description: cell.descriptionCharacter)
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
        }
    }

    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return charactersList.count
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        
        cell.makeEmpty()

        
        // Cached image is used if present inside imageCacher else a new image is downloaded and cached
        
        if let cachedImage = imageCacher.newChachedImage(index: indexPath) {
                    
            cell.configure(with: cachedImage, name: self.charactersList[indexPath.row].name, description: self.charactersList[indexPath.row].description)
            
        } else {
        
            imageDownloader.newImageDownload(urlString: charactersList[indexPath.row].imageURL) { [self]
                
                image, error in
                if(image != nil) {
                    cell.configure(with: image!, name: self.charactersList[indexPath.row].name, description: self.charactersList[indexPath.row].description)
                    imageCacher.addImageForCaching(index: indexPath, image: image!)
                }
                
            }
            
        }
        

        return cell
    }
    
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ViewController.cellWidth, height: ViewController.cellHeight)
    }
}

