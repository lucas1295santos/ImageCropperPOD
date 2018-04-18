//
//  ImagebleViewController.swift
//  ImageCropperPOD
//
//  Created by Lucas Santos on 18/04/18.
//  Copyright © 2018 Lucas Santos. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController: Imageble {
    
    func extractImage() -> UIImage {
        return self.view.extractImage()
    }
}
