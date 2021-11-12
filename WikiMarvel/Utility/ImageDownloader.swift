//
//  Downloader.swift
//  WikiMarvel
//
//  Created by Betacom on 09/11/21.
//

import UIKit
import Foundation

class ImageDownloader {
    
    private static let setSomeDomain = "Somedomain"
    private static let code = 101
    

    func newImageDownload(urlString: String, completion: @escaping (UIImage?, Error?) -> Void) {
        URLSession.shared.dataTask(with: URL(string: urlString)!) {
            data, response, error in
            guard error == nil else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            guard let data = data, let image = UIImage(data: data) else {
                DispatchQueue.main.async {
                    completion(nil, NSError(domain: ImageDownloader.setSomeDomain, code: ImageDownloader.code, userInfo: nil))
                }
                return
            }
            DispatchQueue.main.async {
                completion(image, nil)
            }
        }.resume()
    }
    
}
