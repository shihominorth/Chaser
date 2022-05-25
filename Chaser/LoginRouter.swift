//
//  LoginRouter.swift
//  
//
//  Created by 北島　志帆美 on 2022-05-25.
//

import UIKit

protocol LoginWireframe: AnyObject {
    func toHome()
}

class LoginRouter {
    
    // 画面遷移のためにViewControllerが必要。initで受け取る
    private unowned var viewController: UIViewController

      private init(viewController: UIViewController) {
          self.viewController = viewController
      }
    
    
    // DI
    static func assembleModules() -> UIViewController {
       
        guard let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginVC") as? LoginViewController else {
            fatalError()
        }
        let router = LoginRouter(viewController: view)
        let interactor = LoginInteractor()
        // PresenterはView, Interactor, Routerそれぞれ必要なので
        // 生成し、initの引数で渡す
        let presenter = LoginPresenter(
            view: view,
            router: router,
            interactor: interactor
        )

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
       
        return view
    }
    
}

extension LoginRouter: LoginWireframe {
    func toHome() {
        
    }
}
