//
//  CustomTableDelegate.swift
//  AlhanoufAlghayhab_BucketlistAPI
//
//  Created by administrator on 22/10/2021.
//

import UIKit



protocol CustomtableviewcellDelegate : AnyObject
{
    func SendTasks(by Controller :BucketlistTableViewController ,with text:String,at indexPath: NSIndexPath?)
    
}
