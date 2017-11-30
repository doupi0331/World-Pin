//
//  Book.swift
//  World Pin
//
//  Created by Yi-Yun Chen on 2017/11/29.
//  Copyright © 2017年 Yi-Yun Chen. All rights reserved.
//

import Foundation
class Book {
    var title: String
    let createDate: Date
    var schedules: [Schedule]?
    
    init(title: String, createDate: Date) {
        self.title = title
        self.createDate = createDate
    }
}
