//
//  BucketlistTableViewController.swift
//  AlhanoufAlghayhab_BucketList
//
//  Created by administrator on 11/10/2021.
//

import UIKit
import CoreData



class BucketlistTableViewController: UITableViewController {

    var EditTask: String?
    var indexpath:NSIndexPath?
    @IBOutlet weak var TaskInput: UITextField!
    
    weak var Recivetasks : CustomtableviewcellDelegate?
    
    @IBAction func SaveTaks(_ sender: UIBarButtonItem) {
        let task = TaskInput.text!
        print ("Press")
        Recivetasks?.SendTasks(by: self , with: task,at: indexpath)
    }
    
    
    
   
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
      TaskInput.text = EditTask
    }

   

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

  

}
