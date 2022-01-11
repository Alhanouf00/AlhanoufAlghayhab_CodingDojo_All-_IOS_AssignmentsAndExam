//
//  ViewController.swift
//  AlhanoufAlghayhab_TTT
//
//  Created by administrator on 01/10/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TTT: UILabel!
    var Redcount = 0
    var Bluecount = 0

    
    
    @IBOutlet weak var Winner: UILabel!
    
    
    @IBOutlet weak var Button1: UIButton!
    
    @IBOutlet weak var Button2: UIButton!
    
    @IBOutlet weak var Button3: UIButton!
    
    
    @IBOutlet weak var Button4: UIButton!
    
    @IBOutlet weak var Button5: UIButton!
    
    @IBOutlet weak var Button6: UIButton!
    
    
    @IBOutlet weak var Button7: UIButton!
    
    @IBOutlet weak var Button8: UIButton!
    
    @IBOutlet weak var Button9: UIButton!
    
    
    @IBAction func Button1(_ sender: Any) {
        
        
        if (Int.random(in: 0...1) == 0)
        {
        
            Button1.tintColorDidChange()
            Button1.tintColor = UIColor.red
            
            Redcount += 1
            
            
        }
        
        else
        {
            Button1.tintColor = UIColor.blue
            Bluecount += 1
        }
        winner()
    }
    
    @IBAction func Button2(_ sender: Any) {
        
        
        if (Int.random(in: 0...1) == 0)
        {
        
        Button2.tintColor = UIColor.red
            Redcount += 1
            
            
        }
        
        else
        {
            Button2.tintColor = UIColor.blue
            Bluecount += 1
        }
        winner()
    }
    
    
    @IBAction func Button3(_ sender: Any) {
        
        if (Int.random(in: 0...1) == 0)
        {
        
        Button3.tintColor = UIColor.red
            Redcount += 1
            
            
        }
        
        else
        {
            Button3.tintColor = UIColor.blue
            Bluecount += 1
        }
        winner()
        
        
    }
    
    
    @IBAction func Button4(_ sender: Any) {
        
        if (Int.random(in: 0...1) == 0)
        {
        
        Button4.tintColor = UIColor.red
            Redcount += 1
            
            
        }
        
        else
        {
            Button4.tintColor = UIColor.blue
            Bluecount += 1
        }
        winner()
    }
    
    
    
    @IBAction func Button5(_ sender: Any) {
        
        if (Int.random(in: 0...1) == 0)
        {
        
        Button5.tintColor = UIColor.red
            Redcount += 1
            
            
        }
        
        else
        {
            Button5.tintColor = UIColor.blue
            Bluecount += 1
        }
        winner()
    }
    
    
    
    @IBAction func Button6(_ sender: Any) {
        
        if (Int.random(in: 0...1) == 0)
        {
        
        Button6.tintColor = UIColor.red
            Redcount += 1
            
            
        }
        
        else
        {
            Button6.tintColor = UIColor.blue
            Bluecount += 1
        }
        winner()
    }
    
    
    @IBAction func Button7(_ sender: Any) {
        
        if (Int.random(in: 0...1) == 0)
        {
        
        Button7.tintColor = UIColor.red
            Redcount += 1
            
            
        }
        
        else
        {
            Button7.tintColor = UIColor.blue
            Bluecount += 1
        }
        winner()
    }
    
    
    @IBAction func Button8(_ sender: Any) {
        
        if (Int.random(in: 0...1) == 0)
        {
        
        Button8.tintColor = UIColor.red
            Redcount += 1
            
            
        }
        
        else
        {
            Button8.tintColor = UIColor.blue
            Bluecount += 1
        }
        winner()
    }
    
    
    @IBAction func Button9(_ sender: Any) {
        
        if (Int.random(in: 0...1) == 0)
        {
        
        Button9.tintColor = UIColor.red
            Redcount += 1
           
            
            
        }
        
        else
        {
            Button9.tintColor = UIColor.blue
            Bluecount += 1
        }
        
        winner()
        
    }
    
    
    @IBAction func Reset(_ sender: Any) {
        Button1.tintColor = UIColor.clear
        Button2.tintColor = UIColor.clear
        Button3.tintColor = UIColor.clear
        Button4.tintColor = UIColor.clear
        Button5.tintColor = UIColor.clear
        Button6.tintColor = UIColor.clear
        Button7.tintColor = UIColor.clear
        Button8.tintColor = UIColor.clear
        Button9.tintColor = UIColor.clear
        
        
        Winner.isHidden = true
        Redcount = 0
        Bluecount = 0
        
        
    }
    
func winner()
    {
        Winner.isHidden = true
        if Redcount == 4
        {
            Winner.text = "Congrats Red is winning"
            Winner.isHidden = false
            
        }
        
         else if (Bluecount == 4)
        {
            Winner.text = "Blue is winning"
            Winner.isHidden = false
        }
        
        
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }


}

