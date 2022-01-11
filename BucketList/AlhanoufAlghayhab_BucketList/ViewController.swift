//
//  ViewController.swift
//  AlhanoufAlghayhab_BucketList
//
//  Created by administrator on 11/10/2021.
//

import UIKit
import CoreData


class ViewController: UITableViewController, CustomtableviewcellDelegate {
    
    var Tasks = [Bucketlisttasks]()
    let mangecontex = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    @IBAction func AddTask(_ sender: UIBarButtonItem) {
    
               
               }
        

override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               
               let cell = tableView.dequeueReusableCell(withIdentifier: "FirstTable", for: indexPath)
    
    cell.textLabel?.text = Tasks[indexPath.row].tasks
    
    
    
    return cell
           }
    
    override  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Tasks.count
            }
   
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let taskss = Tasks[indexPath.row]
               mangecontex.delete(taskss)
               
               do
               {
              try mangecontex.save()
                   
               } catch
               {print("\(error)")}
               
        
        Tasks.remove(at: indexPath.row)
       
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
            performSegue(withIdentifier: "Edit", sender: indexPath)
    }
    
    
    func FetchData()
    {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Bucketlisttasks")
        
        do{
        let result = try mangecontex.fetch(request)
         Tasks = result as! [Bucketlisttasks]
        }
        catch
        {
            print("\(error)")
            
        }
        
        
    }
    
    
    override func viewDidLoad() {
        tableView.dataSource = self
        super.viewDidLoad()
        FetchData()
        // Do any additional setup after loading the view.
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if sender is UIBarButtonItem
        {
        
        
        let navigationController = segue.destination as! UINavigationController
    
        let addtasks = navigationController.topViewController as! BucketlistTableViewController
        
        addtasks.Recivetasks = self
        }
        
        else if sender is IndexPath        {
            
            let navigationController = segue.destination as! UINavigationController
            
            
            let addtasks = navigationController.topViewController as! BucketlistTableViewController
            addtasks.Recivetasks = self // My Delegate
          let indexPath = sender as! NSIndexPath
            
          let TaskIsedite = Tasks[indexPath.row]
            addtasks.EditTask = TaskIsedite.tasks
          addtasks.indexpath = indexPath
            
        }
    
    }
    
    func SendTasks(by Controller: BucketlistTableViewController , with text :String, at indexPath: NSIndexPath?) {
       if let index = indexPath
        {
           let taskss = Tasks[index.row]
           taskss.tasks = text
           
       }
      
       else if text != ""
        {
       
           let taskss = NSEntityDescription.insertNewObject(forEntityName: "Bucketlisttasks", into: mangecontex) as! Bucketlisttasks
           
           
           let entity8 = NSEntityDescription.insertNewObject(forEntityName: "Entity", into: mangecontex) as! Entity
           
           taskss.tasks = text
           entity8.attribute
           
           let entity6 = NSEntityDescription.insertNewObject(forEntityName: "Entity1", into: mangecontex) as! Entity1
           
           entity6.test
           
           
           
           
           Tasks.append(taskss)
        
        }
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
        
        do
        {
       try mangecontex.save()
            
        } catch
        {print("\(error)")}
    
    }
    

}


