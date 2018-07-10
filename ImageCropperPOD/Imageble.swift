//
//  Imageble.swift
//  ImageCropperPOD
//
//  Created by Lucas Santos on 18/04/18.
//  Copyright © 2018 Lucas Santos. All rights reserved.
//

import Foundation
import UIKit

public protocol Imageble {
    func extractImage() -> UIImage
    func crop(anchor: CroppingAnchor, percentualWidth: CGFloat, percentualHeight: CGFloat) -> UIImage
    func resize(toSize size: CGSize) -> UIImage
}

extension Imageble {
    
    /**
     Crop the extracted UIImage, to a percentage (values between 0 to 1) according to a anchor point
     
     - Parameter anchor: Starts the cropping from this anchor point
     - Parameter percentualWidth: Value between 0 and 1 for width
     - Parameter percentualHeight: Value between 0 and 1 for height
     
     - Returns: A new image with dimensions: width * percentualWidth, height * percentualHeight
     */
    public func crop(anchor: CroppingAnchor, percentualWidth: CGFloat, percentualHeight: CGFloat) -> UIImage {
        
        let image = self.extractImage()
        
        let imageWidth = image.size.width
        let imageHeight = image.size.height
        print(imageWidth)
        
        let rectSize = CGSize(width: imageWidth * percentualWidth, height: imageHeight * percentualHeight)
        
        var croppingRect = CGRect()
        
        switch anchor {
        case .bottonLeft:
            croppingRect = CGRect(x: 0, y: imageHeight - rectSize.height, width: rectSize.width, height: rectSize.height)
        case .topLeft:
            croppingRect = CGRect(x: 0, y: 0, width: rectSize.width, height: rectSize.height)
        case .topRight:
            croppingRect = CGRect(x: imageWidth - rectSize.width, y: 0, width: rectSize.width, height: rectSize.height)
        case .bottonRight:
            croppingRect = CGRect(x: imageWidth - rectSize.width, y: imageHeight - rectSize.height, width: rectSize.width, height: rectSize.height)
        case .center:
            let rectOriginPoint = CGPoint.init(x: (imageWidth / 2) - (rectSize.width / 2), y: (imageHeight / 2) - (rectSize.height / 2))
            croppingRect = CGRect(origin: rectOriginPoint, size: rectSize)
        }
        
        let croppedImage = image.cgImage!.cropping(to: croppingRect)
        
        return UIImage(cgImage: croppedImage!)
    }
    
    /**
     Resize the extracted UIImage, to the parameter toSize
     
     - Parameter toSize: The return size of the cropped image
     
     - Returns: A new image with dimensions from the toSize parameter
     */
    public func resize(toSize size: CGSize) -> UIImage {
        
        let image = self.extractImage()
        
        let deisiredRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        image.draw(in: deisiredRect)
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return resizedImage
    }
}
