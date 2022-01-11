//
//  DestViewViewController.swift
//  AlhanoufAlghayhab_NorthEastSouthWest
//
//  Created by administrator on 09/10/2021.
//

import UIKit

class DestViewViewController: UIViewController {
    
    var output: String!
    @IBOutlet weak var destn: UILabel!
    
    
    @IBAction func Back(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        destn.text = output

    }
    

 

}
