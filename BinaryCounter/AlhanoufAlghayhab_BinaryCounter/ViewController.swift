//
//  ViewController.swift
//  AlhanoufAlghayhab_BinaryCounter
//
//  Created by administrator on 09/10/2021.
//

import UIKit

class ViewController: UITableViewController {
    
    
    var totalnumber = 0
    var minusnumber = 0
    
    
    @IBOutlet weak var Total: UILabel!
    
    override    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Binary", for: indexPath) as! BinaryCounter
        cell.Bridge = self
        cell.Numbers.text = String(Int(pow(10,Double(indexPath.row))))
            
            return cell
        }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 15
        }
    

    override func viewDidLoad() {
        tableView.dataSource = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: BinaryCounterDelegate{
    
    func TotalofNumbers(total: Int) {
        //print (total)
      //  print(self.minusnumber = -total)
       self.totalnumber += total
        
        
        
        //self.minusnumber -= total
        
        Total.text = "Total: \(self.totalnumber)"
        //Total.text = "Total: \(self.minusnumber)"
    }
    
}
