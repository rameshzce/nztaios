//
//  EditProfileViewController.swift
//  nzta
//
//  Created by Ramesh Kolamala on 17/06/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit

func getDocumentsURL() -> NSURL {
    let documentsURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
    return documentsURL
}

func fileInDocumentsDirectory(filename: String) -> String {
    
    let fileURL = getDocumentsURL().URLByAppendingPathComponent(filename)
    return fileURL!.path!
    
}

class EditProfileViewController: UIViewController, UIScrollViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let prefs = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet var imageFromWeb: UIImageView!
    @IBOutlet var scrollView: UIScrollView!
    var imageView = UIImageView()
    
    @IBAction func cropAndUpload(sender: AnyObject) {
        UIGraphicsBeginImageContextWithOptions(scrollView.bounds.size, true, UIScreen.mainScreen().scale)
        
        let offSet = scrollView.contentOffset
        
        CGContextTranslateCTM(UIGraphicsGetCurrentContext()!, -offSet.x, -offSet.y)
        
        scrollView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        //print(image)
        
        UIGraphicsEndImageContext()
        
        
        UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
        
        // Define the specific path, image name
        let myImageName = "image.png"
        let imagePath = fileInDocumentsDirectory(myImageName)
        
        if image != nil {
            saveImage(image!, path: imagePath)
            print("image saved to \(imagePath)")
        } else { print("some error message") }
        
        if let loadedImage = loadImageFromPath(imagePath) {
            print(" Loaded Image: \(loadedImage)")
        } else { print("some error message 2") }
        
        
        let alert = UIAlertController(title: "image saved \(image)", message: "your image has been saved", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func saveImage (image: UIImage, path: String ) -> Bool{
        
        let pngImageData = UIImagePNGRepresentation(image)
        //let jpgImageData = UIImageJPEGRepresentation(image, 1.0)   // if you want to save as JPEG
        let result = pngImageData!.writeToFile(path, atomically: true)
        
        return result
        
    }
    
    func loadImageFromPath(path: String) -> UIImage? {
        
        let image = UIImage(contentsOfFile: path)
        
        if image == nil {
            
            print("missing image at: \(path)")
        }
        print("Loading image from path: \(path)") // this is just for you to see the path in case you want to go to the directory, using Finder.
        return image
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        self.imageFromWeb.image = UIImage(contentsOfFile: "/var/mobile/Containers/Data/Application/10C6D07A-29F4-43B0-922F-6E6F1EA2F68E/Documents/image.png")
        
        // download image from web
        /*let url = NSURL(string: "http://sdctbheemili.org/ios/images/event_name_image2.jpg")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {
            (data, response, error) -> Void in
            
            if error != nil {
                print("error=\(error)")
                return
            } else {
                
                dispatch_async(dispatch_get_main_queue(),{ () -> Void in
                    if let image = UIImage(data: data!){
                        self.imageFromWeb.image = image
                    }
                });
                
            }
            
            
        }
        
        task.resume()*/
        
 
        
        
        imageView.frame = CGRectMake(0, 0, scrollView.frame.size.width, scrollView.frame.size.height)
        imageView.image = UIImage(named:"logo")
        imageView.userInteractionEnabled = true
        
        scrollView.addSubview(imageView)
        
        let tapGestureRecongnizer = UITapGestureRecognizer(target: self, action: #selector(EditProfileViewController.loadImage))
        tapGestureRecongnizer.numberOfTapsRequired = 1
        imageView.addGestureRecognizer(tapGestureRecongnizer)
        
    }
    
    func loadImage(recognizer:UITapGestureRecognizer) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
         
         imageView.image = image
         imageView.contentMode = UIViewContentMode.Center
         
         imageView.frame = CGRectMake(0, 0, (image.size.width), (image.size.height))
         
         scrollView.contentSize = image.size
         
         let scrollViewFrame = scrollView.frame
         let scaleWidth = scrollViewFrame.size.width / scrollView.contentSize.width
         let scaleHeight = scrollViewFrame.size.height / scrollView.contentSize.height
         
         let minScale = min(scaleWidth, scaleHeight)
         
         scrollView.minimumZoomScale = minScale
         scrollView.maximumZoomScale = 1
         scrollView.zoomScale = minScale
         
         centerScrollViewContents()
        
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func centerScrollViewContents (){
        let boundsSize = scrollView.bounds.size
        var contentsFrame = imageView.frame
        
        if contentsFrame.size.width < boundsSize.width {
            contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2
        }else{
            contentsFrame.origin.x = 0
        }
        
        if contentsFrame.size.height < boundsSize.height {
            contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2
        }else{
            contentsFrame.origin.y = 0
        }
        
        imageView.frame = contentsFrame
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        centerScrollViewContents()
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


