Crop and resize images without breaking a sweat!

Quick exemple:
```swift
import ImageCropperPOD
...
let cropper = ImageCropper()
let croppedImage = cropper.crop(image: originalImage, anchor: .center, percentualWidth: 0.5, percentualHeight: 0.5)
self.imageView.image = croppedImage
```
With the anchor property, you can easily archive any kind of cropping, like the image above:
![alt text](https://i.imgur.com/lfNFiQ7.jpg)

## Cropping

#### First
Create a ImageCropper object
```swift
let cropper = ImageCropper()
```

#### Second
Do the croping use the crop function, and passing the folloing parameters:   
**image:** The UIImage that you want to crop.  
**anchor:** The anchor to use when cropping. The five possible values are **.topLeft** / **.topRight** / **.center** / **.bottonLeft** / **.bottonRight**. Look at the image on the exemple to see the effect of choosing each anchor.  
**percentualWidth and percentualHeight** A number between 0 and 1 that indicates the width or height for the cropped image in relation to the original one. So a percentualWidth of 1 will result in no cropping on the horizontal axis, and a percentualWidth of 0.5 will result in a image cropped in half on the horizontal axis.  
So as exemple, a croping getting the topLeft quarter of a image (cropping in half on horizontal and vertical)
```swift
let croppedImage = cropper.crop(image: originalImage, anchor: .topLeft, percentualWidth: 0.5, percentualHeight: 0.5)
```

