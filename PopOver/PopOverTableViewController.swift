//
//  PopOverTableViewController.swift
//  PopOver
//
//  Created by Rahul Sharma on 13/09/17.
//  Copyright © 2017 Rahul Sharma. All rights reserved.
//

import UIKit

class PopOverTableViewController: UITableViewController {
    
    var items = ["Apple","Kiwi","Mango","Watermelon"]

    override func viewDidLoad() {
        super.viewDidLoad()

        //Mark:- To show the navigation bar when view will open
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        //Mark:
        tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    


}
