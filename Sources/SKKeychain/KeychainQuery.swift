//
//  KeychainQuery.swift
//  SKKeychain
//
//  Created by kostis stefanou on 1/18/20.
//  Copyright © 2020 silonk. All rights reserved.
//

import Foundation

public final class KeychainQuery: NSObject, KeychainQueryConfiguration {
    
    var secClass: Keychain.SecClass
    
    var serverUrl: URL?
    
    var service: String
    
    var accessGroup: String?
    
    var protocolType: Keychain.ProtocolType?
    
    var authenticationType: Keychain.AuthenticationType
    
    var otherParameters: [String : Any]?
    
    init(completion: (KeychainQueryConfiguration) -> (Void)) {
        self.secClass = .keyItem
        self.service = "keychain.generic.service"
        self.authenticationType = .Default
        super.init()
        completion(self)
    }
}
