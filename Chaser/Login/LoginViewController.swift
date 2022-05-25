//
//  LoginViewController.swift
//  Chaser
//
//  Created by 北島　志帆美 on 2022-05-25.
//

import UIKit

protocol LoginView: AnyObject {
    func signInBtnPushed()
}

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var signInBtn: UIButton!
    
    // Presenterへのアクセスはprotocolを介して行う
    var presenter: LoginPresentation!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        signInBtn.addTarget(self, action: #selector(signInBtnPushed), for: .touchUpInside)

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension LoginViewController: LoginView {
   
    @objc func signInBtnPushed() {
        
        guard let userName = userNameTxtField.text, let password = passwordTxtField.text else { return }
        
        presenter.signInBtnDidPush(userName: userName, password: password)
        
    }
    
    
}
