//
//  ViewController.swift
//  AlhanoufAlghayhab_AgingPeople
//
//  Created by administrator on 04/10/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var names = ["George" , "Betty" , "Fran" , "Joe", "Helda" , "Winifred" , "Zed" , "Sara" ,"Jeffy" , "Abraham" , "Anna" ,"Melinda" ]
   


    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
      
        TableView.dataSource = self
        // Do any additional setup after loading the view.
    }


}
extension ViewController: UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return names.count
   }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = TableView.dequeueReusableCell(withIdentifier: "NamesAndAges", for: indexPath)
       cell.textLabel?.text = names[indexPath.row]
       cell.detailTextLabel?.text = "\(Int.random(in: 5...95)) Years Old"
       return cell

   }
}
/*extension ViewController: UITableViewDelegate {
}*/
