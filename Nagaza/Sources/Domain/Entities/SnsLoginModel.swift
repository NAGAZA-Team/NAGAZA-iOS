//
//  SnsLoginModel.swift
//  Nagaza
//
//  Created by Nat Kim on 2024/02/28.
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
