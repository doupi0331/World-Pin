//
//  RegisterTableViewController.swift
//  World Pin
//
//  Created by Yi-Yun Chen on 2017/11/27.
//  Copyright © 2017年 Yi-Yun Chen. All rights reserved.
//

import UIKit

class RegisterTableViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiBeautify()
    }
    
    func uiBeautify() {
        emailTextField.delegate = self
        emailTextField.underlined()
        nameTextField.delegate = self
        nameTextField.underlined()
        passwordTextField.delegate = self
        passwordTextField.underlined()
        confirmPasswordTextField.delegate = self
        confirmPasswordTextField.underlined()
        titleLabel.addshadow()
        submitButton.addshadow()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        
        if let email = emailTextField.text, let name = nameTextField.text, let password = passwordTextField.text, let confirmPassword = confirmPasswordTextField.text{
            
            guard !(email.trimmingCharacters(in: .whitespaces).isEmpty) else {
                let alert = MESSAGE(title: "", message: "請輸入email")
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            guard !(name.trimmingCharacters(in: .whitespaces).isEmpty) else {
                let alert = MESSAGE(title: "", message: "請輸入您的暱稱")
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            guard !(password.isEmpty) else {
                let alert = MESSAGE(title: "", message: "請輸入密碼")
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            guard !(confirmPassword.isEmpty) else {
                let alert = MESSAGE(title: "", message: "請確認您的密碼")
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            guard password == confirmPassword else {
                let alert = MESSAGE(title: "", message: "密碼與確認密碼不相符")
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            // 存取user資料  todo: 將新user的資料存入資料庫，註冊後自動登入
            
            CURRENT_USER = User(email: email, name: name, password: password, userType: .normal)
            //let userDefault = UserDefaults.standard
            //userDefault.setValue(email, forKey: "email")
            self.performSegue(withIdentifier: "unwindToFirstPage", sender: self)
        }
        
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
