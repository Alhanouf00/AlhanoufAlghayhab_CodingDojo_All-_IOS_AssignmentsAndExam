//
//  ViewController.swift
//  AlhanoufAlghayhab_BeastList
//
//  Created by administrator on 04/10/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var listTasks:[String] = []

    @IBOutlet weak var Addtask: UIButton!
    
    @IBOutlet weak var Input: UITextField!
    
    var addtask:String!
    
    
    @IBAction func taskisadd(_ sender: Any) {
        
        addtask = Input.text!
        
        
        if addtask != nil && addtask != ""
        {
        listTasks.append(addtask)
        
        }
        Tableview.reloadData()
    }
    
    @IBOutlet weak var Tableview: UITableView!
    
    
    override func viewDidLoad() {
        Tableview.dataSource = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    

   
    
}
extension ViewController: UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return listTasks.count
   }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "MyTasks", for: indexPath)
       
       cell.textLabel?.text = listTasks[indexPath.row]
       
       return cell
       
   }
}
    /*extension ViewController: UITableViewDelegate {
    }}
*/
