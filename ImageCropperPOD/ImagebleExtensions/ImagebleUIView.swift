//
//  ImagebleUIView.swift
//  ImageCropperPOD
//
//  Created by Lucas Santos on 18/04/18.
//  Copyright © 2018 Lucas Santos. All rights reserved.
//

import Foundation
import UIKit

extension UIView: Imageble {
    
    public func extractImage() -> UIImage {
        
        if #available(iOS 10.0, *) {
            let renderer = UIGraphicsImageRenderer(bounds: bounds)
            return renderer.image { rendererContext in
                layer.render(in: rendererContext.cgContext)
            }
        } else {
            // Fallback on earlier versions
            let rect: CGRect = self.frame
            
            UIGraphicsBeginImageContext(rect.size)
            let context: CGContext = UIGraphicsGetCurrentContext()!
            self.layer.render(in: context)
            let img = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return img!
        }
    }
}
