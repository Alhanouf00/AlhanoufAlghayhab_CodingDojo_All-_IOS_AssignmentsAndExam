//
//  AddItemDelegate.swift
//  AlhanoufAlghayhab_BucketListRefactor
//
//  Created by administrator on 13/10/2021.
//

import UIKit

protocol AddItemDelegate : AnyObject
{
    func SendTasks(by Controller :BucketlistTableViewController ,with text:String,at indexPath: NSIndexPath?)
    
}

