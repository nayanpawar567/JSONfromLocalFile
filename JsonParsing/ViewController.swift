//
//  ViewController.swift
//  JsonParsing
//
//  Created by Tushar Ramdas Sonawane (BLR GSS) on 19/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    var baseModel: BaseModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadJsonData()
    }
    
    func loadJsonData() {
        if let url = Bundle.main.url(forResource: "Bank", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(BaseModel.self, from: data)
                print(jsonData)
            } catch {
                print("error:\(error)")
            }
        }
    }
    
    


}

struct BaseModel: Codable {
    let title: String
    let banklist: [Bank]
}

struct Bank: Codable {
    let name: String
    let id: String
    let addresss: String
    let pincode: String
    
    private enum CodingKeys : String, CodingKey {
           case name = "xsfjhjlsdkfgh", id, addresss, pincode
       }
}


