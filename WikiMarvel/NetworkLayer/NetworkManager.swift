//
//  NetworkManager.swift
//  WikiMarvel
//
//  Created by Betacom on 16/11/21.
//

import Foundation

class NetworkManager {
    
    private static let kUrlString = "http://gateway.marvel.com/v1/public/characters"
    private static let kQueryApiKeyName = "apikey"
    private static let kQueryHashName = "hash"
    private static let kQueryLimitName = "limit"
    private static let kQueryLimitValue = "100"
    private static let kQueryTimestampName = "ts"
    private static let kStatusCode = 200
    
    private let hashGenerator: HashGenerator!
    
    
    init(hashGenerator: HashGenerator){
        self.hashGenerator = hashGenerator
    }
    
    
    func getCharacters(completion: @escaping ([CharacterInformations]?, Error?) -> Void) {
        let apiKeyQuery = URLQueryItem(name: Self.kQueryApiKeyName, value: HashGenerator.kPublicKey)
        let hashQuery = URLQueryItem(name: Self.kQueryHashName, value: hashGenerator.getHash())
        let limitQuery = URLQueryItem(name: Self.kQueryLimitName, value: Self.kQueryLimitValue)
        let timeStampQuery = URLQueryItem(name: Self.kQueryTimestampName, value: hashGenerator.currentTimestamp)
        
        guard var urlComponent = URLComponents(string: Self.kUrlString) else {
            //let error = NSError(domain: someDomain, code: 401, userInfo: nil) // TODO: handle this case
            return
        }
        
        urlComponent.queryItems = [apiKeyQuery, timeStampQuery, hashQuery, limitQuery]
        
        guard let url = urlComponent.url else {
            //let error = NSError(domain: someDomain, code: 401, userInfo: nil)
            return
        }
        
        print(url)
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url), completionHandler: {
            data, response, error in
            
            guard error == nil else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == Self.kStatusCode else {
                DispatchQueue.main.async {
                    completion(nil, error) // TODO: handle response
                }
                return

            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            
            DispatchQueue.main.async {
            
                //print("res: \(String(describing: response))")
                //print("data: \(String(describing: data))")
                
                let dataObjectsFromJSON = try! JSONDecoder().decode(DataObjectsFromJSON.self, from: data)
                //print("dataObjectFromJSON: \(dataObjectsFromJSON)")
                
                completion(dataObjectsFromJSON.charactersData.characterInformations, nil)
            }
        })
        task.resume()
    }
}
