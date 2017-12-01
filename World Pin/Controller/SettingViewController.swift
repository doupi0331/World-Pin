//
//  ViewController.swift
//  World Pin
//
//  Created by Yi-Yun Chen on 2017/11/26.
//  Copyright © 2017年 Yi-Yun Chen. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class SettingViewController: UIViewController, EditUserDelegate {
    
    @IBOutlet weak var photoView: UIView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiBeatify()
        
        nameLabel.text = CURRENT_USER?.name
        photoImageView.image = CURRENT_USER?.photo
    }
    
    func uiBeatify() {
        logoutButton.clearButton()
        photoView.addshadow(width: 0, height: 3)
    }
    
    func update(user: User) {
        photoImageView.image = user.photo
        nameLabel.text = user.name
        CURRENT_USER = user
    }
    
    @IBAction func editButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "EditUserSegue", sender: CURRENT_USER)
    }
    
    @IBAction func logoutButtonPressed(_ sender: Any) {
        if CURRENT_USER?.userType == UserType.fb {
            FBSDKLoginManager().logOut()
        }
        CURRENT_USER = nil
        performSegue(withIdentifier: "logoutSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navigation = segue.destination as? UINavigationController {
            if let editUserViewController = navigation.topViewController as? EditUserViewController {
                editUserViewController.delegate = self
                editUserViewController.user = CURRENT_USER
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

