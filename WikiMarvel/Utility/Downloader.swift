//
//  Downloader.swift
//  WikiMarvel
//
//  Created by Betacom on 09/11/21.
//

import UIKit
import Foundation

class Downloader {
    
    private var image: UIImage?

    func downloadDataFromURL(urlString: String, nameCharacters: String, cell: MyCollectionViewCell) {
        URLSession.shared.dataTask(with: URL(string: urlString)!) {
            data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                return
            }
            DispatchQueue.main.async { 
                cell.configure(with: image, name: nameCharacters)
            }
        }.resume()
        
    }
}
