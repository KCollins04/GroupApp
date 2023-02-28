//
//  NutrionixAPI.swift
//  GroupApp
//
//  Created by SAMUEL LIM on 2/10/23.
//

import Foundation

struct foodItem: Codable{
    let calories: Double
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
func getMenu(_ id: String) async throws -> [foodItem] { // TODO: Make asynchronous
    var menuItems: [foodItem] = []

    let urlString = "https://www.nutritionix.com/nixapi/brands/\(id)/items/1?limit=15&search="
    let url = NSURL(string: urlString)!
    let request = NSMutableURLRequest(url: url as URL)
    
    var res: listReponse
    
    do{
        let (data, _) = try await URLSession.shared.data(for: request as URLRequest)
        res = try JSONDecoder().decode(listReponse.self, from: data)
        menuItems.append(contentsOf: res.items)
        for page in 1...res.total_hits/15 + (res.total_hits % 15 == 0 ? 0 : 1){
            let urlString = "https://www.nutritionix.com/nixapi/brands/\(id)/items/\(page)?limit=15&search="
            let url = NSURL(string: urlString)!
            let request = NSMutableURLRequest(url: url as URL)
            let (data, _) = try await URLSession.shared.data(for: request as URLRequest)
            print("\(page) out of \(res.total_hits/15)")
            do {
                let res = try JSONDecoder().decode(listReponse.self, from: data)
                menuItems.append(contentsOf: res.items)
            } catch let error {
                print(error)
                throw error
            }
        }
        return menuItems
    } catch{
        print(error)
        throw apiError.unknownError
        
    }
}

struct restaurant: Codable{
    let name: String
    let address: String
    let address2: String?
    let city: String
    let country: String
    let zip: String
    let phone: String?
    let website: String?
    let guide: String?
    let id: Int
    let lat: Double
    let lng: Double
    let created_at: String
    let updated_at: String
    let distance_km: Float
    let brand_id: String
}

struct restaurantsReponse: Codable{
    let locations: [restaurant]
}

enum apiError: Error {
    case noConnection
    case unknownError
}

// Gets restaurants list of restaurants around a latitude and longitude; Distance and limit are optional
func getRestaurant(_ latitude: Double, _ longitude: Double, _ distance: Int = 50, _ limit: Int = 20) async throws -> [restaurant] {
    let urlString = "https://trackapi.nutritionix.com/v2/locations?ll=\(latitude)%2C%20\(longitude)&distance=\(distance)&limit=\(limit)"
    let url = NSURL(string: urlString)!
    let request = NSMutableURLRequest(url: url as URL)
    
    request.setValue("0033f8cd", forHTTPHeaderField: "x-app-id")
    request.setValue("a7480919025cbc677f4bdb13e6338b71", forHTTPHeaderField: "x-app-key") // TODO: .env for secret key?
    var res: restaurantsReponse
    
    do{
        let (data, _) = try await URLSession.shared.data(for: request as URLRequest)
        res = try JSONDecoder().decode(restaurantsReponse.self, from: data)
        return res.locations
    } catch{
        print(error)
        throw apiError.unknownError
        
    }
    
        }


