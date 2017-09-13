//
//  ViewController.swift
//  PopOver
//
//  Created by Rahul Sharma on 13/09/17.
//  Copyright © 2017 Rahul Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPopoverPresentationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        let img = UIImage(named:"menu")
        let doneButton = UIBarButtonItem(image:img, style: UIBarButtonItemStyle.plain, target: self, action: #selector(btnPop))
        
        self.navigationItem.setRightBarButton(doneButton, animated: false)
        
        let Button = UIBarButtonItem(image:img, style: UIBarButtonItemStyle.plain, target: self, action: #selector(btnPop))
        self.navigationItem.setLeftBarButton(Button, animated: false)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func btnPop(_ sender: Any){
        
        
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let alertController = storyBoard.instantiateViewController(withIdentifier: "alertView") as! ALertViewController
            alertController.providesPresentationContextTransitionStyle = true
            alertController.definesPresentationContext = true
            alertController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            alertController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            
            self.present(alertController, animated: true, completion: nil)
            
            break
        case .pad:

            let vc = storyboard?.instantiateViewController(withIdentifier: "popOverMenu") as! PopOverTableViewController
            vc.preferredContentSize = CGSize(width: 200, height: 200)
            let navController = UINavigationController(rootViewController: vc)
            navController.modalPresentationStyle = UIModalPresentationStyle.popover
            
            let popOver = navController.popoverPresentationController
            popOver?.delegate = self
            popOver?.barButtonItem = sender as? UIBarButtonItem
            self.present(navController, animated: true, completion: nil)
            
            break
        case .unspecified:
            break
        default:
            break
            // Uh, oh! What could it be?
        }
        
        
        
        
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }

}

