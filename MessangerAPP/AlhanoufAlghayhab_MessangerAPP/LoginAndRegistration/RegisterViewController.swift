//
//  RegisterViewController.swift
//  AlhanoufAlghayhab_MessangerAPP
//
//  Created by administrator on 27/10/2021.
//

import UIKit

import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var FirstName: UITextField!
    
    @IBOutlet weak var LastName: UITextField!
    
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!

    @IBAction func didChooseImage(_ sender: UITapGestureRecognizer) {
        presentPhotoActionSheet()
        
        
         
    }
    
    func presentPhotoActionSheet(){
            let actionshoot = UIAlertController(title: "Profile Picture", message: "How would you like to select a picture?", preferredStyle: .actionSheet)
        actionshoot.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        actionshoot.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { [weak self] _ in
                //self?.pickImagFromCamera()
            }))
        actionshoot.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: { [weak self] _ in
            self?.pickImagFromGallery()
            }))
            
            present(actionshoot, animated: true)
        }
    
    
    
    
func pickImagFromGallery()
    {
        let profile = UIImagePickerController()
       
        profile.sourceType = .photoLibrary
        profile.delegate = self
        profile.allowsEditing = true
        present(profile, animated: true, completion: nil)
        
        
    }
    
    func pickImagFromCamera()
        {
            let profile = UIImagePickerController()
            profile.sourceType = .camera
            profile.delegate = self
            profile.allowsEditing = true
            present(profile, animated: true)
            
            
        }

    @IBAction func Register(_ sender: UIButton) {
        
        let firstName = FirstName.text!
        let lastName = LastName.text!
        var email = Email.text!
        let password = Password.text!
        
        
        let hashPassword = password.md5()
        
       
        

        let actionsignup = UIAlertController(title: "Error", message: "", preferredStyle: .alert)

        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: hashPassword, completion: { authResult , error  in
            
            
         // DatabaseManger.shared.uploadimage(email: email, imageData: profileImage, completion: <#T##(String?, Error?) -> Void#>)
            if error != nil {

                            if let errCode = AuthErrorCode(rawValue: error!._code) {

                                switch errCode {
                                case .invalidEmail:
                                    let invalid = UIAlertAction(title: "invalid email", style: .default)
                                    actionsignup.addAction(invalid)
                                    self.present(actionsignup, animated: true)
                                        print("invalid email")
                                    case .emailAlreadyInUse:
                                    actionsignup.addAction(UIAlertAction(title: "Is use before", style: .default))
                                        print("in use")
                                case .weakPassword:
                                    actionsignup.addAction(UIAlertAction(title: "The password must be 6 characters long or more.", style: .default))
                                    print("The password must be 6 characters long or more.")
                                    default:
                                        print("Create User Error: \(error!)")
                                }
                            }

                        } else {
                            print("all good... continue")
                        }
            guard let result = authResult, error == nil else {
                print("Error creating user")
                return
            }
            let user = result.user
            print("Created User: \(user)")
            email = email.replacingOccurrences(of: ".", with: "-")
           email = email.replacingOccurrences(of: "@", with: "-")
            DatabaseManger.shared.insertNewUser(firstname: firstName, lastname: lastName, email: email)
            // performSegue(withIdentifier: "GotochatfromReg", sender: sender)
        })
        
     
       
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

   

}
extension RegisterViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
        profileImage.image = image
        
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true,completion: nil)
            
        
    }
    
}
