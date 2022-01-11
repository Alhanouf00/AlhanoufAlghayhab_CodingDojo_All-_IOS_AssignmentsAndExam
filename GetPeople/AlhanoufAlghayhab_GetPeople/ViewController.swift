//
//  ViewController.swift
//  AlhanoufAlghayhab_GetPeople
//
//  Created by administrator on 17/10/2021.
//

import UIKit

class ViewController: UITableViewController {

    var Model: myModel?
    
       func loadDAta ()
       {
           
           let url = URL(string: "https://swapi.dev/api/people/")
                  
                  let session = URLSession.shared
                 
                  let task = session.dataTask(with: url!, completionHandler: {
                      
                      data, response, error in
                      do {
                       
                          guard let mydata = data else {return}
                          let postResult = try JSONDecoder().decode(myModel.self ,from: mydata)
                          
                      self.Model = postResult
                          
                          DispatchQueue.main.async
                          
                          {

                          self.tableView.reloadData()
                              
                          }
                          
                                     }
                      
                      catch {
                        print(error)
                   
                                 }
                             })
                
                 
                  task.resume()
          }
       
       override func viewDidLoad() {
           super.viewDidLoad()
           loadDAta ()
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

