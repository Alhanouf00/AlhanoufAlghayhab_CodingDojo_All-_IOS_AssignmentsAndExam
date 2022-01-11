//
//  Films.swift
//  AlhanoufAlghayhab_FinalSteps
//
//  Created by administrator on 19/10/2021.
//

import UIKit

class Films: UITableViewController {
    var modelFilm: filmsModel?
        
    var TitleFilms: String!
    var ReleaseDateFilms: String!
    var DirectorFilms: String!
    var OpeningCrawlFilms: String!
    
    
    
    
           func FilmsData ()
           {
               
               let url = URL(string: "https://swapi.dev/api/films/?format=json")
                      
                      let session = URLSession.shared
                     
                      let task = session.dataTask(with: url!, completionHandler: {
                          
                          data, response, error in
                          do {
                           
                              guard let mydata = data else {return}
                              let postResult = try JSONDecoder().decode(filmsModel.self ,from: mydata)
                              
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
        FilmsData()
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
               return modelFilm?.results.count ?? 0
           }
           override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               let cell = tableView.dequeueReusableCell(withIdentifier: "Films", for: indexPath)
               
               cell.textLabel?.text = modelFilm?.results[indexPath.row].title
               return cell

           }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        TitleFilms = modelFilm?.results[indexPath.row].title
        ReleaseDateFilms = modelFilm?.results[indexPath.row].releaseDate
        DirectorFilms = modelFilm?.results[indexPath.row].director
        OpeningCrawlFilms = modelFilm?.results[indexPath.row].openingCrawl
            
        
        performSegue(withIdentifier: "Filmsdetail", sender: indexPath)

}
 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let send = segue.destination as? FilmsDetailTableViewController else {return}
        send.TitleDFilms = TitleFilms
        send.DirectorDFilms = ReleaseDateFilms
        send.ReleaseDateDFilms = DirectorFilms
        send.OpeningCrawlDFilms = OpeningCrawlFilms
        
    
    }
    
    
}
