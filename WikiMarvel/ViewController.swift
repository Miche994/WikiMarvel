//
//  ViewController.swift
//  WikiMarvel
//
//  Created by Betacom on 08/11/21.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    //let charactersList: [MarvelCharacter] = MarvelCharacterDataSource.init().characters
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)

        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        
    }
    
  


}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //collectionView.deselectItem(at: indexPath, animated: true)
        
        print("You tapped me")
    }
    
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return charactersList.count
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        
        
        /*URLSession.shared.dataTask(with: URL(string: charactersList[indexPath.row].imageURL)!) {
            data, response, error in
            guard let data = data,
                  let image = UIImage(data: data) else {
                      return
            }
            DispatchQueue.main.async {
                cell.imageView.image = image}
            }.resume()
        
        */
        //cell.imageView.image = UIImage(named: "IronManimage")
        
        cell.configure(with: UIImage(named: "IronManImage")!)
        
        return cell
    }
    
    
}

