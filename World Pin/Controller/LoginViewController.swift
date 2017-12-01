//
//  LoginViewController.swift
//  World Pin
//
//  Created by Yi-Yun Chen on 2017/11/26.
//  Copyright © 2017年 Yi-Yun Chen. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController {

    @IBOutlet weak var normalLoginButton: UIButton!
    @IBOutlet weak var fbLoginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var accountTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiBeautify()
    }
    
    func uiBeautify() {
        accountTextField.underlined()
        passwordTextField.underlined()
        registerButton.clearButton()
        titleLabel.addshadow()
        normalLoginButton.addshadow()
        fbLoginButton.addshadow()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func normalLoginPressed(_ sender: Any) {
        // todo: 依照email從資料庫抓出user並比對資料，正確就跳至首頁，錯就顯示訊息
    }
    
    @IBAction func fbLoginButtonPressed(_ sender: Any) {
        FBSDKLoginManager().logIn(withReadPermissions: ["public_profile", "email", "user_friends"], from: self) { (result, error) in
            
            if error != nil{
                print("longinerror =\(error.debugDescription)")
                return
            }
            
            User.fetchProfile(completion: { (error) in
                if error == nil {
                    self.performSegue(withIdentifier: "unwindToFirstPage", sender: nil)
                } else {
                    print(error.debugDescription)
                }
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
