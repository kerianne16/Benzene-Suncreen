//
//  MainSearchTableViewCell.swift
//  BenzeneSunscreen
//
//  Created by Keri Levesque on 6/4/21.
//  Copyright © 2021 Keri Levesque. All rights reserved.
//

import UIKit

class MainSearchTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var brandNameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var spfLabel: UILabel!
    @IBOutlet weak var upcLabel: UILabel!
    @IBOutlet weak var lotLabel: UILabel!
    @IBOutlet weak var expirationLabel: UILabel!
    @IBOutlet weak var activePharmacuticalIngredientsLabel: UILabel!
    @IBOutlet weak var benzeneAvgPpmLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    
    // MARK: - Properties
    
    static let identifer: String = String(describing: MainSearchTableViewCell.self) // converting MainSearchTableViewCell into "MainSearchTableViewCell" (resuse identifer) in order to avoid raw strings throught the code
    
}
