//
//  MainData.swift
//  OpenWeatherAPI
//
//  Created by Dustin M on 2/19/20.
//  Copyright © 2020 Dustin. All rights reserved.
//

import Foundation

struct MainData: Codable, Equatable {
    let temp: Double
    let humidity: Int
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    
}
