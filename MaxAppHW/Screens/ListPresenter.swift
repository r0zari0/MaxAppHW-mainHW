//
//  ListPresenter.swift
//  MaxAppHW
//
//  Created by Max Stovolos on 9/24/22.
//

import Foundation
import UIKit

protocol ListPresenterProtocol {
    var user: [MyUser] { get set }
    
    func showNewInfoVC(vc: UIViewController, indexPath: IndexPath)
}

class ListPresenter: ListPresenterProtocol {
    
    private let navigator: NavigatorProtocol
    
    var listVCProtocol: ListVCProtocol!
    
    init(navigator: NavigatorProtocol) {
        self.navigator = navigator
    }
    
    func set(listVCProtocol: ListVCProtocol) {
        self.listVCProtocol = listVCProtocol
    }
    
    var user: [MyUser] = [
        .init(name: "Max", lastName: "Max"),
        .init(name: "Dima", lastName: "Dima"),
        .init(name: "Stas", lastName: "Stas"),
        .init(name: "Tom", lastName: "Tom"),
        .init(name: "Jon", lastName: "Jon")
    ]
    
    func showNewInfoVC(vc: UIViewController, indexPath: IndexPath) {
        let user = self.user[indexPath.row]
        navigator.showNewInfoVC(view: vc, delegate: self, user: user)
    }
}

extension ListPresenter: NewInfoDelegate {
    func sendInfo(with user: MyUser) {
        self.user.append(user)
        listVCProtocol.reloadTableView()
    }
}
