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
    @IBOutlet weak var scrollView: UIScrollView!
    
    let tabBarVC = "tabBarVC"
    let myLogin = "hardart"
    let myPass = "12345"
    
    
    
    
    override func viewDidLoad() {
		super.viewDidLoad()
    }

    func showAlert(alertText: String) {
        let alertCtrl = UIAlertController(title: "Ошибка", message: alertText, preferredStyle: UIAlertController.Style.alert)
        let alertButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: {_ in
            self.login_input.text = ""
            self.pass_input.text = ""
        })
        alertCtrl.addAction(alertButton)
        present(alertCtrl, animated: true, completion: nil)
    }
    
    
    @IBAction func entranceBtn(_ sender: Any) {
//        let login = self.login_input.text
//        let pass = self.pass_input.text
//
//        guard login?.trimmingCharacters(in: .whitespacesAndNewlines) == myLogin,
//              pass?.trimmingCharacters(in: .whitespacesAndNewlines) == myPass
//        else {
//            showAlert(alertText: "Логин или Пароль не верны!\nили не заполнены")
//            return
//
//        }
        
        performSegue(withIdentifier: tabBarVC, sender: self)
    }
    
    
    @objc func keyboardWasShown(notification: Notification) {
    // Получаем размер клавиатуры
    let info = notification.userInfo! as NSDictionary
    let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
    let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
    // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
    self.scrollView?.contentInset = contentInsets
    scrollView?.scrollIndicatorInsets = contentInsets }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Второе — когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
}

