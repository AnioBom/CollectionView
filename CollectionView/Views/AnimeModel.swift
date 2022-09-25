//
//  Anime.swift
//  CollectionView
//
//  Created by mac on 9/23/22.
//

import Foundation

struct Anime: Decodable {
    let data: [Character]?
}

struct Character: Decodable {
    let url: String?
    let title_english: String?
    let images: [Image]?
    
    var description: String {
        """
        """
    }
}

struct Image: Decodable {
    let jpg: [JPG]?
}

struct JPG: Decodable {
    let image_url: String?
}
