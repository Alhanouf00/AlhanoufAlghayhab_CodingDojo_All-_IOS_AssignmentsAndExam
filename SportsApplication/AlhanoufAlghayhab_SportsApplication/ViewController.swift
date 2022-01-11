//
//  ViewController.swift
//  AlhanoufAlghayhab_SportsApplication
//
//  Created by administrator on 29/10/2021.
//

import UIKit
import CoreData


class ViewController: UIViewController {
    
    var slecetdcellindex = 0
    
    
    var managedObjectContextOfSports = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var sport = [Sports]()
   // var pickImage = UIImageView
    @IBOutlet weak var sportlabel: UILabel!
    
    @IBOutlet weak var imagebtn: UITableView!
    
    /*
    @IBAction func addImage(_ sender: UIButton) {
        var Image = UIImagePickerController()
        Image.sourceType = .photoLibrary
        Image.delegate = self
        Image.allowsEditing = true
               present(Image, animated: true, completion: nil)
                
        
    }
    */
    
    @IBAction func addSports(_ sender: UIButton) {
    
        addsport()

    }
    
    @IBOutlet weak var tableView: UITableView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 150

        fetchSports()
        
    }
    
    
    func addsport()
    {
        let addAlert = UIAlertController(title: "Add sport ", message: "Add the sport you want it", preferredStyle: .alert)
        
        addAlert.addTextField(configurationHandler: nil)
       let sport =  addAlert.textFields![0]
        sport.placeholder = "Enter sport"
        
    
        let saveAction = UIAlertAction(title: "Save", style: .default)
               {
                   _ in

                   
                   let newSport = Sports(context: self.managedObjectContextOfSports)
                   newSport.name = sport.text!
              
                   self.tableView.reloadData()
                   
                   self.saveSports()
               }
        
        
        
    present(addAlert, animated: true, completion: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        addAlert.addAction(saveAction)
        addAlert.addAction(cancelAction)

        
        
    }
    
    
    
    
    func pickImagFromGallery()
        {
            let profile = UIImagePickerController()
           
            profile.sourceType = .photoLibrary
            profile.delegate = self
            profile.allowsEditing = true
            self.present(profile, animated: true, completion: nil)
            
        }
    
    
   
    
    
    
    
    
    
   func saveSports()
    {
        do {
                    try managedObjectContextOfSports.save()
                    print("Save successful")
                } catch {
                    print("Error \(error)")
                }
                
                fetchSports()
        
    }
    
    
    func fetchSports()
    {
        do {
                    sport = try managedObjectContextOfSports.fetch(Sports.fetchRequest())
                    print("Success")
                } catch {
                    print("Error: \(error)")
                }
                tableView.reloadData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if sender is IndexPath
        {
        
        print("go to next")
        guard let player = segue.destination as? nameOfSportsTableViewController else {return}
            let indexPath = sender as! NSIndexPath
            player.sporttypes = sport [indexPath.row]
            
            
        }
           
    }
    


}
extension ViewController: UITableViewDataSource ,UITableViewDelegate {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
       return sport.count
      
   }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "name", for: indexPath) as! CustomDelegateTableViewCell
       
       //cell.buttonaddimage.tag = indexPath.row
       //cell.myButton.addTarget(self, action: #selector(self.myButtonClicked(_:)), for: .touchUpInside)

       cell.sportsName.text! = sport [indexPath.row].name ?? "nil sport"
    
      
       
       cell.AddImage.isUserInteractionEnabled = true
              cell.AddImage.tag = indexPath.row
              let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
              
              cell.AddImage.addGestureRecognizer(tapGesture)
                                                
                                        
            
       return cell
       
   }
    
    
    /*
    @objc func myButtonClicked(_ sender:Any) {
            print("Control is here")
            let myButton = sender as? UIButton
            print("clicked button from Row #\(myButton?.tag)")
        }
*/
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
    //        guard let a = (sender.view as? UILabel)?.text else { return }
            print("Clicked row is: \(sender.view?.tag)")
        
        slecetdcellindex = sender.view!.tag
        
        
        pickImagFromGallery()
        
        
        
        }

     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         let sportname = sport[indexPath.row]
         managedObjectContextOfSports.delete(sportname)
               
               do
               {
              try managedObjectContextOfSports.save()
                   
               } catch
               {print("\(error)")}
               
        
        sport.remove(at: indexPath.row)
       
        tableView.reloadData()
    }

     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let addAlert = UIAlertController(title: "Edit sport ", message: "Edit the sport you want it", preferredStyle: .alert)
        /*
        addAlert.addTextField(configurationHandler: nil)
        addAlert.textFields![0].text = sport[indexPath.row].name
        let EditAction = UIAlertAction(title: "Save edit", style: .default)
        {_ in
                   do
                   {
                       try self.managedObjectContextOfSports.save()
                       
                   } catch
                   {print("\(error)")}
                   
            tableView.reloadData()
               }
        addAlert.addAction(EditAction)
         */
       //var sport =  addAlert.textFields![0]
        
        //sport.text! = "\(sport[indexPath.row].name)"
        
        do
        {
       try managedObjectContextOfSports.save()
            
        } catch
        {print("\(error)")}
        
 tableView.reloadData()
        
        
        performSegue(withIdentifier: "goplayer", sender: indexPath)
        
        
        
     }
    
}
extension ViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
//        imageview.image = image
        print("Yes control is here")
        let indexPath = IndexPath(row: slecetdcellindex, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as! CustomDelegateTableViewCell
        cell.imageViewSport.image = image
       
        picker.dismiss(animated: true,completion: nil)
        
        do{
            
            try managedObjectContextOfSports.save()
            
        } catch let error
                    
        {
            print(error.localizedDescription)
            
        }
        
      
           }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        
    }
    
}



