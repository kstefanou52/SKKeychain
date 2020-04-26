//
//  KeychainQuery.swift
//  SKKeychain
//
//  Created by kostis stefanou on 1/16/20.
//  Copyright © 2020 silonk. All rights reserved.
//

import Foundation

public protocol KeychainQueryConfiguration: NSObjectProtocol {

    var tag: String? { get set }

    var secClass: Keychain.SecClass { get set }
    
    var serverUrl: URL? { get set }
    
    var service: String { get set }
    
    var accessGroup: String? { get set }
    
    var protocolType: Keychain.ProtocolType? { get set }
    
    var authenticationType: Keychain.AuthenticationType { get set }
    
    var otherParameters: [String: Any]? { get set }
    
    func setValueToStore(_ value: AnyObject)
    
    func dictionary() -> [String: Any]
}

// MARK: - Default Fuctionality

public extension KeychainQueryConfiguration {
    
    func setValueToStore(_ value: AnyObject) {
        var queryDictionary = dictionary()
        queryDictionary[kSecValueData as String] = value
    }
    
    func dictionary() -> [String: Any] {
        var query: [String: Any] = [:]

        query[Keychain.Tag.key] = tag
        query[Keychain.SecClass.key] = secClass.value
        if let accessGroup = accessGroup { query[Keychain.AccessGroup.key] = accessGroup }
        
        switch secClass {
        case .genericPassword:
            query[Keychain.Service.key] = service
            
        case .internetPassword:
            query[Keychain.ServerURL.key] = serverUrl?.host
            query[Keychain.ServerPort.key] = serverUrl?.port
            query[Keychain.ProtocolType.key] = protocolType?.value
            query[Keychain.AuthenticationType.key] = authenticationType.value
                
        case .certificate, .keyItem, .identity: break
        }
        
        
        if let otherParameters = otherParameters {
            query.merge(otherParameters, uniquingKeysWith: { (currentDictionaryValue, newDictionaryValue) -> Any in
                return newDictionaryValue
            })
        }
        
        return query
    }
}
