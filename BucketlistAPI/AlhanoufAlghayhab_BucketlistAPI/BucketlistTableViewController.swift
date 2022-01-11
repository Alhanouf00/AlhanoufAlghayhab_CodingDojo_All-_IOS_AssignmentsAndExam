//
//  BucketlistTableViewController.swift
//  AlhanoufAlghayhab_BucketlistAPI
//
//  Created by administrator on 22/10/2021.
//

import UIKit
import Alamofire

class BucketlistTableViewController: UITableViewController {
    
    var editTaskID = ""
    var indexpath:NSIndexPath?
    var editTaskobject :String!
    var AddTask : Tasksmodel?
    
    var isAdd = false
   
    @IBOutlet weak var TaskInput: UITextField!
    
    weak var Recivetasks : CustomtableviewcellDelegate?
  
    @IBAction func Save(_ sender: UIBarButtonItem) {
        
        let task = TaskInput.text!
        
        if isAdd {
            Sendtask()

        }
        else {
            edittask()
        }
       
        Recivetasks?.SendTasks(by: self , with: task,at: indexpath)
    }
   
    func Sendtask()
    {
        AF.request("https://saudibucketlistapi.herokuapp.com/tasks/", method: .post, parameters: ["objective": TaskInput.text!]).responseDecodable(of: Tasksmodel.self)
        {
            response in
            guard let taskadd = response.value else
            {return
                
            }
           
        }
    }

    
    func edittask()
    
    {
        print("AddTask?.id: \(editTaskID)")
        AF.request("https://saudibucketlistapi.herokuapp.com/tasks/\(editTaskID)/", method: .put, parameters: ["objective": TaskInput.text]).responseDecodable(of: Tasksmodel.self)
        {
            response in
            guard let taskadd = response.value else
            {return
                
            }
            
            print(taskadd)
           
        }
        
    }
    

    /// <#Description#>
    override func viewDidLoad() {

        super.viewDidLoad()
        if !isAdd {
       TaskInput.text = editTaskobject
        
        }

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
                                

                                
