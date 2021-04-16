//
//  DataSource.swift
//  less_1
//
//  Created by Артем Шакиров on 13.04.2021.
//

import UIKit

class Data: NSObject {

    static let shared = Data()
    private override init() {
        super.init()
    }
    
    var users: [User] = [
        User(name: "Petr", avatar: <#T##UIImage?#>, photoArray: <#T##[UIImage]#>),
        User(name: "Irina", avatar: <#T##UIImage?#>, photoArray: <#T##[UIImage]#>),
        User(name: "Artem", avatar: <#T##UIImage?#>, photoArray: <#T##[UIImage]#>),
        User(name: "Oleg", avatar: <#T##UIImage?#>, photoArray: <#T##[UIImage]#>),
        User(name: "Yulia", avatar: <#T##UIImage?#>, photoArray: <#T##[UIImage]#>)
    ]
}
