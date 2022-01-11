//
//  PeopleDetails.swift
//  AlhanoufAlghayhab_FinalSteps
//
//  Created by administrator on 19/10/2021.
//

import UIKit

class PeopleDetails: UITableViewController {
   
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Gender: UILabel!
    @IBOutlet weak var Birth: UILabel!
    @IBOutlet weak var Mass: UILabel!
    
    var NameDpeople: String!
    var GenderDpeople: Gender!
    var BirthDpeople: String!
    var MassDpeople: String!
    
    

    
    var peoplemodel: peopleModel?

    
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    
      
        
        performSegue(withIdentifier: "Back", sender: indexPath)
    
        
    }
   
   
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 4
       }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func viewDidLoad() {
        Name.text! = NameDpeople
        Gender.text! = "\(GenderDpeople!)"
        Birth.text! = BirthDpeople
        Mass.text! = MassDpeople
        super.viewDidLoad()
        
        tableView.reloadData()
      
        // Do any additional setup after loading the view.
    }
  
    
    
 
    }

