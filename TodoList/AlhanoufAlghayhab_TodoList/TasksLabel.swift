//
//  TasksLabel.swift
//  AlhanoufAlghayhab_TodoList
//
//  Created by administrator on 16/10/2021.
//

import UIKit


protocol AddItemDelegate : AnyObject
{
    func SendTasks(by Controller :TodListCustomClass , text:String , title:String,dateTime: Date ,at indexPath: NSIndexPath?)
    
    
    
}



class TasksLabel: UITableViewCell {

    
    
    @IBOutlet weak var Titletask: UILabel!
    
   
    @IBOutlet weak var TaskDetile: UILabel!
    
    @IBOutlet weak var TaskDateTime: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
