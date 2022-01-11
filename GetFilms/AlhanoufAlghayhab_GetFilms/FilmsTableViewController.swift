//
//  FilmsTableViewController.swift
//  AlhanoufAlghayhab_GetFilms
//
//  Created by administrator on 17/10/2021.
//

import UIKit

class FilmsTableViewController: UITableViewController {

   
    var modelFilm: modelFilms?
    
       func loadDAta ()
       {
           
           let url = URL(string: "https://swapi.dev/api/films/?format=json")
                  
                  let session = URLSession.shared
                 
                  let task = session.dataTask(with: url!, completionHandler: {
                      
                      data, response, error in
                      do {
                       
                          guard let mydata = data else {return}
                          let postResult = try JSONDecoder().decode(modelFilms.self ,from: mydata)
                          
                      self.modelFilm = postResult
                          
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
           return modelFilm?.results.count ?? 0
       }
       
       
       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "Films", for: indexPath)
           
           cell.textLabel?.text = modelFilm?.results[indexPath.row].title
           return cell

       }


}
