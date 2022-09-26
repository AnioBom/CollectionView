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
    
}
