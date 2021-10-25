//
//  DetailViewController.swift
//  BenzeneSunscreen
//
//  Created by Keri Levesque on 10/22/21.
//  Copyright © 2021 Keri Levesque. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: - Properties
    var sunscreen: Sunscreen?
    
    
    // MARK: - Outlets
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var brandNameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var spfLabel: UILabel!
    @IBOutlet weak var upcLabel: UILabel!
    @IBOutlet weak var lotLabel: UILabel!
    @IBOutlet weak var expirationLabel: UILabel!
    @IBOutlet weak var activePharmcuticalIngrLabel: UILabel!
    @IBOutlet weak var benzeneAvgPpmLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    
    // MARK: - View Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()

        // Do any additional setup after loading the view.
    }
    
    func updateView() {
        if let sunscreen = sunscreen,
           let brandName = brandNameLabel,
           let productImageView = productImageView {
            brandName.text = sunscreen.brandName
            productImageView.image = UIImage(named: sunscreen.description)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
