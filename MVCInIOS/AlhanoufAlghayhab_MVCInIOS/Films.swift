//
//  Films.swift
//  AlhanoufAlghayhab_MVCInIOS
//
//  Created by administrator on 18/10/2021.
//

import UIKit

class Films: UITableViewController {
    var modelFilm: modelFilms?

    
    
    func getfilms()
    
    {
        Filmsapi.getAllFilms(completionHandler:
        {
            data, response, error in
                do {
                                  
                      guard let mydata = data else {return}
                      let postResult = try JSONDecoder().decode(modelFilms.self ,from: mydata)
                                     
                      self.modelFilm = postResult
                                     
                      DispatchQueue.main.async
                                     
                    {self.tableView.reloadData()}

                                    }
                                 
                                 catch {
                                   print(error)
                              
                                            }
                                        })
        
        }
        
    
       override func viewDidLoad() {
           super.viewDidLoad()
           getfilms()
           
           
          
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
