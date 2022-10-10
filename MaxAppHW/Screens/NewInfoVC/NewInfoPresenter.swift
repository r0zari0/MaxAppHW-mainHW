//
//  NewInfoPresenter.swift
//  MaxAppHW
//
//  Created by Max Stovolos on 9/25/22.
//

import Foundation

protocol NewInfoDelegate {
    
    func sendInfo(with user: MyUser)
}

protocol NewInfoPresenterProtocol {
    
    var user: MyUser { get }
    
    func getText(with text: String, and str: String)
    
}

class NewInfoPresenter: NewInfoPresenterProtocol {
    
    private let delegate: NewInfoDelegate
    let user: MyUser
    
    init(delegate: NewInfoDelegate, user: MyUser) {
        self.delegate = delegate
        self.user = user
    }
    
    func getText(with text: String, and str: String) {
        let user: MyUser = MyUser(name: text, lastName: str)
        
        delegate.sendInfo(with: user)
    }
}
