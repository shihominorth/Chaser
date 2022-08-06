//
//  LoginInteractor.swift
//  Chaser
//
//  Created by 北島　志帆美 on 2022-05-25.
//

import Foundation
import AWSMobileClient

protocol SignInUseCase: AnyObject {
    func signIn(userName: String, password: String)
}

final class SignInInteractor: SignInUseCase {
    
    weak var presenter: SignInPresentation?
    
    func signIn(userName: String, password: String) {
        
        AWSMobileClient.default().signIn(username: userName, password: password) { (result, error) in
           
            if let error = error {
    
                print("### signin error:", error.localizedDescription)
    
            }
            
            print("### Signin success")
        }
    }
    
}
