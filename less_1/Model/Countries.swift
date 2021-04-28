//
//  Countries.swift
//  less_1
//
//  Created by Артем Шакиров on 22.04.2021.
//

import UIKit

struct Country {
    let continent: String
    let country: String
    
    static func setCountries() -> [Country]{
        return [
            Country(continent: "Европа", country: "Дания"),
            Country(continent: "Европа", country: "Швеция"),
            Country(continent: "Европа", country: "Бельгия"),
            Country(continent: "Европа", country: "Польша"),
            
            Country(continent: "Азия", country: "Япония"),
            Country(continent: "Азия", country: "Тайланд"),
            Country(continent: "Азия", country: "Вьетнам"),
            
            Country(continent: "Европа", country: "Дания"),
            Country(continent: "Европа", country: "Швеция"),
            Country(continent: "Европа", country: "Бельгия"),
            Country(continent: "Европа", country: "Польша"),
            
            Country(continent: "Азия", country: "Япония"),
            Country(continent: "Азия", country: "Тайланд"),
            Country(continent: "Европа", country: "Дания"),
            Country(continent: "Европа", country: "Швеция"),
            Country(continent: "Европа", country: "Бельгия"),
            Country(continent: "Европа", country: "Польша"),
            
            Country(continent: "Азия", country: "Япония"),
            Country(continent: "Азия", country: "Тайланд"),
            
            
        ]
    }
    
}
