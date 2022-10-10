//
//  NewInfoVC.swift
//  MaxAppHW
//
//  Created by Max Stovolos on 9/25/22.
//

import UIKit

class NewInfoVC: UIViewController {
    
    @IBOutlet weak var createUserButton: UIButton!
    
    @IBOutlet weak var newLastNameLabel: UITextField!
    @IBOutlet weak var newNameLabel: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!

    @IBOutlet weak var saveInfoButton: UIButton!
    
    private var vcState = MainVCState.hidden {
        didSet {
            self.setupState()
        }
    }
    
    let presenter: NewInfoPresenterProtocol
    
    init(presenter: NewInfoPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = presenter.user.name
        lastNameTextField.text = presenter.user.lastName
        setupState()
        setupNavigationController()
    }
    
    func setupNavigationController() {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createUser))
        navigationItem.rightBarButtonItem = button
    }
    
    @objc
    private func createUser() {
        vcState = vcState == .hidden ? .isNotHidden : .hidden
            }
    
    func setupState() {
        switch vcState {
        case .hidden:
            nameTextField.isHidden = false
            lastNameTextField.isHidden = false
            saveInfoButton.isHidden = false
            
            newNameLabel.isHidden = true
            newLastNameLabel.isHidden = true
            createUserButton.isHidden = true
            
            title = "Save"
        case .isNotHidden:
            nameTextField.isHidden = true
            lastNameTextField.isHidden = true
            saveInfoButton.isHidden = true
            
            newNameLabel.isHidden = false
            newLastNameLabel.isHidden = false
            createUserButton.isHidden = false
            
            title = "Create"
        }
    }

    @IBAction func saveInfoActionButton() {
        presenter.getText(with: nameTextField.text ?? "", and: lastNameTextField.text ?? "")
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func createUserButtonAction() {
        let newUser = MyUser(name: newNameLabel.text ?? "", lastName: newLastNameLabel.text ?? "")
        presenter.getText(with: newUser.name, and: newUser.lastName)
        navigationController?.popViewController(animated: true)
    }
}
