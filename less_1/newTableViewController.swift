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
    let toTableViewSegue = "toTableViewSegue"
    var numbers = ["One","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myTableView.dataSource = self
        myTableView.delegate = self
        
        let nibFile = UINib(nibName: "cusomTableViewCell", bundle: nil)
        myTableView.register(nibFile, forCellReuseIdentifier: groupCellID)
    }
    
}

extension newTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: toTableViewSegue, sender: self)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        numbers.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
        
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: groupCellID, for: indexPath) as! cusomTableViewCell
        let image = UIImage(named: "Castle")
        cell.configure(title: numbers[indexPath.row], description: "дополнительная информация", image: image)
        return cell
    }
    
    
    
}
