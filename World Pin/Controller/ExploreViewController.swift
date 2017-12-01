//
//  ExploreViewController.swift
//  World Pin
//
//  Created by Yi-Yun Chen on 2017/12/1.
//  Copyright © 2017年 Yi-Yun Chen. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 驗證FB登入權杖還是否存在，還在的話就直接登入
        User.loginTokenCheck { (hasToken) in
            if hasToken == false {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
        
        collection.delegate = self
        collection.dataSource = self
    }
    
    @IBAction func unwindToFirstPage(segue: UIStoryboardSegue) { }
    
    
    // collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return BOOKS.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCell", for: indexPath) as? BookCell {
            
            cell.updateCell(book: BOOKS[indexPath.row])
            cell.addshadow()
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
