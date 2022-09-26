//
//  ImagesCollectionVC.swift
//  CollectionView
//
//  Created by mac on 9/25/22.
//

import UIKit

class ImagesCollectionVC: UICollectionViewController {
    
    @IBOutlet var imageCollectionView: [UICollectionView]!
    
    private var films: [Info] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        films.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as? ImageCollectionViewCell else { return UICollectionViewCell()}
      
        let film = films[indexPath.row]
        
        cell.setup(with: film)
        return cell
    }

    // MARK: UICollectionViewDelegate

    
}

extension ImagesCollectionVC: UICollectionViewDelegateFlowLayout {
        func fetchImage() {
            guard let url = URL(string: Link.filmsURL.rawValue) else { return }
            
            URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data else {
                    print(error?.localizedDescription ?? "No error Description")
                    return
                }
                do {
                    self.films = try JSONDecoder().decode([Info].self, from: data)
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
            
        }
    }

