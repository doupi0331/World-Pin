//
//  EditUserViewController.swift
//  World Pin
//
//  Created by Yi-Yun Chen on 2017/12/1.
//  Copyright © 2017年 Yi-Yun Chen. All rights reserved.
//

import UIKit

protocol EditUserDelegate {
    func update(user: User)
}

class EditUserViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    
    var isChanged: Bool = false
    var delegate: EditUserDelegate?
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        uiBeautify()
        photoImageView.image = user?.photo
        nameTextField.text = user?.name
    }
    
    func uiBeautify() {
        nameTextField.underlined()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        if let name = nameTextField.text {
            guard !(name.isReallyEmpty) else {
                let alert = MESSAGE(title: "", message: "請輸入您的暱稱")
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            if isChanged {
                user?.photo = photoImageView.image
            }
            user?.name = name
            
            // todo: 存入資料庫
            
            delegate?.update(user: user!)
            
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func photoButtonPressed(_ sender: Any) {
        bottomAlert()
    }
    
    
    // alert controller
    func bottomAlert() {
        let alertController = UIAlertController(title: "", message: "請選擇", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel,handler: nil)
        let cameraAction = UIAlertAction(title: "相機", style: .default) { (alert) in
            self.showImagePicker(type: .camera)
        }
        let albumAction = UIAlertAction(title: "相片簿", style: .default) { (alert) in
            self.showImagePicker(type: .photoLibrary)
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(cameraAction)
        alertController.addAction(albumAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    

    // image picker
    func showImagePicker(type: UIImagePickerControllerSourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = type
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            photoImageView.image = image
            isChanged = true
            if picker.sourceType == .camera { // 從照相機拍照才需要存
                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
