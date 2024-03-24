//
//  LoginUseCase.swift
//  Nagaza
//
//  Created by Nat Kim on 2024/03/20.
//

import UIKit
import AuthenticationServices

final class LoginUseCase: NSObject {
    
    private weak var presentationAnchor: ASPresentationAnchor?
   
    
    func executeAppleLogin() { // 매개변수 from viewController: UIViewController
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authController = ASAuthorizationController(authorizationRequests: [request])
        authController.delegate = self
        authController.presentationContextProvider = self
        authController.performRequests()
    }
    
    func checkValidAppleLogin(with model: AppleLogin) {
        //        let checkValue = NagazaAppleUserCheckMemberDTO(
        //            identityToken: model.identityToken,
        //            authorizationCode: model.authorizationCode
        //        )
        //        if checkValue.identityToken.isEmpty != nil {
        //            let homeVC = HomeViewController()
        //        } else {
        //            DispatchQueue.main.async {
        //                let loginVC = LoginViewController()
        //                let window = UIWindow(frame: UIScreen.main.bounds)
        //                window.rootViewController = UINavigationController(rootViewController: loginVC)
        //                window.makeKeyAndVisible()
        //                //Value of type 'LoginUseCase' has no member 'window'
        //            }
        //        }
  
        
    }
}

extension LoginUseCase: ASAuthorizationControllerDelegate {
// Cannot declare conformance to 'NSObjectProtocol' in Swift; 'LoginUseCase' should inherit 'NSObject' instead
    
    func authorizationController(
        controller: ASAuthorizationController,
        didCompleteWithAuthorization authorization: ASAuthorization
    ) {
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            let userIdentifier = appleIDCredential.user
            guard let authCode = appleIDCredential.authorizationCode,
                  let idToken = appleIDCredential.identityToken,
                  let email = appleIDCredential.email else {
                return
            }
            
            let auth = String(data: authCode, encoding: .utf8)!
            let token = String(data: idToken, encoding: .utf8)!
            
            let appleLoginModel = AppleLogin(
                identityToken: token,
                authorizationCode: auth,
                userName: userIdentifier,
                userEmail: email
            )
            
            checkValidAppleLogin(with: appleLoginModel)
           
        default:
            break
        }
    }
    
    func authorizationController(
        controller: ASAuthorizationController,
         didCompleteWithError error: Error
    ) {
        print(error)
    }
    
    func saveKeychain(_ userIdentifier: String) {
        Keychain.shared.set(userIdentifier, forKey: .accessToken)
        // TODO: - accessToken 액세스토큰으로 << Backend 나 팀원들에게 논의
    }
    
}

extension LoginUseCase: ASAuthorizationControllerPresentationContextProviding {

    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return presentationAnchor ?? UIWindow()
    }
    
    func setPresentationAnchor(_ anchor: ASPresentationAnchor?) {
        presentationAnchor = anchor
    }
}

