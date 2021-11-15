//
//  ImageDataProvider.swift
//  WikiMarvel
//
//  Created by Betacom on 12/11/21.
//

import UIKit

protocol ImageDataSource: AnyObject {
   func getMarvelImage(withURL url: String,
                       completion: @escaping (UIImage?, Error?) -> Void)
}

class ImageDataProvider: ImageDataSource{
    
    private let imageDownloader: ImageDownloader
    private let imageCacher: ImageCacher
    
    init(downloader: ImageDownloader, cacheHandler: ImageCacher){
        imageDownloader = downloader
        imageCacher = cacheHandler
    }
    
    func getMarvelImage(withURL url: String, completion: @escaping (UIImage?, Error?) -> Void) {
        
        guard let cachedImage = imageCacher.newCachedImage(withURL: url) else {
            downloadNewImage(withURL: url, completion: completion)
            return
        }
        
        completion(cachedImage, nil)
    }
    
    private func downloadNewImage(withURL url: String, completion: @escaping (UIImage?, Error?) -> Void) {
        imageDownloader.newImageDownload(urlString: url) {
            newImage, error in
            guard error == nil else {
                completion(nil, error)
                return
            }
            self.imageCacher.addImageForCaching(withURL: url, image: newImage!)
            completion(newImage, nil)
        }
    }
    
}


