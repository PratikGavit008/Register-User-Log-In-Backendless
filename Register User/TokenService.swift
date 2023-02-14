//
//  TokenService.swift
//  Register User
//
//  Created by Pratik Gavit on 11/02/23.
//

import Foundation

class TokenService {
    
    static let shared = TokenService()
    private init(){}
    private let userDefaults = UserDefaults.standard
    
    func storeToken(token:String) {
        userDefaults.set(token, forKey: Token.logInKey)
    }
    
    func getToken()->String {
        if let key = userDefaults.object(forKey: Token.logInKey) as? String{
            return key
        } else {
            return ""
        }
    }
    
    func deleteToken() {
        userDefaults.set("", forKey: Token.logInKey)
    }
    
    func isLoggedIn()->Bool {
        if getToken() == ""{
            return false
        } else {
            return true
        }
    }
}
