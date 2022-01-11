//
//  CustomDelegateTableViewCell.swift
//  AlhanoufAlghayhab_SportsApplication
//
//  Created by administrator on 29/10/2021.
//

import UIKit


/*
protocol AddItemDelegate : AnyObject
{
    func SendTasks(by Controller :TodListCustomClass , text:String , title:String,dateTime:String ,at indexPath: NSIndexPath?)
    
    
    
}
*/

class CustomDelegateTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewSport: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    //var Image: UIImageView!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var heightLabel: UILabel!

        
    @IBOutlet weak var AddImage: UILabel!
    
    
    @IBOutlet weak var sportsName: UILabel!
    
    
        
        /*
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
         */
        
    
    func pickImagFromGallery()
        {
            let profile = UIImagePickerController()
           
            profile.sourceType = .photoLibrary
            profile.delegate = self
            profile.allowsEditing = true
            //present(profile, animated: true, completion: nil)
            
            
        }

}


extension CustomDelegateTableViewCell: UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
       // Image.image = image
        
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true,completion: nil)
            
        
    }
}
