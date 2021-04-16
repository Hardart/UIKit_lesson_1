//
//  AllGroupsViewController.swift
//  less_1
//
//  Created by Артем Шакиров on 13.04.2021.
//

import UIKit

class AllGroupsViewController: UIViewController {

    @IBOutlet weak var allGroups: UITableView!
    
    let groupCellID = "cusomTableViewCell"
    let groups = DataStorage.shared.groups
    
    override func viewDidLoad() {
        super.viewDidLoad()

        allGroups.dataSource = self
        allGroups.delegate = self
        
        let nibFile = UINib(nibName: "cusomTableViewCell", bundle: nil)
        allGroups.register(nibFile, forCellReuseIdentifier: groupCellID)
    }
    
    
    func showAlert(alertText: String, _ index: Int) {
        let alertCtrl = UIAlertController(title: "Добавить?", message: alertText, preferredStyle: UIAlertController.Style.alert)
        let alertButtonOk = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {_ in
            
//            dismiss(animated: true, completion: nil)
            
        })
        let alertButtonCancel = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.destructive, handler: nil)
        alertCtrl.addAction(alertButtonOk)
        alertCtrl.addAction(alertButtonCancel)
        present(alertCtrl, animated: true, completion: nil)
    }
    
   
    
}


extension AllGroupsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        showAlert(alertText: "Add to your list?", indexPath.row)
        DataStorage.shared.myGroups.append(groups[indexPath.row])
        self.navigationController?.popViewController(animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: groupCellID, for: indexPath) as! cusomTableViewCell
        cell.configure(title: groups[indexPath.row].title, age: groups[indexPath.row].desc, image: groups[indexPath.row].image)
        return cell
    }
    
    
}
