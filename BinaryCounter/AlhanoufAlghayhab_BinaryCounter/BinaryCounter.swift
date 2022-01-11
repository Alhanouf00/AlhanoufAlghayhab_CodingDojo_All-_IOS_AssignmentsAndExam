//
//  BinaryCounter.swift
//  AlhanoufAlghayhab_BinaryCounter
//
//  Created by administrator on 09/10/2021.
//

import UIKit
protocol BinaryCounterDelegate:AnyObject
{
    func TotalofNumbers(total:Int)
    
}



class BinaryCounter: UITableViewCell {
    

    @IBOutlet weak var Numbers: UILabel!
    
    
    weak var Bridge: BinaryCounterDelegate?
    var num:Int!
    

    
    @IBAction func operation(_ sender: UIButton) {
        num = Int(Numbers.text!)


        if sender.titleLabel!.text == "-" {
                    num = -num!
                }
        
        Bridge?.TotalofNumbers(total: num!)

        
    }
    
    
    
    
    

    


}
