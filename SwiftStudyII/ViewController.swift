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
//    let tableCell = UITableViewCell(style: .subtitle, reuseIdentifier: "aCell")
    var dataSourceTemp = ["a","b","c","d","e","f","g","h","i"]

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
        
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "aCell")

        
    }
    
    
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceTemp.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "myCell")
        }
        
        cell!.detailTextLabel?.text = "This is a test"
        cell!.textLabel?.text = dataSourceTemp[indexPath.row]
        cell!.accessoryType = .detailButton
        cell!.imageView?.image = UIImage(systemName: "star")
        
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "can pull request from leepc777 main to iOSPatrick main ?"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tap cell at :\(indexPath)")
    }
}
