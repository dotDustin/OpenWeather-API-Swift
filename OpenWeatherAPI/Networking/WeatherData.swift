//
//  WeatherData.swift
//  OpenWeatherAPI
//
//  Created by Dustin M on 3/15/20.
//  Copyright © 2020 Dustin. All rights reserved.
//

import Foundation

struct WeatherData: Codable, Equatable {
    
    let id: Int
    let main: String
    let description: String
    let icon: String
}
