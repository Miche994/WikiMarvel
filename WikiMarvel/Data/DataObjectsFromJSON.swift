//
//  CharactersData.swift
//  WikiMarvel
//
//  Created by Betacom on 17/11/21.
//

import Foundation

struct DataObjectsFromJSON: Codable {
    let status: String
    let copyright: String
    let attributionText: String
    let charactersData: CharactersData
    
    enum CodingKeys: String, CodingKey {
        case status 
        case copyright
        case attributionText
        case charactersData = "data"
    }
    
}

struct CharactersData: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let characterInformations: [CharacterInformations]
    
    enum CodingKeys: String, CodingKey {
        case offset
        case limit
        case total
        case count
        case characterInformations = "results"
    }
}

struct CharacterInformations: Codable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail
}

struct Thumbnail: Codable {
    let path: String
    let urlExtension: String
    
    enum CodingKeys: String, CodingKey {
        case path
        case urlExtension = "extension"
    }
}
