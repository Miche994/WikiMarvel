//
//  ImageChacher.swift
//  WikiMarvel
//
//  Created by Betacom on 10/11/21.
//

import Foundation
import UIKit

class ImageChacher {
    
    private let cache = NSCache<NSNumber, UIImage>()
    
    
    // MARK: new image is added for caching
    
    public func addImageForCaching(index indexPath: IndexPath, image: UIImage) {
        
        let itemNumber = NSNumber(value: indexPath.item)
        self.cache.setObject(image, forKey: itemNumber)
    }
    
    
    // MARK: If present return cached image
    
    public func newChachedImage(index indexPath: IndexPath) -> UIImage? {
        let itemNumber = NSNumber(value: indexPath.item)
        
        if let cachedImage = self.cache.object(forKey: itemNumber) {
            print("Cached image for item: \(itemNumber)")
            return cachedImage
        } else {
            return nil
        }
        
    }
    
    
}
