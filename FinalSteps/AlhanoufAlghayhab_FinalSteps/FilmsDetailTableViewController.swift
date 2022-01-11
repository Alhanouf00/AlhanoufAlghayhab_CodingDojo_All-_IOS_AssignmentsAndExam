//
//  FilmsDetailTableViewController.swift
//  AlhanoufAlghayhab_FinalSteps
//
//  Created by administrator on 21/10/2021.
//

import UIKit

class FilmsDetailTableViewController: UITableViewController {
    
    var TitleDFilms: String!
    var ReleaseDateDFilms: String!
    var DirectorDFilms: String!
    var OpeningCrawlDFilms: String!
    
    
    @IBOutlet weak var Titlef: UILabel!
    
    
    @IBOutlet weak var ReleaseDate: UILabel!
    
    
    @IBOutlet weak var Director: UILabel!
    
    @IBOutlet weak var OpeningCrawl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Titlef.text! = TitleDFilms
        ReleaseDate.text! = ReleaseDateDFilms
        Director.text! = DirectorDFilms
        OpeningCrawl.text! = OpeningCrawlDFilms

       
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
     override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
         performSegue(withIdentifier: "Backf", sender: indexPath)
     
         
     }
    

}
