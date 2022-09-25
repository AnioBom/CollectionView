//
//  MainCollectionViewController.swift
//  CollectionView
//
//  Created by mac on 9/23/22.
//

import UIKit

enum StutusAlert: String {
    case success
    case failed
    
    var title: String {
        switch self {
        case.success: return "Success"
        case.failed: return "Failed"
        }
    }
    
    var message: String {
        switch self {
        case.success: return "You can see the results in the Debug aria"
        case.failed: return "You can see error in the Debug aria"
        }
    }
}

enum ListAction: String, CaseIterable {
    case animeGhibli = "Studio Ghibli"
    case animeCoMixWaveFilms = "Studio CoMix Wave Films"
    case allImages = "Images"
}

class MainCollectionVC: UICollectionViewController {
    
    private let listActions = ListAction.allCases

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTableAnime" {
            guard let listAnimeTVC = segue.destination as? ListAnimeTableVC else { return }
            listAnimeTVC.fetchAnimeList()
        }
    }

    // MARK: - UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        listActions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MainFirstCell else { return UICollectionViewCell() }
        let listAction = listActions[indexPath.item]
        cell.NameListLabel.text = listAction.rawValue
    
        return cell
    }

    // MARK: - UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let listAction = listActions[indexPath.item]
        
        switch listAction {
        case .animeGhibli:
            performSegue(withIdentifier: "showTableAnime", sender: nil)
        case .animeCoMixWaveFilms:
            animeCoMixWaveFilms()
        case .allImages:
            performSegue(withIdentifier: "showImages", sender: nil)
        }
    }

}
extension MainCollectionVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
}
//MARK: - Networking
extension MainCollectionVC {
    private func animeCoMixWaveFilms() {
        
    }
    
}
