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
}
