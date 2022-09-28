//
//  ImageViewCell.swift
//  CollectionView
//
//  Created by mac on 9/26/22.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var animeImageView: UIImageView!
    @IBOutlet var animeNameLabel: UILabel!
    
    func setup(with animeImage: AnimeGhibli) {
        animeNameLabel.text = animeImage.title
        animeImageView.image = animeImageView.image
        
        DispatchQueue.global().async {
            guard let stringURL = URL(string: Link.filmsURL.rawValue) else { return }
            guard let imageData = try? Data(contentsOf: stringURL) else { return }
            DispatchQueue.main.async {
                self.animeImageView.image = UIImage(data: imageData)
            }
        }
    }
    
}
