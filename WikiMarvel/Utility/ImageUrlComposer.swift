//
//  ImageUrlComposer.swift
//  WikiMarvel
//
//  Created by Betacom on 18/11/21.
//

import Foundation

enum ImageUrlComposer {
    case portrait_small, portrait_medium, portrait_xlarge
    case standard_small, standard_medium, standard_large
    case landscape_small, landscape_medium, landscape_large
    
    func makeUrl(thumbnail: Thumbnail) -> String {
        
        switch self {
        case .portrait_small:
            return thumbnail.path + "/" + "portrait_small" + "." + thumbnail.urlExtension
        case .portrait_medium:
            return thumbnail.path + "/" + "portrait_medium" + "." + thumbnail.urlExtension
        case .portrait_xlarge:
            return thumbnail.path + "/" + "portrait_xlarge" + "." + thumbnail.urlExtension
        case .standard_small:
            return thumbnail.path + "/" + "standard_small" + "." + thumbnail.urlExtension
        case .standard_medium:
            return thumbnail.path + "/" + "standard_medium" + "." + thumbnail.urlExtension
        case .standard_large:
            return thumbnail.path + "/" + "standard_large" + "." + thumbnail.urlExtension
        case .landscape_small:
            return thumbnail.path + "/" + "landscape_small" + "." + thumbnail.urlExtension
        case .landscape_medium:
            return thumbnail.path + "/" + "landscape_medium" + "." + thumbnail.urlExtension
        case .landscape_large:
            return thumbnail.path + "/" + "landscape_large" + "." + thumbnail.urlExtension
        }
        
    }
}
