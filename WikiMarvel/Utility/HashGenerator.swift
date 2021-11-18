//
//  HashGenerator.swift
//  WikiMarvel
//
//  Created by Betacom on 16/11/21.
//

import Foundation
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG

//protocol HashDataSource  /????????

class HashGenerator {
    
    public static let kPublicKey = "5af45a580380f6be53110129c3199469"
    private static let kPrivateKey = "e00fd76412aa1d6e7eb8bad1faa970bc5d090780"
    private static let kStringFormat = "%02hhx"
    
    private(set) var currentTimestamp: String!
    
    private func newTimestamp() -> String {
        return String(Int64(Date().timeIntervalSince1970))
    }
    
    private func generateMD5(string: String) -> String {
        let length = Int(CC_MD5_DIGEST_LENGTH)
        let messageData = string.data(using:.utf8)!
        var digestData = Data(count: length)
        
        _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
            messageData.withUnsafeBytes { messageBytes -> UInt8 in
                if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                    let messageLength = CC_LONG(messageData.count)
                    CC_MD5(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
                }
                return 0
            }
        }
        return digestData.map { String(format: Self.kStringFormat, $0) }.joined()
    }
        
    public func getHash() -> String {
        
        currentTimestamp = newTimestamp()  //???????
        
        
        print("ts: \(currentTimestamp!)")
        let baseString = "\(currentTimestamp!)\(Self.kPrivateKey)\(Self.kPublicKey)"
        print ("baseString: \(baseString)")
        let hashString = generateMD5(string: baseString)
        print("hashString: \(hashString)")
        
        return hashString
    }
}
