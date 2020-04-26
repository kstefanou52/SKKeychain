//
//  Keychain+Extensions.swift
//  SKKeychain
//
//  Created by kostis stefanou on 1/16/20.
//  Copyright © 2020 silonk. All rights reserved.
//

import Foundation

public extension Keychain {
    
    enum Service {
        static let key: String = String(kSecAttrService)
    }
    
    enum AccessGroup {
        static let key: String = String(kSecAttrAccessGroup)
    }
    
    enum ServerURL {
        static let key: String = String(kSecAttrServer)
    }
    
    enum ServerPort {
        static let key: String = String(kSecAttrPort)
    }

    enum Tag {
        static let key: String = String(kSecAttrApplicationTag)
    }
    
    enum SecClass {
        
        case internetPassword // Specifies Internet password items.
        case genericPassword // Specifies generic password items.
        case certificate // Specifies certificate items.
        case keyItem // Specifies key items.
        case identity // Specifies identity items.
        
        static let key: String = String(kSecClass)
        
        var value: String {
            switch self {
            case .internetPassword: return String(kSecClassInternetPassword)
            case .genericPassword: return String(kSecClassGenericPassword)
            case .certificate: return String(kSecClassCertificate)
            case .keyItem: return String(kSecClassKey)
            case .identity: return String(kSecClassIdentity)
            }
        }
    }
    
    enum AuthenticationType {
        
        case NTLM
        case MSN
        case DPA
        case RPA
        case HTTPBasic
        case HTTPDigest
        case HTMLForm
        case Default
        
        static let key: String = String(kSecAttrAuthenticationType)
        
        var value: String {
            switch self {
            case .NTLM: return String(kSecAttrAuthenticationTypeNTLM)
            case .MSN: return String(kSecAttrAuthenticationTypeMSN)
            case .DPA: return String(kSecAttrAuthenticationTypeDPA)
            case .RPA: return String(kSecAttrAuthenticationTypeRPA)
            case .HTTPBasic: return String(kSecAttrAuthenticationTypeHTTPBasic)
            case .HTTPDigest: return String(kSecAttrAuthenticationTypeHTTPDigest)
            case .HTMLForm: return String(kSecAttrAuthenticationTypeHTMLForm)
            case .Default: return String(kSecAttrAuthenticationTypeDefault)
            }
        }
    }
    
    enum ProtocolType {
        
        case ftp
        case ftpAccount
        case http
        case irc
        case nntp
        case pop3
        case smtp
        case socks
        case imap
        case ldap
        case appleTalk
        case afp
        case telnet
        case ssh
        case ftps
        case https
        case httpProxy
        case httpsProxy
        case ftpProxy
        case smb
        case rtsp
        case rtspProxy
        case daap
        case eppc
        case ipp
        case nntps
        case ldaps
        case telnetS
        case imaps
        case ircs
        case pop3S
        
        static let key: String = "protocol"
        
        var value: String {
            switch self {
            case .ftp: return String(kSecAttrProtocolFTP)
            case .ftpAccount: return String(kSecAttrProtocolFTPAccount)
            case .http: return String(kSecAttrProtocolHTTP)
            case .irc: return String(kSecAttrProtocolIRC)
            case .nntp: return String(kSecAttrProtocolNNTP)
            case .pop3: return String(kSecAttrProtocolPOP3)
            case .smtp: return String(kSecAttrProtocolSMTP)
            case .socks: return String(kSecAttrProtocolSOCKS)
            case .imap: return String(kSecAttrProtocolIMAP)
            case .ldap: return String(kSecAttrProtocolLDAP)
            case .appleTalk: return String(kSecAttrProtocolAppleTalk)
            case .afp: return String(kSecAttrProtocolAFP)
            case .telnet: return String(kSecAttrProtocolTelnet)
            case .ssh: return String(kSecAttrProtocolSSH)
            case .ftps: return String(kSecAttrProtocolFTPS)
            case .https: return String(kSecAttrProtocolHTTPS)
            case .httpProxy: return String(kSecAttrProtocolHTTPProxy)
            case .httpsProxy: return String(kSecAttrProtocolHTTPSProxy)
            case .ftpProxy: return String(kSecAttrProtocolFTPProxy)
            case .smb: return String(kSecAttrProtocolSMB)
            case .rtsp: return String(kSecAttrProtocolRTSP)
            case .rtspProxy: return String(kSecAttrProtocolRTSPProxy)
            case .daap: return String(kSecAttrProtocolDAAP)
            case .eppc: return String(kSecAttrProtocolEPPC)
            case .ipp: return String(kSecAttrProtocolIPP)
            case .nntps: return String(kSecAttrProtocolNNTPS)
            case .ldaps: return String(kSecAttrProtocolLDAPS)
            case .telnetS: return String(kSecAttrProtocolTelnetS)
            case .imaps: return String(kSecAttrProtocolIMAPS)
            case .ircs: return String(kSecAttrProtocolIRCS)
            case .pop3S: return String(kSecAttrProtocolPOP3S)
            }
        }
    }
    
    enum Status: Error {
        case unableToConvertString
        case unableToStoreData
        case itemNotFound
        case invalidData
        case otherError(OSStatus)
    }
}
