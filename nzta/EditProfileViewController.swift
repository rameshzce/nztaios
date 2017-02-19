//
//  EditProfileViewController.swift
//  nzta
//
//  Created by Ramesh Kolamala on 17/06/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit

func getDocumentsURL() -> URL {
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    return documentsURL
}

func fileInDocumentsDirectory(_ filename: String) -> String {
    
    let fileURL = getDocumentsURL().appendingPathComponent(filename)
    return fileURL.path
    
}

class EditProfileViewController: UIViewController, UIScrollViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let prefs = UserDefaults.standard
    
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var savePhoto: UIButton!
    @IBOutlet var scrollView: UIScrollView!
    var imageView = UIImageView()
    
    @IBAction func cropAndUpload(_ sender: AnyObject) {
        UIGraphicsBeginImageContextWithOptions(scrollView.bounds.size, true, UIScreen.main.scale)
        
        let offSet = scrollView.contentOffset
        
        UIGraphicsGetCurrentContext()!.translateBy(x: -offSet.x, y: -offSet.y)
        
        scrollView.layer.render(in: UIGraphicsGetCurrentContext()!)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        //print(image)
        
        UIGraphicsEndImageContext()
        
        
        UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
        
        // Define the specific path, image name
        let myImageName = "image.png"
        let imagePath = fileInDocumentsDirectory(myImageName)
        
        if image != nil {
            saveImage(image!, path: imagePath)
            //print("image saved to \(imagePath)")
        } else { print("some error message") }
        
        if loadImageFromPath(imagePath) != nil {
            //print(" Loaded Image: \(loadedImage)")
            self.prefs.setValue(imagePath, forKey: "imagePath")
            self.performSegue(withIdentifier: "editProfile", sender: self)
        } else { print("some error message 2") }
        
        
        let alert = UIAlertController(title: "image saved \(image)", message: "your image has been saved\(imagePath)", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        //self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func saveImage (_ image: UIImage, path: String ) -> Bool{
        
        let pngImageData = UIImagePNGRepresentation(image)
        //let jpgImageData = UIImageJPEGRepresentation(image, 1.0)   // if you want to save as JPEG
        let result = (try? pngImageData!.write(to: URL(fileURLWithPath: path), options: [.atomic])) != nil
        
        return result
        
    }
    
    func loadImageFromPath(_ path: String) -> UIImage? {
        
        let image = UIImage(contentsOfFile: path)
        
        if image == nil {
            
            print("missing image at: \(path)")
        }
        //print("Loading image from path: \(path)") // this is just for you to see the path in case you want to go to the directory, using Finder.
        return image
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        Helper.customizeButton(savePhoto)

        imageView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height)
        
        if prefs.string(forKey: "imagePath") != nil{
            imageView.image = UIImage(contentsOfFile: prefs.string(forKey: "imagePath")!)
        }else{
            //imageView.image = UIImage(named:"placeholder")
            imageView.sd_setImage(with: URL(string: prefs.string(forKey: "profileImage")! as String), placeholderImage: UIImage(named: "placeholder"))
        }
        //imageView.image = UIImage(named:"logo")
        imageView.isUserInteractionEnabled = true
        
        scrollView.addSubview(imageView)
        
        let tapGestureRecongnizer = UITapGestureRecognizer(target: self, action: #selector(EditProfileViewController.loadImage))
        tapGestureRecongnizer.numberOfTapsRequired = 1
        imageView.addGestureRecognizer(tapGestureRecongnizer)
        
    }
    
    func loadImage(_ recognizer:UITapGestureRecognizer) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
         
         imageView.image = image
         imageView.contentMode = UIViewContentMode.center
         
         imageView.frame = CGRect(x: 0, y: 0, width: (image.size.width), height: (image.size.height))
         
         scrollView.contentSize = image.size
         
         let scrollViewFrame = scrollView.frame
         let scaleWidth = scrollViewFrame.size.width / scrollView.contentSize.width
         let scaleHeight = scrollViewFrame.size.height / scrollView.contentSize.height
         
         let minScale = min(scaleWidth, scaleHeight)
         
         scrollView.minimumZoomScale = minScale
         scrollView.maximumZoomScale = 1
         scrollView.zoomScale = minScale
         
         centerScrollViewContents()
        
        
        
        picker.dismiss(animated: true, completion: nil)
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
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        centerScrollViewContents()
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


