//
//  SunscreenController.swift
//  BenzeneSunscreen
//
//  Created by Keri Levesque on 6/4/21.
//  Copyright © 2021 Keri Levesque. All rights reserved.
//

import Foundation


class SunscreenController {
    enum HTTPMethods: String {
           case get = "GET"
           case put = "PUT"
           case post = "POST"
           case delete = "DELETE"
       }
    var sunscreens = [Sunscreen]()
   // private var task: URLSessionTask?
//
//
//    init() {
//        loadSunscreenData()
//    }

    func searchSunscreenData(searchTerm: String, completion: @escaping () -> Void) {
        //task?.cancel()
         //finding the json file in the bundle
         if let jsonFile = Bundle.main.url(forResource: "sunscreens", withExtension: "json") {

             do {
                 let data = try Data(contentsOf: jsonFile) // will try to get the contents of the json file from the jsonFile if not then proceed to error
                 let jsonDecoder = JSONDecoder() // decoding the JSON

                 let dataFromJson = try jsonDecoder.decode([Sunscreen].self, from: data)
                self.sunscreens = dataFromJson
             } catch {
                print(String(describing: error))
             }
            completion()
         }
        //task?.resume()
     }
}
