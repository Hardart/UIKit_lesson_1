//
//  setUp.swift
//  less_1
//
//  Created by Артем Шакиров on 16.04.2021.
//

import Foundation
import UIKit

func setUpUser(userNum: Int, name: String, age: UInt) -> User {
    var user = User(name: name, age: age)
    
    let imageName = String(userNum) + ".1"
    user.avatar = UIImage(named: imageName)
    return user
}
