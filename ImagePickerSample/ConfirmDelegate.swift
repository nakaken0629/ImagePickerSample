//
//  ConfirmDelegate.swift
//  ImagePickerSample
//
//  Created by 中垣 健志 on 2015/12/20.
//  Copyright © 2015年 itvirtuoso. All rights reserved.
//

import UIKit

protocol ConfirmDelegate {
    func confirm(confirm: ConfirmController, picker: UIImagePickerController?, selectedImage: UIImage?)
}