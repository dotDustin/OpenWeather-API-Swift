//
//  FiveDay.swift
//  OpenWeatherAPI
//
//  Created by Dustin Mahone on 3/15/20.
//  Copyright © 2020 Dustin. All rights reserved.
//

import Foundation

struct FiveDay: Codable, Equatable {
    let dt: Int
    let dt_txt: String
    let main: [MainData]
    let weather: [WeatherData]
    let wind: WindData
}
