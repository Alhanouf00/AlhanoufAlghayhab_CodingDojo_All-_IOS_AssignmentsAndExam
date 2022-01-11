//
//  TodoList.swift
//  AlhanoufAlghayhab_TodoList
//
//  Created by administrator on 16/10/2021.
//

import UIKit

import UIKit
import CoreData



class TodListCustomClass: UITableViewController {

    var EditTask: String?
    var indexpath:NSIndexPath?
    
    @IBOutlet weak var TaskTitle: UITextField!
    
    @IBOutlet weak var TaskInput: UITextField!
    
    
    
    @IBOutlet weak var datetime: UIDatePicker!
    
    weak var Recivetasks : AddItemDelegate?
    @IBAction func AddTask(_ sender: UIButton) {
        let dateTime = datetime.date
        
        let taskk = TaskInput.text!
        let Title = TaskTitle.text!
        
        
        Recivetasks?.SendTasks(by: self ,  text:taskk , title: Title , dateTime: dateTime ,at: indexpath)
      
        
    }
    override func viewDidLoad() {

        super.viewDidLoad()
        
      //TaskInput.text = EditTask
    }

   

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

  

}
