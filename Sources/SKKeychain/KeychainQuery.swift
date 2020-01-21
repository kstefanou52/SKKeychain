//
//  KeychainQuery.swift
//  SKKeychain
//
//  Created by kostis stefanou on 1/18/20.
//  Copyright © 2020 silonk. All rights reserved.
//

import Foundation

public final class KeychainQuery: NSObject, KeychainQueryConfiguration {
    
    public var secClass: Keychain.SecClass
    
    public var serverUrl: URL?
    
    public var service: String
    
    public var accessGroup: String?
    
    public var protocolType: Keychain.ProtocolType?
    
    public var authenticationType: Keychain.AuthenticationType
    
    public var otherParameters: [String : Any]?
    
    public init(completion: (KeychainQueryConfiguration) -> (Void)) {
        self.secClass = .keyItem
        self.service = "keychain.generic.service"
        self.authenticationType = .Default
        super.init()
        completion(self)
    }
}
