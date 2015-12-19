//
//  ConfirmController.swift
//  ImagePickerSample
//
//  Created by 中垣 健志 on 2015/12/19.
//  Copyright © 2015年 itvirtuoso. All rights reserved.
//

import UIKit

class ConfirmController : UIViewController {
    var delegate: ConfirmDelegate?
    var image: UIImage?
    @IBOutlet weak var selectedImage: UIImageView!
    @IBOutlet weak var controlPanelView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
        self.selectedImage.image = self.image
        self.controlPanelView.backgroundColor = UIColor(white: 0, alpha: 0.5)
    }
    
    @IBAction func cancel(sender: UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    @IBAction func confirm(sender: UIButton) {
        let picker = self.parentViewController as? UIImagePickerController
        self.delegate?.confirm(self, picker: picker, selectedImage: self.image)
    }
}
