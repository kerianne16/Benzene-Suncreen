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
    
    var sunscreen: Sunscreen! {
        didSet {
            self.updateUI()
        }
    }
    
    // MARK: - View Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Update UI Func
    
        func updateUI() {
            if let sunscreen = sunscreen {
                brandNameLabel.text = sunscreen.brandName
                typeLabel.text = sunscreen.type
                descriptionLabel.text = sunscreen.description
                spfLabel.text = sunscreen.spf
                upcLabel.text = sunscreen.upc
                lotLabel.text = sunscreen.lot
                expirationLabel.text = sunscreen.expiration
                activePharmacuticalIngredientsLabel.text = sunscreen.activePharmacuticalIngredients
                benzeneAvgPpmLabel.text = sunscreen.benzeneAvgPpm
                percentLabel.text = sunscreen.percent
                
            }
        }

}
