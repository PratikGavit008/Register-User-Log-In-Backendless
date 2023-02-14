//
//  File.swift
//  Register User
//
//  Created by Pratik Gavit on 11/02/23.
//

import Foundation

    let application_id = "26919E67-C606-8674-FFE3-C8CDD338B700"
    let api_key = "A1BE5583-CABC-490F-B927-C85EB6EFC618"
    let base_url = "https://api.backendless.com/\(application_id)/\(api_key)/users/"
    let registerUrl = "\(base_url)register"
    let logInUrl = "\(base_url)login"
    let logOutUrl = "\(base_url)logout"

struct Token {
    static let logInKey = "LogInKey"
}
