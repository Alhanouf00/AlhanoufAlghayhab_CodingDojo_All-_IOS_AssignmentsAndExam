//
//  ViewController.swift
//  AlhanoufAlghayhab_NorthEastSouthWest
//
//  Created by administrator on 09/10/2021.
//

import UIKit
class ViewController: UIViewController {
    var North :String!
    var East :String!
    var West :String!
    var South :String!
    var dire :String!
    @IBAction func Directions(_ sender: UIButton) {
       // var switchsender = String()
        if (sender.tag == 0)
        {
            North = "North"
            performSegue(withIdentifier: "GoN", sender: sender)
        }
    
        switch sender.tag
        {
        
    case 1:
        dire = "North"
        performSegue(withIdentifier: "GoN", sender: sender)
        
        
    case 2:
        dire = "West"
        performSegue(withIdentifier: "GoW", sender: sender)
        
    case 3:
        dire = "East"
        performSegue(withIdentifier: "GoE", sender: sender)
        
    case 4:
        dire = "South"
        performSegue(withIdentifier: "GoS", sender: sender)
            
            
        default :
            dire = nil
        }
        
        

        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let des = segue.destination as! DestViewViewController
        des.output = dire
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   
}


