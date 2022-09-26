//
//  AnimeListCellTableViewCell.swift
//  CollectionView
//
//  Created by mac on 9/25/22.
//

import UIKit

class AnimeListTVCell: UITableViewCell {
    
    @IBOutlet var animeImageView: UIImageView!
    @IBOutlet var animeNameLabel: UILabel!

    func configur(with anime: Info) {
        animeNameLabel.text = anime.title
        
        DispatchQueue.global().async {
            guard let url = URL(string: anime.image ?? "") else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.animeImageView.image = UIImage(data: imageData)
            }
        }
    }
}
