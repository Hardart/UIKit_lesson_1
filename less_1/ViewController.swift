//
//  ViewController.swift
//  less_1
//
//  Created by Артем Шакиров on 06.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var login: UITextField!
    @IBAction func entrance(_ sender: Any) {
        let myLogin = self.login.text
        if myLogin != "" {
            print("Your text is \(myLogin!)")
        }
    }
    
    
    
    override func viewDidLoad() {
		super.viewDidLoad()
		self.login.placeholder = "Hello"
    }


}

