//
//  ProfileViewController.swift
//  AlhanoufAlghayhab_MessangerAPP
//
//  Created by administrator on 27/10/2021.
//

import UIKit
import FirebaseAuth


class ProfileViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let data = ["Log Out"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
                tableView.delegate = self
                tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
}
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profile", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = .red
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) // unhighlight the cell
        // logout the user
        
        // show alert
        
        let actionSheet = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { [weak self] _ in
            // action that is fired once selected
            
        
            do {
                try FirebaseAuth.Auth.auth().signOut()
                
                // present login view controller
                let vc = self?.storyboard?.instantiateViewController(withIdentifier: "login")as! LoginViewController
                self?.present(vc, animated: true)
            }
            catch {
                print("failed to logout")
            }
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(actionSheet, animated: true)
    }
    
}
