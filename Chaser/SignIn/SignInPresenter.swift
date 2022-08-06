//
//  LoginPresenter.swift
//  Chaser
//
//  Created by 北島　志帆美 on 2022-05-25.
//

import Foundation

protocol SignInPresentation: AnyObject {
    func signInBtnDidPush(userName: String, password: String)
}

class SignInPresenter: SignInPresentation {
    
    // View, Interactor, Routerへのアクセスはprotocolを介して行う
    // Viewは循環参照にならないよう`weak`プロパティ
    private weak var view: SignInView?
    private let router: SignInWireframe
    private let interactor: SignInUseCase
    
    init(view: SignInView, router: SignInRouter, interactor: SignInUseCase) {
        
        self.view = view
        self.router = router
        self.interactor = interactor
        
    }
    
    func signInBtnDidPush(userName: String, password: String) {
        
        interactor.signIn(userName: userName, password: password)
        
    }
    
    
}
