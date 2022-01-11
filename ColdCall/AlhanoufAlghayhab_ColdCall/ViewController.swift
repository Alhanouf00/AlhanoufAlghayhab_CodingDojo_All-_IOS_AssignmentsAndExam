//
//  ViewController.swift
//  AlhanoufAlghayhab_ColdCall
//
//  Created by administrator on 29/09/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var RandomName: UILabel!
    
    let randomname = ["Alhanouf" , "Huda" , "Rawan" , "Reem" , "Jood"]
   
    
    @IBAction func ColdCall(_ sender: Any) {
        
        
        
        RandomName.text = randomname [Int.random(in: 0..<5)]
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

