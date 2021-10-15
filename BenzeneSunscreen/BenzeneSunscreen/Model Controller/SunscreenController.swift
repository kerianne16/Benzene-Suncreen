//
//  SunscreenController.swift
//  BenzeneSunscreen
//
//  Created by Keri Levesque on 6/4/21.
//  Copyright © 2021 Keri Levesque. All rights reserved.
//

import Foundation

class SunscreenController {

    func sunscreenData() -> [Sunscreen] {
        // finding the json file in the bundle
        guard let jsonFile = Bundle.main.url(forResource: "sunscreens", withExtension: "json"),
              let data = try? Data(contentsOf: jsonFile) // will try to get the contents of the json if not will proceed to error
        else {
            print("Couldn't find data from bundle")
            return []
        }
        do {
            let decoder = JSONDecoder() // initialize JSONDecoder
            return try decoder.decode([Sunscreen].self, from: data) // will try to decode json if not will to to error / return empty array
        } catch {
            print(String(describing: error))
            return []
        }
        
    }
}
