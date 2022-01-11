//
//  ViewController.swift
//  AlhanoufAlghayhab_Tipster
//
//  Created by administrator on 02/10/2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var TipSlider: UISlider!
    var numberonscreen: Double = 0
    @IBOutlet weak var Input: UILabel!
    @IBOutlet weak var groupSize: UILabel!
    @IBOutlet weak var Tip: UILabel!
    @IBOutlet weak var Ten: UILabel!
    
    @IBOutlet weak var Five: UILabel!
    
    @IBOutlet weak var Twinty: UILabel!
    
    @IBOutlet weak var One: UILabel!
    
    @IBOutlet weak var Two: UILabel!
    
    @IBOutlet weak var Three: UILabel!
    
    @IBOutlet weak var Four: UILabel!
    
    @IBOutlet weak var Fifth: UILabel!
    
    @IBOutlet weak var Six: UILabel!
    
    @IBOutlet weak var Groupsize: UISlider!
    
    @IBOutlet weak var number: UILabel!
    
    var numberOne : Double = 0
    var numberTwo : Double = 0
    var Result: Double = 0
    

    @IBAction func Button(_ sender: UIButton)
    {
        Input.text = Input.text! + String(sender.tag)
        numberonscreen = Double(Input.text!)!
        
    }
    
    
    @IBAction func tipSlider(_ sender: Any) {
        
    
        Five.text = "\(Int((TipSlider.value)))%"
        
        Ten.text = "\(Int((TipSlider.value)+5))%"
        Twinty.text = "\(Int((TipSlider.value)+10))%"
        
        Four.text = "\(Double((TipSlider.value))*(numberonscreen/100))"
        Fifth.text = "\(Double((TipSlider.value + 5))*(numberonscreen/100))"
        Six.text = "\(Double((TipSlider.value + 10))*(numberonscreen/100))"
    
        
    }

    @IBAction func groupSize(_ sender: Any) {
        number.text = "\(Int((Groupsize.value)))"
        
        One.text = "\(Double(TipSlider.value) + (numberonscreen))"
        Two.text = "\(Double(TipSlider.value + 5) + (numberonscreen))"
        Three.text = "\(Double(TipSlider.value + 10) + (numberonscreen))"
        
        
    }
    
    @IBAction func Clear(_ sender: Any) {
        Input.text = ""
        Five.text = "0"
        Ten.text = "0%"
        Twinty.text = "0%"
        number.text = "0"
        One.text = "0"
        Two.text = "0"
        Three.text = "0"
        Four.text = "0"
        Fifth.text = "0"
        Six.text = "0"
        TipSlider.value = 1
        Groupsize.value = 1
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

