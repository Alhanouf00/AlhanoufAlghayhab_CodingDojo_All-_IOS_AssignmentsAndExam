//
//  ViewController.swift
//  AlhanoufAlghayhab_BucketListRefactor
//
//  Created by administrator on 13/10/2021.
//

import UIKit

class ViewController: UITableViewController, AddItemDelegate {
    
    var Tasks :[String] = []
    
    @IBAction func AddTask(_ Sender: UIBarButtonItem) {
        performSegue(withIdentifier: "Add", sender: Sender )
       
    
               
               }
        

override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               
               let cell = tableView.dequeueReusableCell(withIdentifier: "FirstTable", for: indexPath)
    
    cell.textLabel?.text = Tasks[indexPath.row]
    
    
    
    return cell
           }
    
    override  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Tasks.count
           }
   
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        Tasks.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
        
            performSegue(withIdentifier: "Edit", sender: indexPath)
    }
    
    
    override func viewDidLoad() {
        tableView.dataSource = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if sender is UIBarButtonItem        {
        
        
        let navigationController = segue.destination as! UINavigationController
    
        let addtasks = navigationController.topViewController as! BucketlistTableViewController
        
        addtasks.Recivetasks = self
        }
        
        else if sender is IndexPath
        {
        print("eeeeeeeeeee")
            let navigationController = segue.destination as! UINavigationController
        
            let addtasks = navigationController.topViewController as! BucketlistTableViewController
            
          let indexPath = sender as! NSIndexPath
            
          let TaskIsedite = Tasks[indexPath.row]
            addtasks.EditTask = TaskIsedite
          addtasks.indexpath = indexPath
            addtasks.Recivetasks = self // My Delegate
            
        }
    
    }
    
    func SendTasks(by Controller: BucketlistTableViewController , with text :String, at indexPath: NSIndexPath?) {
       if let index = indexPath
        {
           Tasks[index.row] = text
           
       }
      
       else if text != ""
        {
       
        Tasks.append(text)
        
        }
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    
    }
}
