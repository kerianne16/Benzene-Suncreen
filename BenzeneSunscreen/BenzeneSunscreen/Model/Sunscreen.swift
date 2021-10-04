//
//  Sunscreen.swift
//  BenzeneSunscreen
//
//  Created by Keri Levesque on 6/4/21.
//  Copyright © 2021 Keri Levesque. All rights reserved.
//

import UIKit


struct Sunscreen: Codable {
    let brandName: String
    let type: String
    let description: String
    let spf: String
    let upc: String
    let lot: String
    let expiration: String
    let activePharmacuticalIngredients: String
    let benzeneAvgPpm: String
    let percent: String
    
    
    func contains(query: String?) -> Bool {
          guard let query = query else { return true }
          guard !query.isEmpty else { return true }
          let lowerCasedQuery = query.lowercased()
        return brandName.lowercased().contains(lowerCasedQuery)
      }
}


extension Sunscreen: Hashable { } // model needs to be hashable with using Diffable datasource in the tableview

struct SunscreenSearch: Codable {
    let results: [Sunscreen]
}
