//
//  ViewController.swift
//  AlhanoufAlghayhab_FinalSteps
//
//  Created by administrator on 19/10/2021.
//

import UIKit


protocol CustomRecivedetailsDelegate : AnyObject
{

func Recive(name: String! , gender: Gender! , Birthyear: String! , mass: String! )
    
}


class ViewController: UITableViewController {
    var peoplemodel: peopleModel?
    var Namepeople: String!
    var Genderpeople: Gender!
    var Birthpeople: String!
    var Masspeople: String!
    
    
    
    
    var recivepeople :CustomRecivedetailsDelegate?
          func PeopleData()
          {
              
              let url = URL(string: "https://swapi.dev/api/people/")
                     
                     let session = URLSession.shared
                    
                     let task = session.dataTask(with: url!, completionHandler: {
                         
                         data, response, error in
                         do {
                          
                             guard let mydata = data else {return}
                             let postResult = try JSONDecoder().decode(peopleModel.self ,from: mydata)
                             
                         self.peoplemodel = postResult
                             
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
        PeopleData ()
        // Do any additional setup after loading the view.
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
               return peoplemodel?.results.count ?? 0
           }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Namepeople = peoplemodel!.results[indexPath.row].name
         Genderpeople = peoplemodel!.results[indexPath.row].gender
         Birthpeople = peoplemodel!.results[indexPath.row].birthYear
         Masspeople = peoplemodel!.results[indexPath.row].mass

        performSegue(withIdentifier: "Godetail", sender: indexPath)
    
        
    }
           override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               
               let cell = tableView.dequeueReusableCell(withIdentifier: "People", for: indexPath)
               
               cell.textLabel?.text = peoplemodel?.results[indexPath.row].name
               return cell

           }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let send = segue.destination as? PeopleDetails else {return}
        send.NameDpeople = Namepeople
        send.GenderDpeople = Genderpeople
        send.BirthDpeople = Birthpeople
        send.MassDpeople = Masspeople
        
    
    }

}

