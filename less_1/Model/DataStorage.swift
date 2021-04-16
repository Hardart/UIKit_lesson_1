//
//  DataSource.swift
//  less_1
//
//  Created by Артем Шакиров on 13.04.2021.
//

import UIKit

class DataStorage: NSObject {

    static let shared = DataStorage()
    private override init() {
        
    }
    
    
    var users: [User] = [
        User(name: "Petr", age: 26, avatar: UIImage(named: "Petr"), photoArray: [UIImage(named: "Petr")!, UIImage(named: "Petr")!, UIImage(named: "Petr")!]),
        User(name: "Irina", age: 27,  avatar: UIImage(named: "Irina"), photoArray: [UIImage(named: "Irina")!, UIImage(named: "Irina")!, UIImage(named: "Irina")!]),
        User(name: "Artem", age: 35,  avatar: UIImage(named: "Artem"), photoArray: [UIImage(named: "Artem")!, UIImage(named: "Artem")!, UIImage(named: "Artem")!]),
        User(name: "Oleg", age: 30, avatar: UIImage(named: "Oleg"), photoArray: [UIImage(named: "Oleg")!, UIImage(named: "Oleg")!, UIImage(named: "Oleg")!]),
        User(name: "Yulia", age: 25,  avatar: UIImage(named: "Yulia"), photoArray: [UIImage(named: "Yulia")!, UIImage(named: "Yulia")!, UIImage(named: "Yulia")!])
    ]
    
    var groups: [Group] = [
        Group(title: "Федерация регби России", image: UIImage(named: "rugbyRussia"), desc: "Спортивная организация"),
        Group(title: "Шедевры рекламы", image: UIImage(named: "SHR"), desc: "Юмор"),
        Group(title: "TOMORROWLAND 2021", image: UIImage(named: "Tomorrow"), desc: "Концерт"),
        Group(title: "Регби", image: UIImage(named: "Rugby"), desc: "Другие виды спорта"),
        Group(title: "Бесплатные шрифты", image: UIImage(named: "Fonts"), desc: "Дизайн и графика"),
        Group(title: "Новинки Музыки 2021", image: UIImage(named: "Music"), desc: "Обмен музыкой"),
        Group(title: "Горящие туры", image: UIImage(named: "travel"), desc: "Туристическое агентство"),
        Group(title: "Музыка для видео", image: UIImage(named: "MusicForVideo"), desc: "Фото и видеосъёмка"),
        Group(title: "DEEP SOUND", image: UIImage(named: "DS"), desc: "Электронная музыка"),
        Group(title: "Лихие 90-е", image: UIImage(named: "90s"), desc: "История"),
        Group(title: "Тату студия black_muza_penzа", image: UIImage(named: "Black"), desc: "Татуировки на любой вкус")
    ]
    
    var myGroups: [Group] = []
}
