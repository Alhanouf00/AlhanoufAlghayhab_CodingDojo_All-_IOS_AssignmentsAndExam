//
//  ViewController.swift
//  AlhanoufAlghayhab_TodoList
//
//  Created by administrator on 16/10/2021.
//

import UIKit
import CoreData


class ViewController: UITableViewController, AddItemDelegate {
    
    var Tasks = [TasksTodo]()
    let mangecontex = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    
    
    @IBAction func AddTask(_ sender: UIBarButtonItem) {
    
               
               }
        

override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               
               let cell = tableView.dequeueReusableCell(withIdentifier: "FirstTable", for: indexPath) as! TasksLabel
    
    
    
   cell.Titletask?.text = Tasks[indexPath.row].taskstitle
    
    
   
    cell.TaskDetile?.text = Tasks[indexPath.row].taskdetile
    
    cell.TaskDateTime?.text = (String(describing: Tasks[ indexPath.row].datetask!))
    
    
    
    
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
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            
            if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
                if cell.accessoryType == .checkmark{
                    cell.accessoryType = .none
                }
                else{
                    cell.accessoryType = .checkmark
                }
            }
    }
    

    
    func FetchData()
    {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "TasksTodo")
        
        do{
        let result = try mangecontex.fetch(request)
         Tasks = result as! [TasksTodo]
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
        
       tableView.rowHeight = 120
        // Do any additional setup after loading the view.
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if sender is UIBarButtonItem
        {
        
        
        let navigationController = segue.destination as! UINavigationController
    
        let addtasks = navigationController.topViewController as! TodListCustomClass
        
        addtasks.Recivetasks = self
        }
        
        else if sender is IndexPath        {
            
            let navigationController = segue.destination as! UINavigationController
            
            
            let addtasks = navigationController.topViewController as! TodListCustomClass
            addtasks.Recivetasks = self // My Delegate
          let indexPath = sender as! NSIndexPath
            
          let TaskIsedite = Tasks[indexPath.row]
            addtasks.EditTask = TaskIsedite.taskstitle
          addtasks.indexpath = indexPath
            
        }
    
    }
    
    func SendTasks(by Controller: TodListCustomClass ,text :String,title:String,dateTime: Date, at indexPath: NSIndexPath?) {
       if let index = indexPath
        {
           let taskss = Tasks[index.row]
           taskss.taskstitle = text
           
       }
      
       else if text != ""
        {
       
           let taskss = NSEntityDescription.insertNewObject(forEntityName: "TasksTodo", into: mangecontex) as! TasksTodo
           
           taskss.taskdetile = text
           taskss.taskstitle = title
           taskss.datetask = dateTime
           
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


