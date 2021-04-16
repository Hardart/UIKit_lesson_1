//
//  AllGroupsTVC.swift
//  less_1
//
//  Created by Артем Шакиров on 14.04.2021.
//

import UIKit

class AllGroupsTVC: UITableViewController {

    let groupCellID = "cusomTableViewCell"
    let allGroups = DataStorage.shared.groups
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nibFile = UINib(nibName: "cusomTableViewCell", bundle: nil)
        self.tableView.register(nibFile, forCellReuseIdentifier: groupCellID)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allGroups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: groupCellID, for: indexPath) as! cusomTableViewCell

        cell.configure(title: allGroups[indexPath.row].title, age: allGroups[indexPath.row].desc, image: allGroups[indexPath.row].image)

        return cell
    }
    
    func showAlert(alertText: String, _ index: Int) {
        let alertCtrl = UIAlertController(title: "Добавить новую группу", message: alertText, preferredStyle: UIAlertController.Style.alert)
        let alertButtonOk = UIAlertAction(title: "Да", style: UIAlertAction.Style.default, handler: { [self]_ in
            DataStorage.shared.myGroups.append(allGroups[index])
//            self.navigationController?.popViewController(animated: true)
            
        })
        let alertButtonCancel = UIAlertAction(title: "Отменить", style: UIAlertAction.Style.destructive, handler: nil)
        alertCtrl.addAction(alertButtonOk)
        alertCtrl.addAction(alertButtonCancel)
        present(alertCtrl, animated: true, completion: nil)
    }
    
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showAlert(alertText: "Добавить группу в Избранное?", indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
