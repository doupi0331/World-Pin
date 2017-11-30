//
//  Scene.swift
//  World Pin
//
//  Created by Yi-Yun Chen on 2017/11/29.
//  Copyright © 2017年 Yi-Yun Chen. All rights reserved.
//

import UIKit

class Scene {
    var location: String
    var text: String
    var images: [UIImage]
    var type: SceneType
    
    init(location: String, text: String, images: [UIImage], type: SceneType) {
        self.location = location
        self.text = text
        self.images = images
        self.type = type
    }
}
