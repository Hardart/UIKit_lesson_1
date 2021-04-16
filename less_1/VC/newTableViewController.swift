//
//  newTableViewController.swift
//  less_1
//
//  Created by Артем Шакиров on 12.04.2021.
//

import UIKit

class newTableViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    let groupCellID = "cellForGroup"
    let toCollecViewSegue = "toCollection"
    
    var users = DataStorage.shared.users
    
    func addFriend() {
        let newFriend = User(name: "Jonny", age: 15)
        users.append(newFriend)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
        let nibFile = UINib(nibName: "cusomTableViewCell", bundle: nil)
        myTableView.register(nibFile, forCellReuseIdentifier: groupCellID)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let dst = segue.destination as! customCollectionViewController
        let src = segue.source as! newTableViewController
        let index = src.myTableView.indexPathForSelectedRow
        dst.photos = users[index!.row].photoArray
    }
}

extension newTableViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: toCollecViewSegue, sender: self)
        myTableView.reloadData()
    }
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: groupCellID, for: indexPath) as! cusomTableViewCell
        
        cell.configure(title: users[indexPath.row].name, age: "Возраст: \(users[indexPath.row].age) лет", image: users[indexPath.row].avatar)
        return cell
    }
    
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            users.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
}
