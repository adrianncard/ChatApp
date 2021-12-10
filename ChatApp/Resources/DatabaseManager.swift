//
//  DatabaseManager.swift
//  ChatApp
//
//  Created by Adrian Cardenas on 2021-12-09.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
}

//MARK - Account Management

extension DatabaseManager{
    
    public func userExists(with email: String,
                           compleiton: @escaping((Bool) -> Void)){
        
        var safeEmail = email.replacingOccurrences(of: ".", with: "_")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "_")
        
        
        database.child(safeEmail).observeSingleEvent(of: .value, with: {snapshot in
            guard (snapshot.value as? String) != nil else{
              compleiton(false)
                return
            }
            
            compleiton(true)
        })
        
    }
    
    /// inserts new user to data base
    public func insertUser(with user: ChatAppUser){
         database.child(user.safeEmail).setValue([
             "first_name": user.firstName,
             "last_name": user.lastName
         ])
     }

    
}

struct ChatAppUser{
    let firstName: String
    let lastName: String
    let emailAddress: String
    
//    let profilePictureUrl: String
    
    var safeEmail: String{
    var safeEmail = emailAddress.replacingOccurrences(of: ".", with: "_")
    safeEmail = safeEmail.replacingOccurrences(of: "@", with: "_")
        return safeEmail
    }
    
    
}
