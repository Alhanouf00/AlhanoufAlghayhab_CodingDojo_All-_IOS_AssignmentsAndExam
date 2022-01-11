//
//  DatabaseManager.swift
//  AlhanoufAlghayhab_MessangerAPP
//
//  Created by administrator on 31/10/2021.
//
 
import Foundation
import FirebaseDatabase
import Firebase
import Photos
import FirebaseStorage


// singleton creation below
// final - cannot be subclassed
struct Users
{
    let firstName : String!
    let lastName : String!
    let Email : String!
}

struct Messages
{
    let messages : String
    
}
final class DatabaseManger {
    
    static let shared = DatabaseManger()
    
    // reference the database below
    
    private let database = Database.database().reference()
    private let Fdatabase = Firestore.firestore()
    private var reference: CollectionReference?

    
    // create a simple write function
    
    
   
    public func test() {
        // NoSQL - JSON (keys and objects)
        // child refers to a key that we want to write data to
        // in JSON, we can point it to anything that JSON supports - String, another object
        // for users, we might want a key that is the user's email address
        
        database.child("foo").setValue(["something":true])
    }
    
}

// MARK: - account management


// User Database
extension DatabaseManger
{
    let currentUser = Firebase.Auth.auth().currentUser?.uid
    
    
    //    func insertNewUser (with user : Users ,completion: @escaping (Bool) -> Void)
    func insertNewUser (firstname: String ,lastname: String , email: String )
    {
        //reference = database.collection()

    ///Users/administrator/Desktop/AlhanoufAlghayhab_MessangerAPP/AlhanoufAlghayhab_MessangerAPP/Views/Base.lproj/Main.storyboard: warning: Deprecations: Push segues are deprecated since iOS 8.0
      /*  database.child("users").child(user.Email).setValue(["First Name": user.firstName , "Last Name": user.lastName , "Email": user.Email]){ error, _ in
            guard error  == nil else {
                print("failed to write to database")
                completion(false)
                return
            }  */
        
//        database.child("users").child(user.Email)
//        database.child("First Name").setValue(user.firstName)
//        database.child("Last Name").setValue(user.lastName)
        
        database.child("currentUser").child(email).setValue(["First Name": firstname , "Last Name": lastname])
        
//        database.child("First Name").setValue(firstname)
//        database.child("Last Name").setValue(lastname)
        
    }
}

// Database messages
extension DatabaseManger

{
    func Conversation (Message:String, sendemail: String , reciveemail: String)
    
    {

        database.child("conversation")
        let messageuid = Int.random(in: 0...10000)
        
        
        var conversation: [Any?] = []
        
        let sendnewMessage: [String: Any] = [
            "Messageid": messageuid,
            "MessageContent": Message,
            "Sender email": sendemail,
            "Recive email": reciveemail
            ]
        
        let recivenewMessage: [String: Any] = [
            "Messageid": messageuid,
            "MessageContent": Message,
            "Sender email": reciveemail,
            "Recive email": sendemail
          
            ]
        
//database.child("users").child("\(email)").child("MessageuID").child("\(messageuid)").setValue(["Message": Message])
        
        conversation.append(sendnewMessage)
        conversation.append(recivenewMessage)
        
    
        print("This a new message \(sendnewMessage)")
        
        //let myDataDict: [String:Any] = ["Message": Message,"messageuid":messageuid]
        
        
//        database.child("users").child("\(sendemail)").child("Messages").setValue(conversation)
      //  database.child("users").child("\(reciveemail)").child("Messages").setValue(conversation)
        //database.child("users").child("\(currentUser)").child("Messages").setValue(conversation)
        database.child("currentUser").child("\(reciveemail)").child("Messages").setValue(conversation)
        
    }
    
    func fetchConversation (path: String, completion: @escaping (Result< [[String:Any]],Error>)-> Void)
    {
        
       
        
            
        database.child("\(path)/email/Messages").observeSingleEvent(of:.value) { snapShot in
            guard let messageDict = snapShot.value as? [[String:Any]] else{
                //completion(ErrorUserInfoKey)
                print("path: \(path)")
         print("Something went wrong... please check the path")
                return
            }
            
            print("Fetched Messages are: \(messageDict)")
            /*
            for message in messageDict
            {*/
//            if case let MessageContent = messageDict {
            completion(.success(messageDict))
//                    print("MessageContent: \(MessageContent)")
               // }
//            }
             
        }
        
    }
    /*
func uploadimage()
    {
        
        let storage = Storage.storage()
        let data = Data()
        let StorageRef = storage.reference()
        let local = fileURL
       let profilephoto =  StorageRef.child("profilePhoto")
        let upload = profilephoto.putFile(from: local, metadata: nil){ (metadata , err) in
            
            guard let metadata = metadata else {print(err)
            
            return
            }
            
            print("Uploaded")
            
            }
        

}
     */
    
/*
    func uploadimage(email : String , imageData: Data ,completion: @escaping (String? ,Error?)->Void )
    
    {
        let imagePath = "/profileimage/\(email)"


        let ref = storage.reference(withPath: imagePath)



        ref.putData(imageData , metadata: nil)
        { (meta , error)in

        if let imageUploaderror = error

        {
completion (nil , imageUploaderror)
            return


        }
        
    }
    }
    */
}
    
    

