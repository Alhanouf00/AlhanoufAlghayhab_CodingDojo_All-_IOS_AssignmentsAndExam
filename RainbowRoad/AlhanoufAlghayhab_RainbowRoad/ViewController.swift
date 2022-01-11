//
//  ViewController.swift
//  AlhanoufAlghayhab_RainbowRoad
//
//  Created by administrator on 05/10/2021.
//

import UIKit

class ViewController: UIViewController {

   
    
    
    @IBOutlet weak var Rainbow: UITableView!
    
    var Color = [UIColor(red: 1.00, green: 0.00, blue: 0.00, alpha: 1.00)
                 
 ,UIColor(red: 1.00, green: 0.50, blue: 0.00, alpha: 1.00)
 ,UIColor(red: 1.00, green: 1.00, blue: 0.00, alpha: 1.00)


                 
 
                 
 ,UIColor(red: 0.00, green: 1.00, blue: 0.00, alpha: 1.00)
                 
 ,UIColor(red: 0.00, green: 0.00, blue: 1.00, alpha: 1.00)
                 
,UIColor(red: 0.29, green: 0.00, blue: 0.51, alpha: 1.00)
                 
,UIColor(red: 0.58, green: 0.00, blue: 0.83, alpha: 1.00)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Rainbow.reloadData()
        Rainbow.dataSource = self
        Rainbow.rowHeight = 120
        
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 7
   }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "Rainbow", for: indexPath)
       cell.backgroundColor = Color [indexPath.row]

    
       return cell
       
   }
    
    
   
    
    
    
    
    
    
    
}
