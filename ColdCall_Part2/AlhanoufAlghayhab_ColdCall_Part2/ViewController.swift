//
//  ViewController.swift
//  AlhanoufAlghayhab_ColdCall_Part2
//
//  Created by administrator on 30/09/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var RandomeName: UILabel!
    @IBOutlet weak var RandomNumber: UILabel!
    
    
    let nameRandom = ["Alhanouf" , "Huda" , "Rawan" , "Reem" , "Jood"]
    
    let randomnumber = [1 , 2 , 3 , 4 , 5]
    var random: Int = 0
    
    @IBAction func ColdCall(_ sender: Any) {
        RandomeName.text = nameRandom[Int.random(in: 0...4)]
        
        random  = Int.random(in: 0...4)
        switch random
        {
        case 0:
            
            RandomNumber.text = "\(randomnumber[0])"
            RandomNumber.textColor = UIColor.red
         
            
        case 1:
            
            RandomNumber.text = "\(randomnumber[1])"
            RandomNumber.textColor = UIColor.red
       
        case 2:
            RandomNumber.text = "\(randomnumber[2])"
           
            RandomNumber.textColor = UIColor.orange
        
        
            
        case 3:
            
            RandomNumber.text = "\(randomnumber[3])"
            RandomNumber.textColor = UIColor.orange
            
        case 4:
            RandomNumber.text = "\(randomnumber[4])"
            RandomNumber.textColor = UIColor.green
            
    
        default:
            print("")
      
        }
    
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

