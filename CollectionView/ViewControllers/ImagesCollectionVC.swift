//
//  ImagesCollectionVC.swift
//  CollectionView
//
//  Created by mac on 9/25/22.
//

import UIKit

class ImagesCollectionVC: UICollectionViewController {
    
    @IBOutlet var imageCollectionView: [UICollectionView]!
    
    private var anime: [AnimeGhibli] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        anime.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as? ImageCollectionViewCell else { return UICollectionViewCell()}
      
        let film = anime[indexPath.item]
        
        cell.setup(with: film)
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let animeFilm = anime[indexPath.item]
        performSegue(withIdentifier: "showAnimeImage", sender: animeFilm)
    }
}
//MARK: - Navigation

   

extension ImagesCollectionVC: UICollectionViewDelegateFlowLayout {
        func fetchImage() {
            guard let url = URL(string: Link.filmsURL.rawValue) else { return }
            
            URLSession.shared.dataTask(with: url) { data, _, _ in
                guard let data = data else {
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    self.anime = try decoder.decode([AnimeGhibli].self, from: data)
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                } catch let error {
                    print(error.localizedDescription)
                }
            } .resume()
        }
}
        

