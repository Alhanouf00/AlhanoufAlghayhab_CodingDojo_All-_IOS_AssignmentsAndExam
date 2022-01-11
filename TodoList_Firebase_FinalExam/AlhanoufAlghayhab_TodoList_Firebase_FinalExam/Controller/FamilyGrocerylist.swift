//
//  FamilyGrocerylist.swift
//  AlhanoufAlghayhab_TodoList_Firebase_FinalExam
//
//  Created by administrator on 10/11/2021.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase


class FamilyGrocerylist: UIViewController {
   let database = Database.database().reference()
    let currentUser = FirebaseAuth.Auth.auth().currentUser!.email // varible holds email of user when login

 
    var familyItems = [Grocery]() // create array of type *Grocery*
    
    @IBAction func addTask(_ sender: Any) {
        addTask() // Add Item when press add button
    }
    
    
    @IBAction func Logout(_ sender: Any) {
        
    
        print("Press")

    do {
        try Auth.auth().signOut()
        self.dismiss(animated: true, completion: nil)
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
    }
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            guard segue.destination is LoginViewController else {return}
    }
    }
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        title = "\(String(describing: currentUser!))"
        tableView.dataSource = self
        tableView.delegate = self
        super.viewDidLoad()
        fetchAllItems() // Featch all data once user is login

    }
}


extension FamilyGrocerylist: UITableViewDataSource ,UITableViewDelegate
{
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return familyItems.count
      }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Family", for: indexPath)
        
        cell.textLabel!.text = familyItems[indexPath.row].item // display the item was added by user
        cell.detailTextLabel!.text = familyItems[indexPath.row].addedBy // display the user was added item

          return cell
      }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let itemEdit = familyItems[indexPath.row].item // hold item once selected by user
        let email = familyItems[indexPath.row].addedBy
        let editItem = UIAlertController(title: "Edit item ", message: "You are will be edite \(itemEdit) ", preferredStyle: .alert)
        
        let warning = UIAlertController(title: "Warning ", message: "You are can not edit \(itemEdit) cause you are not \(email) ", preferredStyle: .alert)
        
        editItem.addTextField{(Textfield) in
            Textfield.text = itemEdit
        }
    
        let saveActionItem = UIAlertAction(title: "Update", style: .default)
               {
                   _ in
                   /*
                    Here 2 variables update to hold new value and ID
                    to hold the unique id of the item then send those
                    variables to *editItems* function
                    then call function *fetchAllItems* to retrieve and display in
                    table view
                    */
                   if self.currentUser != email
                   {
                       warning.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                       self.present(warning, animated: true, completion: nil)
                       
                   }
                   else{
                   let update = editItem.textFields![0].text
                   let ID = self.familyItems[indexPath.row].ItemID
                   
                   DatabaseManger.shared.editItems(path: ID, Item: "\(String(describing: update!))", user: "\(String(describing: self.currentUser!))")
                   
                   self.fetchAllItems()
                   }

               }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        tableView.reloadData()
        editItem.addAction(saveActionItem)
        
        editItem.addAction(cancelAction)
        
        present(editItem, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let deleteItem = familyItems[indexPath.row] // hold item once selected by user
        let Deleteitem = UIAlertController(title: "Delete item ", message: "Are you sure you wanna delete \(deleteItem.item)  ", preferredStyle: .alert)
        
        
        let saveActionItem = UIAlertAction(title: "Delete", style: .default)
               {
                   /*
                    send unique id of the item and send to *deleteItems* function
                    then call function *fetchAllItems* to retrieve and display in
                    table view
                    */
                   _ in
                   if editingStyle == .delete {
                       DatabaseManger.shared.deleteItems(path: deleteItem.ItemID)
                       self.fetchAllItems()
               }
            
               }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        Deleteitem.addAction(saveActionItem)
        Deleteitem.addAction(cancelAction)
        present(Deleteitem, animated: true, completion: nil)
   
    }
    
    
}
extension FamilyGrocerylist
{
    func addTask()
       /*
        In this function once press add button will be appear alert with text field to
        enter a new item then save it and send it to *addItems* function
        to store in database then call function fetchAllItems() to update and display items
        in table view
        
        */
       {
           let addItem = UIAlertController(title: "Add item ", message: "Please add your grocery item", preferredStyle: .alert)
           
           addItem.addTextField(configurationHandler: nil)
        
           let Items =  addItem.textFields![0]
          
           Items.placeholder = "Enter item"
       
           
           let saveActionTask = UIAlertAction(title: "Save", style: .default)
                  {
                      _ in

                      DatabaseManger.shared.addItems(Item:Items.text!,user: "\(String(describing: self.currentUser!))")
                   
                      self.fetchAllItems()
                  }
           let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
           addItem.addAction(saveActionTask)
           addItem.addAction(cancelAction)
           present(addItem, animated: true, completion: nil)
       }
 
    
    func fetchAllItems()
    {
        // Function to retrieve all data from firebase
        self.familyItems.removeAll() // to remove the data from array every time to prevent the duplicate
       
        database.child("grocerytasks").observeSingleEvent(of: .value, with: {snapshot in
       guard let tasksData = snapshot.value as? [String: AnyObject] else{return }
            
            var fetchitem = Grocery()
            for (_,value) in tasksData
            {
                fetchitem.item = (value["item"] as! String)
                fetchitem.addedBy = (value["Added by"] as! String)
                fetchitem.ItemID = (value["ItemID"] as! String)
                self.familyItems.append(fetchitem)
                self.tableView.reloadData()
            }
        })
    
    }
    
    
    
    
    

}
