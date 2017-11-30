//
//  Schedule.swift
//  World Pin
//
//  Created by Yi-Yun Chen on 2017/11/29.
//  Copyright © 2017年 Yi-Yun Chen. All rights reserved.
//

import Foundation

class Schedule {
    var index: Int
    var date: Date
    var scenes: [Scene]?
    
    init(index: Int, date: Date) {
        self.index = index
        self.date = date
    }
}
