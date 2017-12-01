//
//  User.swift
//  World Pin
//
//  Created by Yi-Yun Chen on 2017/11/29.
//  Copyright © 2017年 Yi-Yun Chen. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class User {
    private var _photo: UIImage?
    
    let email: String
    var name: String
    var password: String
    var userType: UserType
    var photo: UIImage? {
        get{
            if let image = self._photo {
                return image
            }
            return #imageLiteral(resourceName: "defaultUser")
        }
        set {
            self._photo = newValue
        }
    }
    var books = [Book]()
    
    init(email: String, name: String, password: String, userType: UserType) {
        self.email = email
        self.name = name
        self.password = password
        self.userType = userType
    }
    
    static func loginTokenCheck(completion: @escaping (Bool) -> ()) {
        if (FBSDKAccessToken.current()) != nil{
            self.fetchProfile(completion: { (error) in
                if error != nil {
                    completion(false)
                }
                completion(true)
            })
        } else if CURRENT_USER == nil {
            completion(false)
        }
        completion(true)
    }
    
    static func fetchProfile(completion: @escaping (Error?) -> ()) {
        let parameters = ["fields": "email, first_name, last_name, picture.type(large)"]
        
        FBSDKGraphRequest(graphPath: "me", parameters: parameters).start(completionHandler: {
            connection, result, error -> Void in
            
            if error != nil {
                print("登入失敗")
                print("longinerror =\(error.debugDescription)")
                completion(error)
            } else {
                
                if let resultNew = result as? [String:Any]{
                    
                    print("成功登入")
                    
                    if let email = resultNew["email"] as? String, let firstName = resultNew["first_name"] as? String, let lastName = resultNew["last_name"] as? String, let picture = resultNew["picture"] as? NSDictionary{
                        
                        CURRENT_USER = User(email: email, name: "\(lastName) \(firstName)", password: "", userType: .fb)
                        
                        if let data = picture["data"] as? NSDictionary,let url = data["url"] as? String {
                            DOWNLOAD_IMAGE(urlString: url, completion: { (image) in
                                CURRENT_USER?.photo = image
                            })
                        }
                        
                        // todo: 存入資料庫
                        
                        
                    }
                    completion(nil)
                }
            }
        })
    }
}
