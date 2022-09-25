//
//  GhibliModel.swift
//  CollectionView
//
//  Created by mac on 9/25/22.
//
import Foundation

struct AnimeGhibli: Decodable {
    let films: [Info]?
}

struct Info: Decodable {
    let title: String?
    let image: String?
    let movie_banner: String?
    let description: String?
    let director: String?
    let release_date: String?
    let url: String?
    
    var explanation: String {
        """
        Description: \(description)
        Director: \(director)
        Date of realise: \(release_date)
        """
    }
}
    
    enum CodingKeys: String, CodingKeys {
        case title = "title"
        case image = "image"
        case banner = "movie_banner"
        case description = "description"
        case director = "director"
        case date = "release_date"
        case url = "url"
    }
enum Link: String {
    case films = "https://ghibliapi.herokuapp.com/films"
}


