//
//  ALertViewController.swift
//  PopOver
//
//  Created by Rahul Sharma on 13/09/17.
//  Copyright © 2017 Rahul Sharma. All rights reserved.
//

import UIKit

class ALertViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var viewHide: UIView!
    @IBOutlet weak var alertHeight: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    
    var items = ["Apple","Kiwi","Mango","Watermelon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor =  UIColor.black.withAlphaComponent(0.7)
        
        alertHeight.constant = self.view.frame.height/2
        
        self.tableView.tableFooterView = UIView()
        
        //Mark:
        self.viewHide.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action:#selector(viewDismiss))
        self.viewHide.addGestureRecognizer(tapGesture)
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alert", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    //Mark:
    func viewDismiss(){
        self.presentingViewController!.dismiss(animated: true, completion: nil)
        
    }

   
}
