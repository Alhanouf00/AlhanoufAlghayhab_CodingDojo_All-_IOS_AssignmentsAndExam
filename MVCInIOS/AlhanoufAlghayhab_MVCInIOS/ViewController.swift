//
//  ViewController.swift
//  AlhanoufAlghayhab_MVCInIOS
//
//  Created by administrator on 18/10/2021.
//

import UIKit

class ViewController: UITableViewController {
    
    var Model: myModel?
       
          
  func getpeople()
    
    {
        peopleapi.getAllPeople(completionHandler:
            {
              data, response, error in
                    do {
                                                          
                         guard let mydata = data else {return}
                        let postResult = try JSONDecoder().decode(myModel.self ,from: mydata)
                                                             
                        self.Model = postResult
                                                             
                        DispatchQueue.main.async
                                                             
                        {self.tableView.reloadData()}

                       }
                                                         
            catch {print(error)}


                                                                    
                        })
                                
                                }
        
        
    
          override func viewDidLoad() {
              super.viewDidLoad()
              getpeople()
              
      }

          override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
              return Model?.results.count ?? 0
          }
          
          
          override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
              let cell = tableView.dequeueReusableCell(withIdentifier: "Pepole", for: indexPath)
              
              cell.textLabel?.text = Model?.results[indexPath.row].name
              return cell

          }
      }


