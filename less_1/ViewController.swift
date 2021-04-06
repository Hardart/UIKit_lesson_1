//
//  ViewController.swift
//  less_1
//
//  Created by Артем Шакиров on 06.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var login_input: UITextField!
    @IBOutlet weak var pass_input: UITextField!
    
    override func viewDidLoad() {
		super.viewDidLoad()
    }

    @IBAction func entranceBtn(_ sender: Any) {
        let myLogin = "hardart"
        let myPass = "12345"
        let login = self.login_input.text
        let pass = self.pass_input.text
        if login == myLogin,
           pass == myPass {
            performSegue(withIdentifier: "toInfo", sender: self)
        } else if login == ""{
            self.login_input.text = "Поле Логин не может быть пустым"
        } else {
            self.login_input.text = "Логин не верный!"
        }
    }
    
}

