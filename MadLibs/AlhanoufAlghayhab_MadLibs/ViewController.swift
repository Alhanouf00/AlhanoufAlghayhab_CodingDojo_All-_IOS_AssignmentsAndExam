//
//  ViewController.swift
//  AlhanoufAlghayhab_MadLibs
//
//  Created by administrator on 10/10/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Inputdata: UILabel!
    var reciveData: String!
   
    
    
    @IBAction func tonext(_ sender: UIBarButtonItem) {
        sender.target = self
        
    }
    
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue)
    {
        Inputdata.text = reciveData!
        
    }

   
    override func viewDidLoad() {
        Inputdata.text = "Waiting data ...."
        
       
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

