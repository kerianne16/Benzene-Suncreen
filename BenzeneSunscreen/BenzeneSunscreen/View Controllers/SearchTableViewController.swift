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
    private lazy var dataSource = makeDataSource() // dataSource for diffable tableview datasource
    private var sunscreens: [Sunscreen] = [] // empty array to store sunscreen records
    var searchResults: [Sunscreen] = [] // empty array to store search bar results

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
    
    private func performSearch(_ searchQuery: String) {
//        let filteredSunscreens: [Sunscreen]
//        if let searchQuery = searchQuery, !searchQuery.isEmpty {
//            filteredSunscreens = sunscreens.filter { $0.contains(query: searchQuery) }
//        } else {
//            filteredSunscreens = sunscreenController.sunscreens
//        }
//    }
        
        searchResults = sunscreens.filter({ (sunscreen:Sunscreen) -> Bool in
            let brandNameMatch = sunscreen.brandName.range(of: searchQuery, options:
                                                                NSString.CompareOptions.caseInsensitive)
            let typeMatch = sunscreen.type.range(of: searchQuery, options:
                                                    NSString.CompareOptions.caseInsensitive)
            let descriptionMatch = sunscreen.description.range(of: searchQuery, options:
                                                                NSString.CompareOptions.caseInsensitive)
            let spfMatch = sunscreen.spf.range(of: searchQuery, options:
                                                NSString.CompareOptions.caseInsensitive)
            let upcMatch = sunscreen.upc.range(of: searchQuery, options:
                                                NSString.CompareOptions.caseInsensitive)
            let lotMatch = sunscreen.lot.range(of: searchQuery, options:
                                                NSString.CompareOptions.caseInsensitive)
            let expirationMatch = sunscreen.expiration.range(of: searchQuery, options:
                                                                NSString.CompareOptions.caseInsensitive)
            let activePharmacuticalIngredientsMatch = sunscreen.activePharmacuticalIngredients.range(of: searchQuery, options:
                                                                                                        NSString.CompareOptions.caseInsensitive)
            let benzeneAvgPpmMatch = sunscreen.benzeneAvgPpm.range(of: searchQuery, options:
                                                                    NSString.CompareOptions.caseInsensitive)
            let percentMatch = sunscreen.percent.range(of: searchQuery, options:
                                                        NSString.CompareOptions.caseInsensitive)
                                            return brandNameMatch != nil || typeMatch != nil || descriptionMatch != nil || spfMatch != nil || upcMatch != nil || lotMatch != nil || expirationMatch != nil || activePharmacuticalIngredientsMatch != nil || benzeneAvgPpmMatch != nil || percentMatch != nil}
        )
        
    }

}

extension SearchTableViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        searchBar.resignFirstResponder()
        performSearch(searchTerm)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            sunscreenController.sunscreens = []
            update()
        } else {
        searchResults = sunscreens.filter({ (sunscreen:Sunscreen) -> Bool in
            let brandNameMatch = sunscreen.brandName.range(of: searchText, options:
                                                                NSString.CompareOptions.caseInsensitive)
            let typeMatch = sunscreen.type.range(of: searchText, options:
                                                    NSString.CompareOptions.caseInsensitive)
            let descriptionMatch = sunscreen.description.range(of: searchText, options:
                                                                NSString.CompareOptions.caseInsensitive)
            let spfMatch = sunscreen.spf.range(of: searchText, options:
                                                NSString.CompareOptions.caseInsensitive)
            let upcMatch = sunscreen.upc.range(of: searchText, options:
                                                NSString.CompareOptions.caseInsensitive)
            let lotMatch = sunscreen.lot.range(of: searchText, options:
                                                NSString.CompareOptions.caseInsensitive)
            let expirationMatch = sunscreen.expiration.range(of: searchText, options:
                                                                NSString.CompareOptions.caseInsensitive)
            let activePharmacuticalIngredientsMatch = sunscreen.activePharmacuticalIngredients.range(of: searchText, options:
                                                                                                        NSString.CompareOptions.caseInsensitive)
            let benzeneAvgPpmMatch = sunscreen.benzeneAvgPpm.range(of: searchText, options:
                                                                    NSString.CompareOptions.caseInsensitive)
            let percentMatch = sunscreen.percent.range(of: searchText, options:
                                                        NSString.CompareOptions.caseInsensitive)
                                            
                                            return brandNameMatch != nil || typeMatch != nil || descriptionMatch != nil || spfMatch != nil || upcMatch != nil || lotMatch != nil || expirationMatch != nil || activePharmacuticalIngredientsMatch != nil || benzeneAvgPpmMatch != nil || percentMatch != nil}
                                          
        )
//
//        searchWith(searchTerm: searchText)
    }
}

}
