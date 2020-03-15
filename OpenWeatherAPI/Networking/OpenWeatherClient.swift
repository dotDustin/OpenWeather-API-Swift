//
//  OpenWeatherClient.swift
//  OpenWeatherAPI
//
//  Created by Dustin M on 3/15/20.
//  Copyright © 2020 Dustin. All rights reserved.
//

import Foundation

class OpenWeatherClient {

    var cityId: String?
    static let apiKey = "YOUR_API_KEY"
    
    enum Endpoints {
        static let base = "http://api.openweathermap.org/data/2.5/weather?"
        static let units = "&units=imperial"
        static let api = "&appid=\(OpenWeatherClient.apiKey)"
        
    }

    var locationId: String {
        return "id=\(cityId!)"
    }
    
    var stringValue: String {
        return Endpoints.base + locationId + Endpoints.units + Endpoints.api
    }
    
    var url: URL {
        return URL(string: stringValue)!
    }
    
}
