//
//  ImageCropper.swift
//  HeartstoneDustCounter
//
//  Created by Lucas Santos on 30/03/18.
//  Copyright © 2018 lucasSantos. All rights reserved.
//

import Foundation
import UIKit

public class ImageCropper {
    
    public init() {
        
    }
    
    /**
     Crop an UIImage, to a percentage (values between 0 to 1) according to a anchor point, and reisze it to the desired size
     
     - Parameter image: The image to crop
     - Parameter toSize: The return size of the cropped image
     - Parameter anchor: Starts the cropping from this anchor point
     - Parameter percentualWidth: Value between 0 and 1 for width
     - Parameter percentualHeight: Value between 0 and 1 for height
     
     - Returns: A new image with dimensions from the toSize parameter
     */
    public func resizeAndCrop(image: UIImage, toSize desiredSize: CGSize, anchorTo: CroppingAnchor, percentualWidth: CGFloat, percentualHeight: CGFloat) -> UIImage {
        var retImage = UIImage()

        let croppedImage = self.crop(image: image, anchor: anchorTo, percentualWidth: percentualWidth, percentualHeight: percentualHeight)
        
        retImage = self.resize(image: croppedImage, toSize: desiredSize)
        
        return retImage
    }
    
    /**
     Resize an UIImage, to the parameter toSize
     
     - Parameter image: The image to crop
     - Parameter toSize: The return size of the cropped image
     
     - Returns: A new image with dimensions from the toSize parameter
     */
    public func resize(image: UIImage, toSize size: CGSize) -> UIImage {
        
        let deisiredRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        image.draw(in: deisiredRect)
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return resizedImage
    }
    
    /**
     Crop an UIImage, to a percentage (values between 0 to 1) according to a anchor point
     
     - Parameter image: The image to crop
     - Parameter anchor: Starts the cropping from this anchor point
     - Parameter percentualWidth: Value between 0 and 1 for width
     - Parameter percentualHeight: Value between 0 and 1 for height

     - Returns: A new image with dimensions: width * percentualWidth, height * percentualHeight
     */
    public func crop(image: UIImage, anchor: CroppingAnchor, percentualWidth: CGFloat, percentualHeight: CGFloat) -> UIImage {
        
        let imageWidth = image.size.width
        let imageHeight = image.size.height
        print(imageWidth)
        
        let rectSize = CGSize(width: imageWidth * percentualWidth, height: imageHeight * percentualHeight)
        
        var croppingRect = CGRect()
        
        switch anchor {
        case .bottonLeft:
            croppingRect = CGRect(x: 0, y: imageHeight/2, width: rectSize.width, height: rectSize.height)
        case .topLeft:
            croppingRect = CGRect(x: 0, y: 0, width: rectSize.width, height: rectSize.height)
        case .topRight:
            croppingRect = CGRect(x: imageWidth / 2, y: 0, width: rectSize.width, height: rectSize.height)
            //errado
        case .bottonRight:
            croppingRect = CGRect(x: imageWidth / 2, y: imageHeight / 2, width: rectSize.width, height: rectSize.height)
        case .center:
            let rectOriginPoint = CGPoint.init(x: (imageWidth / 2) - (rectSize.width / 2), y: (imageHeight / 2) - (rectSize.height / 2))
            croppingRect = CGRect(origin: rectOriginPoint, size: rectSize)
        }
        
        let croppedImage = image.cgImage!.cropping(to: croppingRect)
        
        return UIImage(cgImage: croppedImage!)
    }
}
