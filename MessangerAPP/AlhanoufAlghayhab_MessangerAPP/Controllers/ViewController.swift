//
//  ViewController.swift
//  AlhanoufAlghayhab_MessangerAPP
//
//  Created by administrator on 27/10/2021.
//

import UIKit
import FirebaseAuth


class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        tableView.reloadData()
        tableView.delegate = self
        tableView.dataSource = self
        validateAuth()

    }

    private func validateAuth(){
        // current user is set automatically when you log a user in
        
          // ...
        if FirebaseAuth.Auth.auth().currentUser == nil {
            // present login view controller
            print("Not logging")
            let vc = storyboard?.instantiateViewController(withIdentifier:"login")as! LoginViewController
            present(vc, animated: true)
    
        }
    }
    

}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "conv", for: indexPath)
        cell.textLabel?.text = "Alhnaouf Messanger App is working "
        
        return cell
    }
    
    // when user taps on a cell, we want to push the chat screen onto the stack
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "gochat", sender: indexPath)
    }
}



    




