//
//  RegistrationViewController.swift
//  AlhanoufAlghayhab_TodoList_Firebase_FinalExam
//
//  Created by administrator on 10/11/2021.
//

import UIKit
import FirebaseAuth
import CryptoSwift


class RegistrationViewController: UIViewController {

    @IBOutlet weak var Name: UITextField!
    
    @IBOutlet weak var Email: UITextField!
    
    @IBOutlet weak var Password: UITextField!

    //Function to create user and send data to firebase//
    func createnewUser (name: String,email: String , password: String )
    {
       // Instructions to catch errors maybe happen cause users and show alert to user
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
                if error != nil
                {
                    let errorhandel = AuthErrorCode(rawValue: error!._code)

                switch errorhandel
                {
                case .invalidEmail :
                    self.InvalidEmailUser()
                   
                    
                 case .emailAlreadyInUse:
                    self.emailAlreadyuse()
                    
                    
                case .weakPassword:
                    self.weakPassword()
                    
                default:
                    self.Unknownerror()
                }
                }
            //End of catch errors instructions
            
            //When successful registration will be go to root screen "FamilyGrocerylist"
                else
                {
                    self.performSegue(withIdentifier: "GoTodo", sender: Any?.self)
                }
            }
            }

    @IBAction func Register(_ sender: UIButton) {
        let name = Name.text!
        let email = Email.text!
        let password = Password.text!
        let encryptPassword = password.md5()
    
    createnewUser(name: name, email: email, password: encryptPassword)
        
    }
    
    @IBAction func Back(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "Back", sender: Any?.self)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Registration"
    }
    // To empty feilds when is logout
    override func viewDidAppear(_ animated: Bool) {
        Name.text = ""
        Email.text = ""
        Password.text = ""
    }
}

extension RegistrationViewController
{
    // Inside extension are Functions of alerts and display error messages to user
    
        func InvalidEmailUser()
        {
            // When user enter invalid format email

            let InvalidError = UIAlertController(title: "Invalid email", message: "Invalid email please write email in format example@example.com", preferredStyle: .alert)
            
            InvalidError.addAction( UIAlertAction(title: "Reenter email", style: .default))
          
            present(InvalidError, animated: true)
    }
    
    func emailAlreadyuse()
    {
        // When user enter email is already uses
        
        let registreError = UIAlertController(title: "Email aleady in use", message: "Email is already in use try another email or login ", preferredStyle: .alert)
        
        let login = UIAlertAction(title: "Login", style: .default)
        {_ in
            
            self.performSegue(withIdentifier: "Back", sender: (Any).self)
            
        }
        
        
        registreError.addAction(UIAlertAction(title: "Reenter email", style: .default))
        registreError.addAction(login)
        present(registreError, animated: true)
            
    }
    
    func weakPassword ()
    {
        // When user enter invalid format email

        let passwordError = UIAlertController(title: "Password is wrong", message: "Your password less than 6 characters please enter password again", preferredStyle: .alert)
        
        passwordError.addAction(UIAlertAction(title: "Reenter password", style: .default))
        
        present(passwordError, animated: true)
        
    }
    func Unknownerror()
    {
        //Alert to user when Unexpected error happen

        let  unknownError = UIAlertController(title: "Unknown error", message: "Unexpected error happen please try again later", preferredStyle: .alert)
        
        unknownError.addAction(UIAlertAction(title: "Try again later", style: .default))
        
        present(unknownError, animated: true)
        
    }
}
