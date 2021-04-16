//
//  myGroupsViewController.swift
//  less_1
//
//  Created by Артем Шакиров on 13.04.2021.
//

import UIKit

class myGroupsViewController: UIViewController {

    @IBOutlet weak var myGroups: UITableView!
    
    let groupCellID = "cusomTableViewCell"
    var myGroupsArray = DataStorage.shared.myGroups
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        myGroups.dataSource = self
        myGroups.delegate = self
        
        let nibFile = UINib(nibName: "cusomTableViewCell", bundle: nil)
        myGroups.register(nibFile, forCellReuseIdentifier: groupCellID)
    }
    
}


extension myGroupsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroupsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: groupCellID, for: indexPath) as! cusomTableViewCell
        if myGroupsArray.count > 0 {
        cell.configure(title: myGroupsArray[indexPath.row].title, age: myGroupsArray[indexPath.row].desc, image: myGroupsArray[indexPath.row].image)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        myGroupsArray.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }

}
