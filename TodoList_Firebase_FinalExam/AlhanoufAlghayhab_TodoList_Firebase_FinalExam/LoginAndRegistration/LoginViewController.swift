//
//  LoginViewController.swift
//  AlhanoufAlghayhab_TodoList_Firebase_FinalExam
//
//  Created by administrator on 10/11/2021.
//

import UIKit
import FirebaseAuth
import CryptoSwift

class LoginViewController: UIViewController {

    @IBOutlet weak var Email: UITextField!
    
    @IBOutlet weak var Password: UITextField!
    
    //Function to login user and check data in firebase//

    func LoginUser(email: String, password: String)
    {
        // Instructions to catch errors maybe happen cause users and show alert to user
        Auth.auth().signIn(withEmail: email, password: password){ loginResult ,error in
           
            if error != nil
            {
    
                let errorhandel = AuthErrorCode(rawValue: error!._code)

                switch errorhandel
                {
                case .invalidEmail:
                    
                    self.InvalidEmailUser()
                case .userNotFound:
                    self.UsernotFound()
                    
                case .wrongPassword:
                    self.WrongPassword ()
                    
                default:
                    self.Unknownerror()
                    
                }
            }
            //End of catch errors instructions

            //When successful login will be go to root screen "FamilyGrocerylist"

            else if (error == nil){
              
                //self.shouldPerformSegue(withIdentifier: "GoTodo", sender: Any?.self)
                self.performSegue(withIdentifier: "GoTodo", sender: Any?.self)

                     
            }
        }
        
        
        }
    
    @IBAction func Login(_ sender: UIButton) {
        let email = Email.text!
        let password = Password.text!
        let encryptPassword = password.md5()
        LoginUser(email: email, password: encryptPassword)
    }
    
//When user doesnot have an account will be press register to go RegistrationViewController screen
    @IBAction func Rigster(_ sender: UIButton) {
        self.performSegue(withIdentifier: "GoReg", sender: (Any).self)

    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = "Login"

    }
    // To empty feilds when is logout 
    override func viewDidAppear(_ animated: Bool) {
        Email.text = ""
        Password.text = ""
    }
    
}

extension LoginViewController
{
    // Inside extension are Functions of alerts and display error messages to user

    func InvalidEmailUser()
    {
        // When user enter invalid format email

        let InvalidError = UIAlertController(title: "Invalid email", message: "Invalid email please write email in format example@example.com", preferredStyle: .alert)
        
        InvalidError.addAction( UIAlertAction(title: "Reenter email", style: .default))
      
        present(InvalidError, animated: true)
            
    }
    
    func WrongPassword ()
    {
        // When user enter invalid format email

        let passwordError = UIAlertController(title: "Password is wrong", message: "Your password is wrong please try again", preferredStyle: .alert)
        
        passwordError.addAction(UIAlertAction(title: "Reenter password", style: .default))
        
        present(passwordError, animated: true)
        
    }
    
    
    func UsernotFound()
    {
        //User does not have an account
        let logError = UIAlertController(title: "Account not found", message: "Account not found for this user please try again with other email or register", preferredStyle: .alert)
        
        let userNotFound = UIAlertAction(title: "Try with other email", style: .default)
        
        let userNotFoundRigster = UIAlertAction(title: "Register", style: .default)
        {_ in
            
            self.performSegue(withIdentifier: "GoReg", sender: (Any).self)
            
        }

        logError.addAction(userNotFound)
        logError.addAction(userNotFoundRigster)
        present(logError, animated: true)
        
    }
    
    func Unknownerror()
    {
        //Alert to user when Unexpected error happen
        let  unknownError = UIAlertController(title: "Unknown error", message: "Unexpected error happen please try again later", preferredStyle: .alert)
        
        unknownError.addAction(UIAlertAction(title: "Try again later", style: .default))
        
        present(unknownError, animated: true)
        
    }
    
}
