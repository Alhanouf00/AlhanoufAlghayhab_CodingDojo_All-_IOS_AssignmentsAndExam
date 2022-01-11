//
//  ViewController.swift
//  AlhanoufAlghayahab_GreatNumberGame
//
//  Created by administrator on 03/10/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Explain: UILabel!
    
    @IBOutlet weak var Input: UITextField!
    
    var guessnumber: Int!
    @IBOutlet weak var Guess: UIButton!
    
    
   
    @IBAction func geuss(_ sender: Any) {
      
    guessnumber = Int (Input.text!)
        
        var numbers = Int.random(in: 1...100)
        
        if numbers > guessnumber
        {
            
            Alertinco1()
        }
        else if (numbers < guessnumber)
        {
            Alertinco2()
            
        }
        
        
        else
        {Alerticorre()}
        
         
    }

    
    
    override func viewDidLoad() {
        
        Explain.text =
      """
  Welcome to the Great Number Game


  I am thinking of number between 1 and 100


    Take a guess!

  """
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


   // func check()
    
    
    func Alertinco1()
    {
        let alertinco  = UIAlertController(title: "Incorrect", message: "\(guessnumber!) is too high!", preferredStyle:UIAlertController.Style.alert)
        
        let actioninco = UIAlertAction(title: "Guess Again ",style: UIAlertAction.Style.default, handler:nil)
        alertinco.addAction(actioninco)
        alertinco.view.backgroundColor = UIColor.red
        
     
        
        present(alertinco, animated: true, completion: nil)
        
    }
    
    func Alertinco2()
    {
        let alertinco  = UIAlertController(title: "Incorrect", message: "\(guessnumber!) is too low!", preferredStyle:UIAlertController.Style.alert)
        
        let actioninco = UIAlertAction(title: "Guess Again ",style: UIAlertAction.Style.default, handler:nil)
        alertinco.addAction(actioninco)
        alertinco.view.backgroundColor = UIColor.red
        
        present(alertinco, animated: true, completion: nil)
        
    }
    
    func Alerticorre()
    {
        let alertcorre  = UIAlertController(title: "Correct", message: "\(guessnumber!) Was correct!!!", preferredStyle:UIAlertController.Style.alert)
        
        let actioncorre = UIAlertAction(title: "Play Again ",style: UIAlertAction.Style.default, handler:nil)
        alertcorre.addAction(actioncorre)
        alertcorre.view.backgroundColor = UIColor.green
        
        present(alertcorre, animated: true, completion: nil)
        
    }
    
    
    
    
  
    
}

