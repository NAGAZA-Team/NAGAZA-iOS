//
//  SnsLogin.swift
//  Nagaza
//
//  Created by Nat Kim on 2024/03/20.
//

import Foundation

// MARK: Apple
struct AppleLogin {
    let identityToken: String
    let authorizationCode: String
    let userName: String?
    let userEmail: String?
}

struct NagazaAppleUserCheckMemberDTO: Encodable {
    let identityToken: String
    let authorizationCode: String
}

