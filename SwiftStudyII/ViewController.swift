//
//  ViewController.swift
//  SwiftStudyII
//
//  Created by myHotmail on 12/22/21.
//

import UIKit

class ViewController: UIViewController {

    var tableView = UITableView()
//    var tableCell = UITableViewCell()
    let tableCell = UITableViewCell(style: .subtitle, reuseIdentifier: "aCell")
    var dataSourceTemp = ["a","b","c"]
//    var dataSourceTemp = ["a"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }


    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = self.view.frame
        tableView.backgroundColor = .systemTeal
        tableView.rowHeight = self.view.bounds.height/5
        self.view.addSubview(tableView)
        
//        tableCell = UITableViewCell(style: .subtitle, reuseIdentifier: "aCell")
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "aCell")
        

        
    }
    
    
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("dataSourceTemp:\(dataSourceTemp.count)")
        return dataSourceTemp.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("===> cellForRowsAt indexPath:\(indexPath)")
        
        
        
        // 1. this works. No need to regist any cell. But this doesn'thave dequeue and reuse cell
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "myTableCell")
        cell.detailTextLabel?.text = "This is a test"
        cell.textLabel?.text = dataSourceTemp[indexPath.row]
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section Title : Test"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tap cell at :\(indexPath)")
    }
}
