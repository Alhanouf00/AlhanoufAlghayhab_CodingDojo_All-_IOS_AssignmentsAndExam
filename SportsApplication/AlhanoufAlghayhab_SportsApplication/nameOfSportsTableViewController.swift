//
//  nameOfSportsTableViewController.swift
//  AlhanoufAlghayhab_SportsApplication
//
//  Created by administrator on 29/10/2021.
//

import UIKit
import CoreData


class nameOfSportsTableViewController: UIViewController {
    
    @IBAction func addplayers(_ sender: UIButton) {
        addDetails()
    }
    

    var sporttypes  : Sports?
    var players = [Players]()
    var managedObjectContextOfPlayer = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self

        tableView.reloadData()
        fetchPlayers()
    }
    
    
    func addDetails()
    
    {
        let addAlert = UIAlertController(title: "Add player ", message: "Add details of player", preferredStyle: .alert)
        
        addAlert.addTextField(configurationHandler: nil)
        addAlert.addTextField(configurationHandler: nil)
        addAlert.addTextField(configurationHandler: nil)
       let Name =  addAlert.textFields![0]
        let Age =  addAlert.textFields![1]
        let Height =  addAlert.textFields![2]
        Name.placeholder = "Enter name"
        Age.placeholder = "Enter Age"
        Height.placeholder = "Enter Height"
        
        
        let saveActionplayer = UIAlertAction(title: "Save", style: .default)
               {
                   _ in

                   
                   
                   
                   let new = Players(context: self.managedObjectContextOfPlayer)
                   new.namep = Name.text!
                 //  new.sporttype?.name = Name.text!
                   
                  // let new = Players(context: self.managedObjectContextOfPlayer)
                   new.age = Age.text!
                 //  new.sporttype?.name = Age.text!
                //  let new = Players(context: self.managedObjectContextOfPlayer)
                   new.height = Height.text!
                 //  new.sporttype?.name = Height.text!
                   self.sporttypes?.addToPalyersd(new)
              
                   self.tableView.reloadData()
                   self.savePlayers()
               }
        
            
            
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                addAlert.addAction(saveActionplayer)
                addAlert.addAction(cancelAction)
        present(addAlert, animated: true, completion: nil)
    }
        
       func savePlayers()
        {
            do {
                        try managedObjectContextOfPlayer.save()
                        print("Save successful")
                    } catch {
                        print("Error \(error)")
                    }
                    
                    fetchPlayers()
            
        }
        
        
        func fetchPlayers()

        {
            do {
                players = try managedObjectContextOfPlayer.fetch(Players.fetchRequest())
                        print("Success")
                    } catch {
                        print("Error: \(error)")
                    }
                    tableView.reloadData()
        }
        
        
    }



extension nameOfSportsTableViewController : UITableViewDataSource ,UITableViewDelegate
{
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return sporttypes?.palyersd?.count ?? 0
       // return players.count
         
      }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "player", for: indexPath) as! CustomDelegateTableViewCell
        /*
        cell.nameLabel.text! = players[indexPath.row].namep ?? "name of name"
        
        cell.ageLabel.text! = players[indexPath.row].age ?? "age of age"
        cell.heightLabel.text! = players[indexPath.row].height ?? "height of height"
        */
   
        cell.nameLabel.text!  = (sporttypes?.palyersd?[indexPath.row] as! Players).namep ?? "name nil "
       cell.ageLabel.text! = (sporttypes?.palyersd?[indexPath.row] as! Players).age ?? " age nil"
        cell.heightLabel.text! = (sporttypes?.palyersd?[indexPath.row] as! Players).height ?? " height nil"
       
          return cell
          
      }
       
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let playersdet = players[indexPath.row]
        managedObjectContextOfPlayer.delete(playersdet)
              
              do
              {
             try managedObjectContextOfPlayer.save()
                  
              } catch
              {print("\(error)")}
              
       
        players.remove(at: indexPath.row)
      
       tableView.reloadData()

          
       }
    
    
    
}
