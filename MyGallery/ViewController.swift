//
//  ViewController.swift
//  MyGallery
//
//  Created by 마현아 on 22/09/2019.
//  Copyright © 2019 마현아. All rights reserved.
//

import UIKit
import MobileCoreServices
//카메라 관련 import

//UINavigationControllerDelegate, UIImagePickerControllerDelegate - 이미지관련
class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var imageview: UIImageView!
    
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 사진 불러오기
    @IBAction func onBtnLoadImage(_ sender: Any) {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = true
            
            // present 이미지 띄우기
            present(imagePicker, animated: true, completion: nil)
        } else {
            let title = "포토앨범 접근불가"
            let message = "앱이 포토앨범에 접근할 수 없습니다."
            
            myAlert(title: title, message: message)
        }
        
    }
    
    // 사진 촬영
    @IBAction func onBtnCamera(_ sender: Any) {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = false
            
            // present 이미지 띄우기
            present(imagePicker, animated: true, completion: nil)
        } else {
            let title = "카메라에 접근불가"
            let message = "앱이 카메라에 접근할 수 없습니다."
            
            myAlert(title: title, message: message)
        }
    }
    
    // 이미지 갤러리에서 사진 선택하여 이미지뷰에 가져오기
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! String
        
        if mediaType.isEqual(kUTTypeImage as NSString as String) {
            let captureImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            imageview.image = captureImage
            
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    // alert창 설정
    func myAlert( title: String, message: String ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        // UIAlertController 애플에서 지원하는 alert
        
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    

}

