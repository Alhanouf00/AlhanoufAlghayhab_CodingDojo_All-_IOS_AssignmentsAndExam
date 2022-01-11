//
//  ViewController.swift
//  AlhanoufAlghayhab_BucketlistAPI
//
//  Created by administrator on 22/10/2021.
//

import UIKit
import Alamofire

class ViewController: UITableViewController, CustomtableviewcellDelegate {
    
    var Tasks :[String] = []
    var Taskssever: [Tasksmodel?] = []
   
    @IBAction func AddTask(_ sender: UIBarButtonItem) {
    }
    
    
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               
               let cell = tableView.dequeueReusableCell(withIdentifier: "FirstTable", for: indexPath)
    
    cell.textLabel?.text = Taskssever[indexPath.row]?.objective
    
    
    return cell
           }
    
    override  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Taskssever.count
            }
   
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       let ID = Taskssever[indexPath.row]!.id
        print(ID)
        print("AddTask?.id: \(ID)")
        
        print("AddTask?.id: \(ID)")
        AF.request("https://saudibucketlistapi.herokuapp.com/tasks/\(String(ID))/", method: .delete).responseDecodable(of: Tasksmodel.self)
        {
            response in
            guard let taskadd = response.value else
            {return
                
            }
            
            print(taskadd)
            self.tableView.reloadData()
            self.Taskssever.remove(at: indexPath.row)

           
        }
        
    }
            
        
        
                   /*
                   {
            response in
            guard let taskadd = response.value else
            {return
                
            }
            
            print(taskadd)

        })
                    */
        //
            
    
    
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
            performSegue(withIdentifier: "Edit", sender: indexPath)
    }
    

    func GetData ()
    {
        AF.request("https://saudibucketlistapi.herokuapp.com/tasks/").responseDecodable(of:[Tasksmodel].self) { response in
                    if let temp = response.value {
                        
                       DispatchQueue.main.async {
                           
                           self.Taskssever = temp
                           self.tableView.reloadData()
                       }
                    }
                }
    }
        
    override func viewDidLoad() {
       
        tableView.dataSource = self
        super.viewDidLoad()
        GetData ()
        // Do any additional setup after loading the view.
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Add"
        {
        
        
        let navigationController = segue.destination as! UINavigationController
    
        let addtasks = navigationController.topViewController as! BucketlistTableViewController
    
        addtasks.Recivetasks = self
            addtasks.isAdd = true
        }
        
        else if segue.identifier == "Edit"
        {
            
            let navigationController = segue.destination as! UINavigationController
            
            
            let addtasks = navigationController.topViewController as! BucketlistTableViewController
            addtasks.Recivetasks = self // My Delegate
          let indexPath = sender as! NSIndexPath
            
            let TaskIsedite = Taskssever[indexPath.row]!.id
            let taskObject = Taskssever[indexPath.row]!.objective
            addtasks.editTaskID = String(TaskIsedite)
            addtasks.editTaskobject = taskObject
            
          addtasks.indexpath = indexPath
            addtasks.isAdd = false
            
        }
    
    }
    
    func SendTasks(by Controller: BucketlistTableViewController , with text :String, at indexPath: NSIndexPath?) {
       if let index = indexPath
        {
           //Taskssever[index.row]?.objective = text
           
       }
      
       else if text != ""
        {
       
        Tasks.append(text)
        
        }
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    
    }
    

}
