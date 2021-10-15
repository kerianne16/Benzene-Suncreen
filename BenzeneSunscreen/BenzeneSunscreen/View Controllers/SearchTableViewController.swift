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
   
    let searchController = UISearchController(searchResultsController: nil)
    
    private let sunscreenController = SunscreenController()
    private var sunscreens: [Sunscreen] = [] // empty array to store sunscreen records
    var filteredResults: [Sunscreen] = [] // empty array to store search bar results

    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        sunscreens = sunscreenController.sunscreenData()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
    }
    
    func filterContentForSearchText(_ searchText: String) {
      filteredResults = sunscreens.filter { (sunscreen: Sunscreen) -> Bool in
        return sunscreen.brandName.lowercased().contains(searchText.lowercased())
      }
      
      tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredResults.count
        }
        return sunscreens.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainSearchTableViewCell.identifer, for: indexPath) as! MainSearchTableViewCell
       
        let sunscreen: Sunscreen
        if isFiltering {
            sunscreen = filteredResults[indexPath.row]
        } else {
            sunscreen = sunscreens[indexPath.row]
        }
        cell.brandNameLabel?.text = sunscreen.brandName
        cell.typeLabel?.text = sunscreen.type
        cell.descriptionLabel?.text = sunscreen.description
        cell.spfLabel?.text = sunscreen.spf
        cell.upcLabel?.text = sunscreen.upc
        cell.lotLabel?.text = sunscreen.lot
        cell.expirationLabel?.text = sunscreen.expiration
        cell.activePharmacuticalIngredientsLabel?.text = sunscreen.activePharmacuticalIngredients
        cell.benzeneAvgPpmLabel?.text = sunscreen.benzeneAvgPpm
        cell.percentLabel?.text = sunscreen.percent

        return cell
    }
}

extension SearchTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
}
