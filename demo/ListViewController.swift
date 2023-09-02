//
//  ListViewController.swift
//  demo
//
//  Created by Rystem Asqar on 7/11/23.
//

import UIKit
import SnapKit

class ListViewController: UIViewController {
    
    var tableView = UITableView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonTapped))

                // Assign the back button to the navigation item
                navigationItem.leftBarButtonItem = backButton
        
    }
    @objc func backButtonTapped() {
            // Handle the back button tap event here
            navigationController?.popViewController(animated: true) 
        }
    
    func configureTableView() {
        view.addSubview(tableView)
        title = "BookMarkList"
        setupDelegates()
        tableView.rowHeight = 50
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        setupConstraints()
    }
    
    func setupDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc func dismissView() {
            navigationController?.popViewController(animated: true)
        }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.strArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier) as! TableViewCell
        cell.titleLabel.text = Data.strArr[indexPath.row]
        Data.link = Data.linkArr[indexPath.row]
        return cell
    }
}
