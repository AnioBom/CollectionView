//
//  NetworkManager.swift
//  CollectionView
//
//  Created by mac on 9/23/22.
//

import Foundation

enum Link: String {
    case filmsURL = "https://ghibliapi.herokuapp.com/films"
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decidingError
}

class NetworkManager {
    private var anime: [Info] = []
    static let shared = NetworkManager()
    
    private init() {}
   
    func fetchImage(from url: String?, completion: @escaping(Result<Data, NetworkError>) -> Void) {
        guard let url = URL(string: url ?? "") else {
            completion(.failure(.invalidURL))
            return
        }
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else {
                completion(.failure(.noData))
                return
            }
            DispatchQueue.main.async {
                completion(.success(imageData))
            }
        }
    }
    /*func fetch<T: Decodable>(dataType: T.Type, from url: String?, completion: @escaping(Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: url ?? "") else {
            completion(.failure((.invalidURL)))
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                
            }
     
        }
    }
     */
}
