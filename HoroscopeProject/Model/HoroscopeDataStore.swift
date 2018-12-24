//
//  HoroscopeDataStore.swift
//  HoroscopeProject
//
//  Created by michelle on 2018/12/17.
//  Copyright © 2018年 michelle. All rights reserved.
//

import Foundation

//MARK: - read file from plist
class HoroscopeDataStore{

    private(set) var horoscopes = [Horoscope]()
    
    init(){
        let path = Bundle.main.path(forResource: "HoroscopeDescription", ofType: "plist")
        let rawData = NSArray(contentsOfFile: path!) as! [[String:Any]]
        
        for raw in rawData{
            if let name = raw["name"] as? String, let description = raw["description"] as? String, let squareImageName = raw["squareImageName"] as? String{
                let horoscope = Horoscope(name: name, description: description, squareImageName: squareImageName)
                self.horoscopes.append(horoscope)
            }
        }
        
            

    }
    
}
