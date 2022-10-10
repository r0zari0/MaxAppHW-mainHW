//
//  ListVC.swift
//  MaxAppHW
//
//  Created by Max Stovolos on 9/24/22.
//

import UIKit

protocol ListVCProtocol {
    func edit(with text: String)
    func reloadTableView()
}

class ListVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let cellIdentifier: String = String(describing: Cell.self)
    
    let presenter: ListPresenterProtocol
    
    init(presenter: ListPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
}

extension ListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.showNewInfoVC(vc: self, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.user.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! Cell
        
        let user = presenter.user[indexPath.row]
        cell.config(with: user)
        
        return cell
    }
}

extension ListVC: ListVCProtocol {
    func edit(with text: String) {
    
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
}
