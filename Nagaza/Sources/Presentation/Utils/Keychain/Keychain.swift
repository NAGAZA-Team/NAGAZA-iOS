//
//  Keychain.swift
//  Nagaza
//
//  Created by SeungMin on 2023/11/01.
//

import Security
import Foundation

final class Keychain {
    
    static let shared = Keychain()
    
    private let lock: NSLock = NSLock() // 멀티 스레드 환경에서 객체의 멤버에 동시 접근 방지
    private var lastResultCode: OSStatus = noErr
    
    private init() { }
    
    enum TokenType: String {
        case accessToken
        case refreshToken
    }
    
    @discardableResult
    func set(_ value: String, forKey key: TokenType) -> Bool {
        if let value = value.data(using: String.Encoding.utf8) {
            return set(value, forKey: key)
        }
        
        return false
    }
    
    @discardableResult
    func set(_ value: Data, forKey key: TokenType) -> Bool {
        lock.lock()
        defer { lock.unlock() }
        
        let keyChainQuery: NSDictionary = [
            kSecClass : kSecClassGenericPassword,
            kSecAttrAccount: key.rawValue,
            kSecValueData: value
        ]
        
        deleteNolock(key)
        lastResultCode = SecItemAdd(keyChainQuery, nil)
        
        return lastResultCode == noErr
    }
    
    func get(_ key: TokenType) -> String? {
        if let data = getData(key) {
            if let currentString = String(data: data, encoding: .utf8) {
                return currentString
            }
            
            lastResultCode = -67853 // errSecInvalidEncoding
        }
        
        return nil
    }
    
    func getData(_ key: TokenType) -> Data? {
        lock.lock()
        defer { lock.unlock() }
        
        let query: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key.rawValue,
            kSecReturnData: kCFBooleanTrue as Any,
            kSecMatchLimit: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        
        lastResultCode = withUnsafeMutablePointer(to: &result) {
            SecItemCopyMatching(query as CFDictionary,
                                UnsafeMutablePointer($0))
        }
        
        if lastResultCode == noErr { return result as? Data }
        return nil
    }
    
    @discardableResult
    func delete(_ key: TokenType) -> Bool {
        lock.lock()
        defer { lock.unlock() }
        
        return deleteNolock(key)
    }
    
    @discardableResult
    func deleteNolock(_ key: TokenType) -> Bool {
        let keyChainQuery: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key.rawValue
        ]
        
        lastResultCode = SecItemDelete(keyChainQuery)
        return lastResultCode == noErr
    }
    
    @discardableResult
    func clear() -> Bool {
        lock.lock()
        defer { lock.unlock() }
        
        let keyChainQuery: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
        ]
        
        lastResultCode = SecItemDelete(keyChainQuery)
        return lastResultCode == noErr
    }
}

