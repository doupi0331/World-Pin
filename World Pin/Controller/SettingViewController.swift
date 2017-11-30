//
//  ViewController.swift
//  World Pin
//
//  Created by Yi-Yun Chen on 2017/11/26.
//  Copyright © 2017年 Yi-Yun Chen. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class SettingViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        guard CURRENT_USER != nil else {
            self.performSegue(withIdentifier: "loginSegue", sender: nil)
            return
        }
        
        nameLabel.text = CURRENT_USER?.name
        emailLabel.text = CURRENT_USER?.email
        typeLabel.text = CURRENT_USER?.userType.rawValue
        
        if let photo = CURRENT_USER?.photo {
            photoImageView.image = photo
        } else {
            photoImageView.image = #imageLiteral(resourceName: "defaultUser")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutButtonPressed(_ sender: Any) {
        if CURRENT_USER?.userType == UserType.fb {
            FBSDKLoginManager().logOut()
        }
        CURRENT_USER = nil
        self.performSegue(withIdentifier: "logoutSegue", sender: nil)
    }
}

