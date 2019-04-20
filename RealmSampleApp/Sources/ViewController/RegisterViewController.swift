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

    @IBOutlet weak var titleTextField: UITextField!{
        didSet {
            titleTextField.delegate = self
        }
    }
    @IBOutlet weak var authorTextField: UITextField! {
        didSet {
            authorTextField.delegate = self
        }
    }
    @IBOutlet weak var publisherTextField: UITextField! {
        didSet {
            publisherTextField.delegate = self
        }
    }
    @IBOutlet weak var bookImageButton: UIButton!
    
    var book = Book.creat()
    var selectedImage: UIImage!
    
    @IBAction func setBookImage(_ sender: Any) {
        useCamera()
    }
    
    @IBAction func register(_ sender: Any) {
        book.bookTitle      = titleTextField.text ?? ""
        book.authorName     = authorTextField.text ?? ""
        book.publisher      = publisherTextField.text ?? ""
        
        guard let _selectedImage = selectedImage else {
            print("画像を選択してちょ")
            return
        }
        book.bookImage = _selectedImage.jpegData(compressionQuality: 1)!
        
        book.save()
       
        
        self.dismiss(animated: true, completion: nil)
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
        selectedImage = info[.editedImage] as? UIImage
        if let _selectedImage = selectedImage {
            bookImageButton.setImage(_selectedImage, for: .normal)
        }
        
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
