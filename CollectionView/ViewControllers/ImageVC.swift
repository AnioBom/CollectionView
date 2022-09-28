//
//  ImageVC.swift
//  CollectionView
//
//  Created by mac on 9/25/22.
//

import UIKit

class ImageVC: UIViewController {
    
    private var anime: [AnimeGhibli] = []
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        }
}
extension ImageVC {
    private func fetchImage(url: AnimeGhibli) {
        guard let url = URL(string: url.image ?? "") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                self.anime = try decoder.decode([AnimeGhibli].self, from: data)
                DispatchQueue.main.async {
                    self.imageView.image
                }
            } catch let error {
                print(error.localizedDescription)
            }
        } .resume()
    }
}
    
