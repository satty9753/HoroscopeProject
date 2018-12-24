//
//  Horoscope.swift
//  HoroscopeProject
//
//  Created by michelle on 2018/12/17.
//  Copyright © 2018年 michelle. All rights reserved.
//

import Foundation

struct Horoscope {
    var name:String?
    var description:String?
    var squareImageName:String?
    
    init(name:String, description:String, squareImageName:String) {
        self.name = name
        self.description = description
        self.squareImageName = squareImageName
    }
}
