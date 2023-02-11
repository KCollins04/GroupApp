//
//  NutrionixAPI.swift
//  GroupApp
//
//  Created by SAMUEL LIM on 2/10/23.
//

import Foundation

struct foodItem: Codable{
    let calories: Int
    let item_id: String
    let serving_qty: Int
    let serving_unit: String
    let item_name: String
}

struct listReponse: Codable{
    let items: [foodItem]
    let total_hits: Int
}


func getMenu(_ id: String) throws -> [foodItem] {
    var menuItems: [foodItem] = []
    let requestUrl = "https://www.nutritionix.com/nixapi/brands/\(id)/items/1?limit=15&search="
    let url = URL(string: requestUrl)
    let data = (try? Data(contentsOf: url!))!
    do {
        let res = try JSONDecoder().decode(listReponse.self, from: data)
        menuItems.append(contentsOf: res.items)
        print(res.total_hits/15 + (res.total_hits % 15 == 0 ? 0 : 1))
        for page in 1...res.total_hits/15 + (res.total_hits % 15 == 0 ? 0 : 1){
            let requestUrl = "https://www.nutritionix.com/nixapi/brands/\(id)/items/\(page)?limit=15&search="
            let url = URL(string: requestUrl)
            let data = (try? Data(contentsOf: url!))!
            do {
                let res = try JSONDecoder().decode(listReponse.self, from: data)
                menuItems.append(contentsOf: res.items)
            } catch let error {
                print(error)
                throw error
            }
        }
        return menuItems
    } catch let error {
        print(error)
        throw error
    }
}

