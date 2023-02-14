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

// Gets the list of menu items from a restauarant ID (from getRestaurant function)
func getMenu(_ id: String) throws -> [foodItem] { // TODO: Make asynchronous
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

struct restaurant: Codable{
    let calories: Int
    let item_id: String
    let serving_qty: Int
    let serving_unit: String
    let item_name: String
}

struct restaurantsReponse: Codable{
    let items: [restaurant]
    let total_hits: Int
}

enum apiError: Error {
    case noConnection
    case unknownError
}

// Gets restaurants list of restaurants around a latitude and longitude; Distance and limit are optional
func getRestaurant(_ latitude: Float, _ longitude: Float, _ distance: Int = 50, _ limit: Int = 20) async -> [restaurant] {
    let urlString = "https://trackapi.nutritionix.com/v2/locations?ll=\(latitude)%2C%20\(longitude)&distance=\(distance)&limit=\(limit)"
    print(urlString)
    let session = URLSession.shared
    let url = NSURL(string: urlString)!
    let request = NSMutableURLRequest(url: url as URL)
    
    request.setValue("0033f8cd", forHTTPHeaderField: "x-app-id")
    request.setValue("a7480919025cbc677f4bdb13e6338b71", forHTTPHeaderField: "x-app-key") // TODO: .env for secret key?
    var res: restaurantsReponse
    
    do{
        let (data, _) = try await URLSession.shared.data(from: url as URL)
        res = try JSONDecoder().decode(restaurantsReponse.self, from: data)
        return res.items
    } catch{
        print("ERROR")
        
    }
        }


