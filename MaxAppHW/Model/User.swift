//
//  User.swift
//  MaxAppHW
//
//  Created by Max Stovolos on 9/24/22.
//

import Foundation

struct MyUser {
    let name: String
    let lastName: String
    let userID: UUID
    
    init(name: String, lastName: String) {
        self.name = name
        self.lastName = lastName
        self.userID = UUID()
    }
    
    init(user: User) {
        self.name = user.name ?? ""
        self.lastName = user.lastName ?? ""
        self.userID = user.id ?? UUID()
    }
}
