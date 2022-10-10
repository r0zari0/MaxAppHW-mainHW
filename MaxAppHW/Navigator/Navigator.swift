//
//  Navigator.swift
//  MaxAppHW
//
//  Created by Max Stovolos on 9/24/22.
//

import Foundation
import UIKit

protocol NavigatorProtocol {
    func showNewInfoVC(view: UIViewController, delegate: NewInfoDelegate, user: MyUser)
}
class Navigator: NavigatorProtocol {
    
    private let assembler = Assembler()
    
    func showListVC() -> UIViewController {
        let vc = assembler.createListVC(navigator: self)
        return vc
    }
    
    func showNewInfoVC(view: UIViewController, delegate: NewInfoDelegate, user: MyUser) {
        let vc = assembler.createNewInfoVC(delegate: delegate, user: user)
        view.navigationController?.pushViewController(vc, animated: true)
    }
}
