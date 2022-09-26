//
//  Anime.swift
//  CollectionView
//
//  Created by mac on 9/23/22.
//

import Foundation

/*
 public func getData<T: Decodable>(type: T.Type, fromEndpoint endpoint: Endpoint, completion: @escaping ([T]?) -> Void) {
     if let path = Bundle.main.path(forResource: endpoint.rawValue, ofType: "json") {
         do {
             let rawData = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
             let decodedData = try JSONDecoder().decode([T].self, from: rawData)
             completion(decodedData)
             
         } catch let error {
             print("parse error: \(error.localizedDescription)")
         }
     } else {
         fatalError("Invalid filename/path")
     }
 }
 
 */


/*
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
 */
