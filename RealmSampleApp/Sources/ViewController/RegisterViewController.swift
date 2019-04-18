//
//  RegisterViewController.swift
//  RealmSampleApp
//
//  Created by Satoshi Komatsu on 2019/04/15.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import UIKit
import RealmSwift

final class RegisterViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var publishDateTextField: UITextField!
    @IBOutlet weak var publisherTextField: UITextField!
    @IBOutlet weak var bookImageButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    let realm = try! Realm()
    var book = Book()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func setBookImage(_ sender: Any) {
        useCamera()
    }
    
    //textField以外の部分をタップするとキーボードをしまう
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

extension RegisterViewController: UITextFieldDelegate {
    
    //エンターを押すとキーボードをしまう
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}

extension RegisterViewController: UIImagePickerControllerDelegate,  UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.editedImage] as? UIImage {
            bookImageButton.setImage(selectedImage, for: .normal)
        }
        imageView.image = info[.editedImage] as? UIImage
        
        dismiss(animated: true, completion: nil)
    }
    
    func useCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let picker = UIImagePickerController()
            
            picker.sourceType = .camera
            picker.delegate = self
            picker.allowsEditing = true
            
            present(picker, animated: true, completion: nil)
        } else {
            print("カメラが使用できませんでした")
        }
    }
}
