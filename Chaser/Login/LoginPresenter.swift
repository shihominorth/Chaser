//
//  LoginPresenter.swift
//  Chaser
//
//  Created by 北島　志帆美 on 2022-05-25.
//

import Foundation

protocol LoginPresentation: AnyObject {
    func signInBtnDidPush(userName: String, password: String)
}

class LoginPresenter: LoginPresentation {
    
    // View, Interactor, Routerへのアクセスはprotocolを介して行う
    // Viewは循環参照にならないよう`weak`プロパティ
    private weak var view: LoginView?
    private let router: LoginWireframe
    private let interactor: LoginUseCase
    
    init(view: LoginView, router: LoginRouter, interactor: LoginUseCase) {
        
        self.view = view
        self.router = router
        self.interactor = interactor
        
    }
    
    func signInBtnDidPush(userName: String, password: String) {
        
        interactor.signIn(userName: userName, password: password)
        
    }
    
    
}
