//
//  Downloader.swift
//  WikiMarvel
//
//  Created by Betacom on 09/11/21.
//

import UIKit
import Foundation

class Downloader {

    
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
                    completion(nil, NSError(domain: "Somedomain", code: 101, userInfo: nil))
                }
                return
            }
            DispatchQueue.main.async {
                completion(image, nil)
            }
        }.resume()
    }
}
