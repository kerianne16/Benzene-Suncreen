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
        
    @IBOutlet weak var productImageView: UIImageView!
     
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
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            // Make the cell have a card appearance
            containerView.backgroundColor = UIColor.clear
            containerView.layer.shadowOpacity = 1
            containerView.layer.shadowRadius = 2
            containerView.layer.shadowColor = UIColor(named: "DarkBlue")?.cgColor
            containerView.layer.shadowOffset = CGSize(width: 3, height: 3 )
        }
    }
    @IBOutlet weak var clippingView: UIView! {
        didSet {
            clippingView.layer.cornerRadius = 10
            clippingView.backgroundColor = UIColor.white
            clippingView.layer.masksToBounds = true
        }
    }
    
//    func setProductImage() {
//       if let sunscreen = sunscreen,
//          let productImage = productImageView {
//        productImage.image = UIImage(named: sunscreen.description)
//       }
//    }
    // MARK: - Properties
    
    static let identifer: String = String(describing: MainSearchTableViewCell.self) // converting MainSearchTableViewCell into "MainSearchTableViewCell" (resuse identifer) in order to avoid raw strings throught the code
    var sunscreen: Sunscreen?
    
}
