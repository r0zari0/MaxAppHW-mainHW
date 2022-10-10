//
//  Assembler.swift
//  MaxAppHW
//
//  Created by Max Stovolos on 9/24/22.
//

import Foundation
import UIKit

class Assembler {
    
    func createListVC(navigator: NavigatorProtocol) -> UIViewController {
        let presenter = ListPresenter(navigator: navigator)
        let vc = ListVC(presenter: presenter)
        presenter.set(listVCProtocol: vc)
        return vc
    }
    
    func createNewInfoVC(delegate: NewInfoDelegate, user: MyUser) -> UIViewController {
        let presenter = NewInfoPresenter(delegate: delegate, user: user)
        let vc = NewInfoVC(presenter: presenter)
        return vc
    }
}
