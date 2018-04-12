//
//  ImageCropper.swift
//  HeartstoneDustCounter
//
//  Created by Lucas Santos on 30/03/18.
//  Copyright © 2018 lucasSantos. All rights reserved.
//

import Foundation
import UIKit

class ImageCropper {
    
    init() {
        
    }
    
    func cropAnImage(imageToCrop: UIImage) -> UIImage {
        var retImage = UIImage()
        //Settups to the desiredSize of the output image
        let desiredSize = CGSize(width: 248.0, height: 375.0)
        let deisiredRect = CGRect(x: 0, y: 0, width: 248.0, height: 375.0)
        
        //Do the resizing
        UIGraphicsBeginImageContextWithOptions(desiredSize, false, 0.0)
        imageToCrop.draw(in: deisiredRect)
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        let imageWidth = resizedImage.size.width
        let imageHeight = resizedImage.size.height
        
        //Do the cropping
        let rectOriginPoint = CGPoint.init(x: imageWidth/3 * 2, y: imageHeight/3)
        let rectSize = CGSize(width: imageWidth, height: imageHeight)
        let cropped = resizedImage.cgImage!.cropping(to: CGRect(origin: rectOriginPoint, size: rectSize))
        
        retImage = UIImage(cgImage: cropped!)
        
        return retImage
    }
}
