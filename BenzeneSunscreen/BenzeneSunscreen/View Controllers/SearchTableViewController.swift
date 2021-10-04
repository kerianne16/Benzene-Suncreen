//
//  SearchTableViewController.swift
//  BenzeneSunscreen
//
//  Created by Keri Levesque on 6/4/21.
//  Copyright © 2021 Keri Levesque. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController {

    // MARK: - Properties
    
    private let sunscreenController = SunscreenController()
    private lazy var dataSource = makeDataSource()
    private var sunscreens: [Sunscreen] = []

    enum Section {
        case main
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.dataSource = dataSource

    }
    
    private func searchWith(searchTerm: String) {
        sunscreenController.searchSunscreenData(searchTerm: searchTerm) {
            DispatchQueue.main.async {
                self.update()
            }
        }
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return data.count    }
//
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: MainSearchTableViewCell.identifer, for: indexPath) as! MainSearchTableViewCell
//
//        let sunscreen = data[indexPath.item]
//        cell.sunscreen = sunscreen
//
//        return cell
//    }
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        // filteredData here is the result, data is the local array
//        filteredData = searchText.isEmpty ? data : data.filter { (item: String) -> Bool in
//            // If dataItem matches the searchText, return true to include it
//            return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
//        }
//        // Reload UI element as per your requirement
//    }
    private func makeDataSource() -> UITableViewDiffableDataSource<Section, Sunscreen> {
        UITableViewDiffableDataSource(tableView: tableView) { (tableView, indexPath, sunscreen) in
            let cell = tableView
                .dequeueReusableCell(withIdentifier: MainSearchTableViewCell.identifer,
                                     for: indexPath) as! MainSearchTableViewCell
          
            cell.sunscreen = sunscreen
            return cell
        }
        
    }
    
    private func update() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Sunscreen>()
            snapshot.appendSections([.main])
            snapshot.appendItems(sunscreenController.sunscreens)
        dataSource.apply(snapshot, animatingDifferences: true)
        
    }
    
    private func perfromSearch(searchQuery: String?) {
        let filteredSunscreens: [Sunscreen]
        if let searchQuery = searchQuery, !searchQuery.isEmpty {
            filteredSunscreens = sunscreens.filter { $0.contains(query: searchQuery) }
        } else {
            filteredSunscreens = sunscreenController.sunscreens
        }
    }

}

extension SearchTableViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        searchBar.resignFirstResponder()
        searchWith(searchTerm: searchTerm)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            sunscreenController.sunscreens = []
            update()
            return
        }
        searchWith(searchTerm: searchText)
    }
}

