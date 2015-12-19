//
//  ViewController.swift
//  ImagePickerSample
//
//  Created by 中垣 健志 on 2015/12/19.
//  Copyright © 2015年 itvirtuoso. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, ConfirmDelegate {
    @IBOutlet weak var selectedImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func open_imagepicker(sender: UIBarButtonItem) {
        // フォトライブラリーを開く処理
        let ipc = UIImagePickerController()
        ipc.delegate = self
        ipc.sourceType = .PhotoLibrary
        self.presentViewController(ipc, animated:true, completion:nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        // フォトライブラリーで画像が選択された時の処理
        guard let confirmController = storyboard?.instantiateViewControllerWithIdentifier("confirm") as? ConfirmController else {
            return
        }
        confirmController.delegate = self
        confirmController.image = image
        picker.pushViewController(confirmController, animated: true)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        // フォトライブラリーがキャンセルされた時の処理
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func confirm(confirm: ConfirmController, picker: UIImagePickerController?, selectedImage: UIImage?) {
        // 確認画面で確認した時の処理
        self.selectedImage.image = selectedImage
        picker?.dismissViewControllerAnimated(true, completion: nil)
    }
}

