//
//  RegisterTableViewController.swift
//  World Pin
//
//  Created by Yi-Yun Chen on 2017/11/27.
//  Copyright © 2017年 Yi-Yun Chen. All rights reserved.
//

import UIKit

class RegisterTableViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiBeautify()
    }
    
    func uiBeautify() {
        emailTextField.delegate = self
        emailTextField.underlined()
        nameTextField.delegate = self
        nameTextField.underlined()
        passwordTextField.delegate = self
        passwordTextField.underlined()
        confirmPasswordTextField.delegate = self
        confirmPasswordTextField.underlined()
        titleLabel.addshadow()
        submitButton.addshadow()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        
        if let email = emailTextField.text, let name = nameTextField.text, let password = passwordTextField.text, let confirmPassword = confirmPasswordTextField.text{
            
            guard !(email.isReallyEmpty) else {
                let alert = MESSAGE(title: "", message: "請輸入email")
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            guard !(name.isReallyEmpty) else {
                let alert = MESSAGE(title: "", message: "請輸入您的暱稱")
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            guard !(password.isEmpty) else {
                let alert = MESSAGE(title: "", message: "請輸入密碼")
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            guard !(confirmPassword.isEmpty) else {
                let alert = MESSAGE(title: "", message: "請確認您的密碼")
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            guard password == confirmPassword else {
                let alert = MESSAGE(title: "", message: "密碼與確認密碼不相符")
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            // 存取user資料  todo: 將新user的資料存入資料庫，註冊後自動登入
            
            CURRENT_USER = User(email: email, name: name, password: password, userType: .normal)
            
            //let userDefault = UserDefaults.standard
            //userDefault.setValue(email, forKey: "email")
            //userDefault.synchronize()
            
            self.performSegue(withIdentifier: "unwindToFirstPage", sender: self)
        }
        
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
