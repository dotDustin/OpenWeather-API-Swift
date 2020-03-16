//
//  WeatherResults.swift
//  OpenWeatherAPI
//
//  Created by Dustin M on 2/19/20.
//  Copyright © 2020 Dustin. All rights reserved.
//

import Foundation

struct WeatherResults: Decodable, Equatable {

    let weather: [WeatherData]
    let main: MainData
    let wind: WindData
    let list: [FiveDay]
}

