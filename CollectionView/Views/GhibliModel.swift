//
//  GhibliModel.swift
//  CollectionView
//
//  Created by mac on 9/25/22.
//
import Foundation

/*struct AnimeFilms: Decodable {
    let animeFilm: [AnimeGhibli]?
}
*/
struct AnimeGhibli: Decodable {
    let title: String?
    let image: String?
    let banner: String?
    let description: String?
    let director: String?
    let date: String?
    let url: String?
    
    private enum CodingKeys: String, CodingKey {
        case title = "title"
        case image = "image"
        case banner = "movie_banner"
        case description = "description"
        case director = "director"
        case date = "release_date"
        case url = "url"
    }
}
