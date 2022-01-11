//
//  ChatViewController.swift
//  AlhanoufAlghayhab_MessangerAPP
//
//  Created by administrator on 31/10/2021.
//

import UIKit
import Firebase
import FirebaseDatabase
import MessageKit
import InputBarAccessoryView

struct Message: MessageType {
    var sender: SenderType
    
    var messageId: String
    
    var sentDate: Date
    
    var kind: MessageKind
}
struct Sender: SenderType{
    var photURL: String
    var senderId: String
    var displayName: String
    
    
}

/*
extension MessageKind {
    var messageKindString: String {
        switch self {
        case .text(_):
            return "text"
        }}}
*/

class ChatViewController: MessagesViewController {
    private var messages: [Message] = []
    private var messageListener: ListenerRegistration?
    let current = FirebaseAuth.Auth.auth().currentUser
    
//    var selfSender = Sender(photURL: "String", senderId: "alhanoufone-gmail-com", displayName: "First Name")

    override func viewDidLoad() {
      
        super.viewDidLoad()
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messageInputBar.delegate = self
        
        //let fakeMessage = Message(sender: selfSender, messageId: "1", sentDate: Date(), kind: .text("Hello this is a fake message"))
        
        
        //print("CurrentUser \(current)")
        DatabaseManger.shared.fetchConversation(path: "\(current!)") { result in
            switch result{
            case .success(let messageText):
                
                print("messageText: \(messageText)")
                
                for dataDict in messageText {
                    let selfSender = Sender(photURL: "String", senderId: dataDict["Sender email"] as! String, displayName: "First Name")

                    let message = Message(sender: selfSender, messageId: "", sentDate: Date(), kind: .text(dataDict["MessageContent"] as! String))
                    self.messages.append(message)
                }
                
//                let message = Message(sender: self.selfSender, messageId: "", sentDate: Date(), kind: .text(messageText))
//                self.messages.append(message)

                DispatchQueue.main.async {
                    self.messagesCollectionView.reloadData()
                }
            case .failure(_):
                print("Error no message")
            }
        }
    }
    

    
    
    
    
    
    
}

extension ChatViewController: InputBarAccessoryViewDelegate{
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        print ("\(text)")

          inputBar.inputTextView.text = ""
        
        DatabaseManger.shared.Conversation(Message: text, sendemail: "alhanoufone-gmail-com",reciveemail:"Alhanouftwo-gmail-com")
    }
}



extension ChatViewController: MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
    func currentSender() -> SenderType {
         return Sender(photURL: "Example", senderId: "alhanoufone-gmail-com", displayName: "displayName")
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    
    
    func messageTopLabelAttributedText(
        for message: MessageType,
        at indexPath: IndexPath
      ) -> NSAttributedString? {
        let name = message.sender.displayName
        return NSAttributedString(
          string: name,
          attributes: [
            .font: UIFont.preferredFont(forTextStyle: .caption1),
            .foregroundColor: UIColor(white: 0.3, alpha: 1)
          ])
      }

}
