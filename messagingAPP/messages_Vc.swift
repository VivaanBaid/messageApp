//
//  messages_Vc.swift
//  messagingAPP
//
//  Created by Vivaan Baid on 17/07/21.
//

import Foundation
import UIKit
import MessageKit
import InputBarAccessoryView

//sender type
struct sender: SenderType{
    var senderId: String
    
    var displayName: String
    
}

//message
struct message: MessageType{
    var sender: SenderType
    
    var messageId: String
    
    var sentDate: Date
    
    var kind: MessageKind
    
    
}


class messages_vc: MessagesViewController {
    
    let current_user = sender(senderId: "123", displayName: "Vivaan")
    let other_user = sender(senderId: "876", displayName: "World")
    var messages = [message]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messageInputBar.delegate = self
        
        //sample data
        messages.append(message(sender: other_user, messageId: "123", sentDate: Date().addingTimeInterval(-86400) , kind: .text("Hey Vivaan, You are going to influence")))
        messages.append(message(sender: current_user, messageId: "143", sentDate: Date().addingTimeInterval(-86405) , kind: .text("Hey Vivaan, You are going to influence")))
        messages.append(message(sender: other_user, messageId: "153", sentDate: Date().addingTimeInterval(-86404) , kind: .text("Hey Vivaan, You are going to influence")))
        messages.append(message(sender: current_user, messageId: "163", sentDate: Date().addingTimeInterval(-86403) , kind: .text("Hey Vivaan, You are going to influence")))
        
    }
     func AddMessage(_ input: String){
        let new_message = message(sender: currentSender(), messageId: "504", sentDate: Date().addingTimeInterval(-8733), kind: .text(input))
        messages.append(new_message)
        messagesCollectionView.reloadData()
    }
    
    func configureAvatarView(_ avatarView: AvatarView, for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) {
        if message.sender.displayName == "Vivaan"{
            avatarView.image = UIImage(named: "Vivaan")
        }
    }
    
   
}

//MARK:- Data Source

extension messages_vc: MessagesDataSource{
    func currentSender() -> SenderType {
        return current_user
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    
    //the function below wants the number of messages
    //this framework groups every message in different sections
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    
    
}

//MARK:- LayoutDelegate

extension messages_vc: MessagesLayoutDelegate{
    
}

//MARK:- DisplayDelegate

extension messages_vc:MessagesDisplayDelegate{
    
}

extension messages_vc: InputBarAccessoryViewDelegate{
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        print("Selected")
        AddMessage(text)
        //clears the text inputted
        inputBar.inputTextView.text = ""
        
    }
    
}



