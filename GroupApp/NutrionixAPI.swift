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
    let serving_quanitity: Int
    let serving_unit: String
}

struct listReponse: Codable{
    let items: [foodItem]
    let total_hits: Int
}

func getMenu(_ id: String) -> [foodItem] {
    let requestUrl = "https://www.omdbapi.com/?i=\(id)&plot=full&type=movie&apikey=65da5fbe" // Encodes the URL to get the movie info by IMDB ID
    let url = URL(string: requestUrl)
    let data = (try? Data(contentsOf: url!))!
    do {
        let res = try JSONDecoder().decode(listReponse.self, from: data)
        
        // Sets the variables to be gotten by the prepare for segue function
        /*selectedTitle = res.Title
        selectedImageUrl = res.Poster
        selectedSummary = res.Plot
        selectedRating = res.imdbRating
        self.performSegue(withIdentifier: "movieDetails", sender: self)*/
    } catch let error {
        print(error)
    }
}
