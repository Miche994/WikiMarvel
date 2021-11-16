//
//  NetworkManager.swift
//  WikiMarvel
//
//  Created by Betacom on 16/11/21.
//

import Foundation


struct CharResult: Codable {
    let status: String
    let copyright: String
    let attributionText: String
}


class NetworkManager {
    
    private static let kUrlString = "https://gateway.marvel.com/v1/public/characters"
    private static let kQueryApiKeyName = "apikey"
    private static let kQueryHashName = "hash"
    private static let kQueryLimitName = "limit"
    private static let kQueryLimitValue = "100"
    private static let kQueryTimestampName = "ts"
    
    private let hashGenerator: HashGenerator!
    
    init(hashGenerator: HashGenerator){
        self.hashGenerator = hashGenerator
    }
    
    func getChars() {
        let apiKeyQuery = URLQueryItem(name: Self.kQueryApiKeyName, value: HashGenerator.kPublicKey)
        let hashQuery = URLQueryItem(name: Self.kQueryHashName, value: hashGenerator.getHash())
        let limitQuery = URLQueryItem(name: Self.kQueryLimitName, value: Self.kQueryLimitValue)
        let timeStampQuery = URLQueryItem(name: Self.kQueryTimestampName, value: hashGenerator.currentTimestamp)
        var baseURL = URLComponents(string: Self.kUrlString)!
        baseURL.queryItems = [apiKeyQuery, timeStampQuery, hashQuery, limitQuery]
        
        let url = baseURL.url!
        print(url)
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url), completionHandler: { data, response, error in
            print("error: \(String(describing: error))")
            print("res: \(String(describing: response))")  //TODO: handle case
            print("data: \(String(describing: data))")
            let myObj = try! JSONDecoder().decode(CharResult.self, from: data!)
            print("myOjb: \(myObj)")
        })
        task.resume()
    }
}
