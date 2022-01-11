//
//  Customtableviewcell.swift
//  AlhanoufAlghayhab_BucketList
//
//  Created by administrator on 12/10/2021.
//

import UIKit



protocol CustomtableviewcellDelegate : AnyObject
{
    func SendTasks(by Controller :BucketlistTableViewController ,with text:String,at indexPath: NSIndexPath?)
    
}

