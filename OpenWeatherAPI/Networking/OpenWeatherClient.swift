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
    
    //api.openweathermap.org/data/2.5/forecast?id={city ID}&appid={your api key}
    
    enum Endpoints {
        // current weather base
        //static let base = "http://api.openweathermap.org/data/2.5/weather?"
        
        // five day weather base
        static let base = "http://api.openweathermap.org/data/2.5/forecast?"
        
        static let units = "&units=imperial"
        static let api = "&appid=\(OpenWeatherClient.apiKey)"
        
    }

    var stringValue: String {
        return Endpoints.base + locationId + Endpoints.units + Endpoints.api
    }
    
    var locationId: String {
        return "id=\(cityId!)"
    }
    
    var url: URL {
        return URL(string: stringValue)!
    }
    
    
    enum CurrentEndpoints {
        // current weather base
        static let base = "http://api.openweathermap.org/data/2.5/weather?"
        
        static let units = "&units=imperial"
        static let api = "&appid=\(OpenWeatherClient.apiKey)"
        
    }

    var currentStringValue: String {
        return CurrentEndpoints.base + currentLocationId + CurrentEndpoints.units + CurrentEndpoints.api
    }
    
    var currentLocationId: String {
        return "id=\(cityId!)"
    }
    
    var currentUrl: URL {
        return URL(string: currentStringValue)!
    }
    
}

/*
 struct Path {
     static var current = "weather?"
     static var five = "forecast?"
 }
 
 enum Endpoints {
     // current weather base
     //static let base = "http://api.openweathermap.org/data/2.5/weather?"
     
     // five day weather base
     static let base = "http://api.openweathermap.org/data/2.5/"//forecast?"
     
     static let units = "&units=imperial"
     static let api = "&appid=\(OpenWeatherClient.apiKey)"
     
     static let urlCityId = "\(OpenWeatherClient.cityId)"
     
     case currentWeather
     case fiveDay
         

     var stringValue: String {
         switch self {
         case .currentWeather:
             return Endpoints.base + Path.current + Endpoints.urlCityId + Endpoints.units + Endpoints.api
         case .fiveDay:
             return Endpoints.base + Path.five + Endpoints.urlCityId + Endpoints.units + Endpoints.api
         }
         //return Endpoints.base + locationId + Endpoints.units + Endpoints.api
     }
     
     var url: URL {
         return URL(string: stringValue)!
     }
     
 }
 
 */
