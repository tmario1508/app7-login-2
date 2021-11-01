//
//  ViewController.swift
//  app7-login
//
//  Created by mario on 10/31/21.
//

import UIKit

class ViewController: UIViewController {
    var plist = UserDefaults.standard
    
    //singleton
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    @IBAction func OnSalir(_ sender: Any) {
        plist.removeObject(forKey: "usuario")
        let mainStoryBoard = appDelegate.MainStoryBoard()
        let viewController = appDelegate.GetViewController(storyboard: mainStoryBoard, ViewControllerName: "Login")
        appDelegate.SetrootViewController(rootViewController: viewController, animate: true, tipo: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

