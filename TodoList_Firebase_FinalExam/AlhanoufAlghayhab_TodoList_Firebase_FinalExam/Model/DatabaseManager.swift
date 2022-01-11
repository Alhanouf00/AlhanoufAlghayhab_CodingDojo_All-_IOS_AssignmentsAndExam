//
//  DatabaseManager.swift
//  AlhanoufAlghayhab_TodoList_Firebase_FinalExam
//
//  Created by administrator on 10/11/2021.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase

// Strucut to maiplute with realtime database
struct Grocery
{
var item: String = ""
var addedBy: String = ""
var ItemID: String = ""
var complete: String = "false"
    
}

final class DatabaseManger {

    static let shared = DatabaseManger()
    private let database = Database.database().reference() //Varible mediator between realtime database and me
    private let currentUser = Firebase.Auth.auth().currentUser!.uid //Varible to hold unique id for the user
}

extension DatabaseManger
{
    //Function that create user and store to database
    func createNewUser (Name: String , Email: String , Password: String)
    
    {
       
    /* Varible safeEmail its hold email after replacing the @ and .
     cause in the realtime databse the email is store in this format exapmle-exapmle-com
      */
       var safeEmail = Email.replacingOccurrences(of: "@", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: ".", with: "-")
        //create child of unique id *currentUser* then send Name and email as array
        database.child(String("\(currentUser)")).setValue(["Name": Name,"Email":safeEmail])
        
    }

    //Function to store item in realtime database
    func addItems (Item: String , user: String)
    {
        
        let itemId = UUID().uuidString // This varible is hold randomly string value to store every item with unique value
        var items: Grocery = Grocery() // create varible of type Grocery
        items.item = Item
        items.addedBy = user
        /*
         groceryTasks is a dictionary  its have 3 key
         Item Id : value is randomly string value
         Item : value is the item its added by user
         Added by: value is the user who is added item
         */
        let groceryTasks =  ["ItemID":itemId ,"item": items.item ,"Added by": items.addedBy]
        
        //create child of unique id *itemId* then groceryTasks as dictionary
        database.child("grocerytasks").child(itemId).setValue(groceryTasks)
    }
    
    func editItems (path:String,Item: String , user: String )
    {
        //Function to edite item in realtime database
        var items: Grocery = Grocery()
        items.item = Item
        items.addedBy = user
        
        /* In groceryTasks the "ItemID" will the id is selected by user in taple view
         and its the way to reach every unique id was created in function *addItems*
         
         */
        let groceryTasks = ["ItemID": path,"item": items.item , "Added by": items.addedBy]

        //Reach to the path of unique id then set a new value
        database.child("grocerytasks/\(path)").setValue(groceryTasks)
    
    }
    
    func deleteItems (path:String)
    { //Function to delete item in realtime database
     
        //Reach to the path of unique id then make it a nil to delete
        database.child("grocerytasks/\(path)").setValue(nil)
    
    }

}





