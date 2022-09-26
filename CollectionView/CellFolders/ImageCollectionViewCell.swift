//
//  ImageViewCell.swift
//  CollectionView
//
//  Created by mac on 9/26/22.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var animeImageView: UIImageView!
    

    func setup(with animeImage: Info) {
        animeImageView.image = animeImage.movie_banner
    }
    
}
