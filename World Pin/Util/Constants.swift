//
//  Constants.swift
//  World Pin
//
//  Created by Yi-Yun Chen on 2017/11/29.
//  Copyright © 2017年 Yi-Yun Chen. All rights reserved.
//

import UIKit

// global var
var CURRENT_USER: User?

// global function
func MESSAGE(title: String, message: String) -> UIAlertController {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "確認", style: .default, handler: nil)
    alert.addAction(okAction)
    return alert
}

func DOWNLOAD_IMAGE(path: String) -> UIImage {
    if let url = URL(string: path), let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
        return image
    }
    return #imageLiteral(resourceName: "defaultUser")
}

// global enum
enum SceneType {
    case food
    case travel
    case hotel
}

enum UserType: String {
    case normal = "一般"
    case fb = "FB"
}

// extention
extension UITextField {
    func underlined(){
        let border = CALayer()
        let width = CGFloat(1.0) // 底線寬度
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: self.frame.size.height) // 設定外框位置及寬高
        border.borderWidth = width // 設定外框的粗細
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true // 將多出來的外誆遮掉
    }
}

extension UIButton {
    func clearButton() {
        self.backgroundColor = .clear
        self.layer.cornerRadius = 23
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.darkGray.cgColor
    }
}

extension UIView {
    func addshadow() {
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 0, height: 6)
        self.layer.shadowRadius = 2
        self.layer.masksToBounds = false // 將超出物件的部分顯示
    }
}
