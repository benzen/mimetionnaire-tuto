//
//  AjouterMimeViewController.swift
//  mimetionnaire
//
//  Created by Benjamin Dreux on 2014-10-24.
//  Copyright (c) 2014 Benjamin Dreux. All rights reserved.
//

import Foundation
import UIKit
import MobileCoreServices

class AjouterMimeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBAction
    func selectVideo(){
        var ipController = UIImagePickerController()
        ipController.delegate = self
        ipController.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
        ipController.mediaTypes = NSArray(object: kUTTypeMovie)
        ipController.allowsEditing = false
        
        self.presentViewController(ipController, animated: true, completion: nil)
        
    }
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: NSDictionary!){
        println("got it")
        var url = info.objectForKey(UIImagePickerControllerReferenceURL) as NSURL
//        model.videoUrl = url.absoluteString!
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
}
