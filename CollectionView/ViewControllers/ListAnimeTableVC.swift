//
//  ListAnimeViewControllerTableViewController.swift
//  CollectionView
//
//  Created by mac on 9/23/22.
//

import UIKit

class ListAnimeTableVC: UITableViewController {
    
    private var anime: [AnimeGhibli] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        anime.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as? AnimeListTVCell else { return UITableViewCell() }

        let anime = anime[indexPath.row]
        cell.configur(with: anime)

        return cell
    }


   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}

//MARK: - Networking

extension ListAnimeTableVC {
    func fetchAnimeList() {
        guard let url = URL(string: Link.films.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error Description")
                return
            }
            do {
                self.anime = try JSONDecoder().decode([AnimeGhibli].self, from: data)
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
}
