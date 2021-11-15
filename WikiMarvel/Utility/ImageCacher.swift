//
//  ImageChacher.swift
//  WikiMarvel
//
//  Created by Betacom on 10/11/21.
//

import Foundation
import UIKit

class ImageCacher {
    
    private let cache = NSCache<NSString, UIImage>()
    
    
    // MARK: new image is added for caching
    
    public func addImageForCaching(withURL url: String, image: UIImage) {
        
        let itemUrl = NSString(string: url)
        self.cache.setObject(image, forKey: itemUrl)
    }
    
    
    // MARK: If present return cached image
    
    public func newCachedImage(withURL url: String) -> UIImage? {
        let itemUrl = NSString(string: url)
        
        if let cachedImage = self.cache.object(forKey: itemUrl) {
            print("Cached image for item: \(itemUrl)")
            return cachedImage
        } else {
            return nil
        }
        
    }
    
    
}
