//
//  Model.swift
//  Register User
//
//  Created by Pratik Gavit on 11/02/23.
//

import Foundation

struct RegisterModel : Encodable {
    let name : String
    let email : String
    let password : String
}

struct AuthError: Codable {
    let code: Int
    let message: String
}


struct LogInModel : Encodable {
    let login : String
    let password : String
}
