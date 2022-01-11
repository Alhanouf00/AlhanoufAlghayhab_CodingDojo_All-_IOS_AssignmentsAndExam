//
//  LoginViewController.swift
//  AlhanoufAlghayhab_MessangerAPP
//
//  Created by administrator on 27/10/2021.
//

import UIKit
import FacebookLogin
import GoogleSignIn
import Firebase
import CryptoSwift
import MessageKit


class LoginViewController: UIViewController {

    @IBOutlet weak var emailLogin: UITextField!
    
    @IBOutlet weak var passwordLogin: UITextField!
    
    
    
    @IBAction func goRegister(_ sender: UIButton) {
        performSegue(withIdentifier: "goreg", sender: sender)
    }
    
    
    
    @IBAction func googleLogin(_ sender: UIButton) {
       /*
        GIDSignIn.sharedInstance.signIn(
           with: signInConfig,
           presenting: self
       ) { user, error in
           guard error == nil else { return }
           guard let user = user else { return }

           // Your user is signed in!
        */
       }
    
    @IBAction func facebookLogin(_ sender: UIButton) {
      
            /*
            let loginButton = FBLoginButton()
                   loginButton.center = view.center
                   view.addSubview(loginButton)
              // User is logged in, do work such as go to next view controller.
        */
    }

    @IBAction func Login(_ sender: UIButton) {
        
        var email = emailLogin.text!
        let password = passwordLogin.text!
        
        
        let hashPassword = password.md5()

        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: hashPassword, completion: { [weak self] authResult, error in
            
            guard let result = authResult, error == nil else {
                print("Failed to log in user with email \(email)")
                return
            }
            let user = result.user
            print("logged in user: \(user)")
            email = email.replacingOccurrences(of: ".", with: "-")
           email = email.replacingOccurrences(of: "@", with: "-")
            // if this succeeds, dismiss
            //strongSelf.navigationController?.dismiss(animated: true, completion: nil)
            //self!.performSegue(withIdentifier: "GotochatfromLog", sender: sender)
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
