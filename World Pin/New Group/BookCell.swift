//
//  BookCollectionViewCell.swift
//  World Pin
//
//  Created by Yi-Yun Chen on 2017/11/30.
//  Copyright © 2017年 Yi-Yun Chen. All rights reserved.
//

import UIKit

class BookCell: UICollectionViewCell {
    
    @IBOutlet weak var cellContainerView: UIView!
    @IBOutlet weak var bookImageView: UIImageView!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    func updateCell(book: Book) {
        dateLabel.text = book.createDate.stringFormat()
        titleLabel.text = book.title
    }
}
