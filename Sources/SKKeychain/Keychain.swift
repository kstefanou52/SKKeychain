//
//  KeychainManager.swift
//  SKKeychain
//
//  Created by kostis stefanou on 1/12/20.
//  Copyright © 2020 silonk. All rights reserved.
//

import Foundation
import Security

public struct Keychain {
    
    public private(set) var query: KeychainQuery
    
    public init(withQuery query: KeychainQuery) {
        self.query = query
    }
    
    // MARK: - Methods
    
    public func store(value: String) throws {
        guard let data = value.data(using: .utf8, allowLossyConversion: false) else { throw Keychain.Status.unableToConvertString }
        try store(value: data)
    }
    
    public func store(value: Data) throws {
        query.setValueToStore(value as AnyObject)
        let queryDictionary = query.dictionary()
        let status = SecItemAdd(queryDictionary as CFDictionary, nil)
        
        guard status == noErr else { throw Keychain.Status.unableToStoreData }
    }
    
    public func retrieve() throws -> String {
        guard let retrievedString = try String(data: retrieve(), encoding: .utf8) else { throw Keychain.Status.unableToConvertString }
        return retrievedString
    }
    
    public func retrieve() throws -> Data {
        var queryDictionary = query.dictionary()
        queryDictionary[kSecMatchLimit as String] = kSecMatchLimitOne
        queryDictionary[kSecReturnAttributes as String] = kCFBooleanTrue
        queryDictionary[kSecReturnData as String] = kCFBooleanTrue
        
        var queryResult: AnyObject?
        let status = withUnsafeMutablePointer(to: &queryResult) {
            SecItemCopyMatching(queryDictionary as CFDictionary, UnsafeMutablePointer($0))
        }
        
        guard status == noErr else {
            switch status {
            case errSecItemNotFound: throw Keychain.Status.itemNotFound
            default: throw Keychain.Status.otherError(status)
            }
        }
        
       guard let resultDictionary = queryResult as? [String: AnyObject],
        let data = resultDictionary[kSecValueData as String] as? Data else { throw Keychain.Status.invalidData }
        return data
    }
    
    public func update(attributes: [String: Any]) throws {
        let queryDictionary = query.dictionary()
        let status = SecItemUpdate(queryDictionary as CFDictionary, attributes as CFDictionary)
    
        switch status {
        case errSecItemNotFound: throw Keychain.Status.itemNotFound
        default: throw Keychain.Status.otherError(status)
        }
    }
    
    public func delete() throws {
        let queryDictionary = query.dictionary()
        let status = SecItemDelete(queryDictionary as CFDictionary)
        
        switch status {
        case errSecItemNotFound: throw Keychain.Status.itemNotFound
        default: throw Keychain.Status.otherError(status)
        }
    }
}
