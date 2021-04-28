//
//  newTableViewController.swift
//  less_1
//
//  Created by Артем Шакиров on 12.04.2021.
//

import UIKit

class myFriendsVC: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    
    let groupCellID = "cellForGroup"
    let toCollecViewSegue = "toCollection"
    var myFriends = DataStorage.shared.users
    var letters: [String] = []
    var contacts = [[User]]()
    
    let searchController: UISearchController = {
        let searchField = UISearchController()
        return searchField
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.myTableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        setNames()
        myTableView.dataSource = self
        myTableView.delegate = self
        
        
        myTableView.register(MyFriendTVCell.self, forCellReuseIdentifier: MyFriendTVCell.id)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let dst = segue.destination as! photosCVC
        let src = segue.source as! myFriendsVC
        let index = src.myTableView.indexPathForSelectedRow
        dst.photos = contacts[index!.section][index!.row].photoArray
    }
    
    
    func setNames() {
        
        var arr = [String]()
        for el in myFriends {
            arr.append(String(el.name.prefix(1)))
        }
        
        myFriends.sort{ ($0.name as String) < ($1.name as String) }
        letters = Array(Set(arr))
        letters.sort()
        
        for i in 0..<letters.count {
            var array = [User]()
            for j in 0..<myFriends.count {
                if letters[i] == myFriends[j].name.prefix(1) {
                    array.append(myFriends[j])
                }
            }
            contacts.append(array)
        }
    }
}

//extension Sequence where Element: Hashable {
//    func uniqued() -> [Element] {
//        var set = Set<Element>()
//        return filter { set.insert($0).inserted }
//    }
//}

extension myFriendsVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        print(text)
    }
    
    
}

extension myFriendsVC: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: toCollecViewSegue, sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return letters.count
    }
    

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return letters[section]
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyFriendTVCell.id, for: indexPath) as? MyFriendTVCell else  {
            return UITableViewCell()
        }
        
        let age = contacts[indexPath.section][indexPath.row].age
        cell.configure(name: contacts[indexPath.section][indexPath.row].name, age: "\(checkAge(age!, args: ["год", "года", "лет"]))", avatar: contacts[indexPath.section][indexPath.row].avatar)
        return cell
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return letters
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tableView.beginUpdates()
        contacts[indexPath[0]].remove(at: indexPath[1])
        tableView.deleteRows(at: [indexPath, indexPath], with: .automatic)
        
        if contacts[indexPath[0]].isEmpty {
            contacts.remove(at: indexPath[0])
            letters.remove(at: indexPath[0])
            tableView.deleteSections(IndexSet(arrayLiteral: indexPath[0]), with: .automatic)
        }
        
        tableView.endUpdates()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    func checkAge(_ age: UInt,args arrayOfWords: [String]) -> String {
        let n = age % 100
        let n1 = n % 10
        if n > 10 && n < 20 {
            return "\(age) " + arrayOfWords[2]
        }
        if n1 > 1 && n1 < 5 {
            return "\(age) " + arrayOfWords[1]
        }
        if n1 == 1 {
            return "\(age) " + arrayOfWords[0]
        }
        return "\(age) " + arrayOfWords[2]
    }
}
