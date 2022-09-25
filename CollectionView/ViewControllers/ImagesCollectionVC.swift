//
//  ImagesCollectionVC.swift
//  CollectionView
//
//  Created by mac on 9/25/22.
//

import UIKit

class ImagesCollectionVC: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath)
    
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    
}

extension ImagesCollectionVC: UICollectionViewDelegateFlowLayout {
    
}
