//
//  ViewController.swift
//  AlhanoufAlghayhab_DoubleLinkedList
//
//  Created by administrator on 27/10/2021.
//

import UIKit
class ViewController: UIViewController {
    var list = DoublyLinkedList<Int>()
   
        
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        list.Append(5)
        list.Append(8)
        list.Append(9)
        
        //list.traverse()
        print(list.size())
        //list.traverseBackwards()
        
        // Do any additional setup after loading the view.
    }


}

