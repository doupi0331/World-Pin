//
//  Book.swift
//  World Pin
//
//  Created by Yi-Yun Chen on 2017/11/29.
//  Copyright © 2017年 Yi-Yun Chen. All rights reserved.
//

import UIKit
class Book {
    private var _image: UIImage?
    
    var title: String
    let createDate: Date
    var schedules: [Schedule]?
    var image: UIImage? {
        get{
            if let image = self._image {
                return image
            }
            return #imageLiteral(resourceName: "defaultBook")
        }
        set {
            self._image = newValue
        }
    }
    
    init(title: String, createDate: Date, image: UIImage?) {
        self.title = title
        self.createDate = createDate
        self._image = image
    }
}
