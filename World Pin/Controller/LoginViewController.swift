//
//  LoginViewController.swift
//  World Pin
//
//  Created by Yi-Yun Chen on 2017/11/26.
//  Copyright © 2017年 Yi-Yun Chen. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        fetchProfile()
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
    
    

    @IBOutlet weak var normalLoginButton: UIButton!
    @IBOutlet weak var fbLoginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var accountTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiBeautify()
        
        if (FBSDKAccessToken.current()) != nil{
            fetchProfile()
        }
    }
    
    func uiBeautify() {
        accountTextField.underlined()
        passwordTextField.underlined()
        registerButton.clearButton()
        titleLabel.addshadow()
        normalLoginButton.addshadow()
        fbLoginButton.addshadow()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
            
            self.fetchProfile()
            //Optional(Error Domain=com.facebook.sdk.core Code=8 "(null)" UserInfo={com.facebook.sdk:FBSDKGraphRequestErrorCategoryKey=0, com.facebook.sdk:FBSDKErrorDeveloperMessageKey=登入錯誤: 登入到應用程式時發生錯誤，請稍後再試。, com.facebook.sdk:FBSDKGraphRequestErrorGraphErrorCode=1349003})
        }
    }
    
    func fetchProfile() {
        let parameters = ["fields": "email, first_name, last_name, picture.type(large)"]
        
        FBSDKGraphRequest(graphPath: "me", parameters: parameters).start(completionHandler: {
            connection, result, error -> Void in
            
            if error != nil {
                print("登入失敗")
                print("longinerror =\(error.debugDescription)")
            } else {
                
                if let resultNew = result as? [String:Any]{
                    
                    print("成功登入")
                    
                    if let email = resultNew["email"] as? String, let firstName = resultNew["first_name"] as? String, let lastName = resultNew["last_name"] as? String, let picture = resultNew["picture"] as? NSDictionary{
                        
                        CURRENT_USER = User(email: email, name: "\(lastName)\(firstName)", password: "", userType: .fb)
                        
                        if let data = picture["data"] as? NSDictionary,let url = data["url"] as? String {
                            CURRENT_USER?.photo = DOWNLOAD_IMAGE(path: url)
                        }
                        
                        // todo: 存入資料庫
                    }
                    
                    self.performSegue(withIdentifier: "unwindToFirstPage", sender: nil)
                }
            }
        })
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
