//
//  User.swift
//  World Pin
//
//  Created by Yi-Yun Chen on 2017/11/29.
//  Copyright © 2017年 Yi-Yun Chen. All rights reserved.
//

import UIKit

class User {
    let email: String
    var name: String
    var password: String
    var userType: UserType
    var photo: UIImage?
    var books: [Book]?
    
    init(email: String, name: String, password: String, userType: UserType) {
        self.email = email
        self.name = name
        self.password = password
        self.userType = userType
    }
}
