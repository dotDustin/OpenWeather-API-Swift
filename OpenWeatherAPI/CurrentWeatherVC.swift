//
//  ViewController.swift
//  OpenWeatherAPI
//
//  Created by Dustin Mahone on 3/15/20.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class CurrentWeatherVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Variables and Constants
    
    var openWeatherClient = OpenWeatherClient()
    var currentWeather: WeatherResults?
    
    var weatherMain = ["":""]
    var weatherWeather = ["":""]
    var weatherWind = ["":""]
    
    var weatherMainValues: [String] = [""]
    var weatherMainKeys: [String] = [""]
    
    var weatherWeatherValues: [String] = [""]
    var weatherWeatherKeys: [String] = [""]
    
    var weatherWindValues: [String] = [""]
    var weatherWindKeys: [String] = [""]
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCurrentWeather(id: "4160812")
        tableView.reloadData()
    }

    // MARK: - Methods
    
    func getCurrentWeather(id: String) {
        openWeatherClient.cityId = id
        let url = openWeatherClient.url
        
        print(url)
        
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            
            print(data)
            
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            
            if let searchData = try? decoder.decode(WeatherResults.self, from: data) {
                self.currentWeather = searchData
                
                print(self.currentWeather)
                
                self.weatherMain["temperature"] = "\(self.currentWeather!.main.temp)"
                self.weatherMain["humidity"] = "\(self.currentWeather!.main.humidity)"
                self.weatherMain["feels like"] = "\(self.currentWeather!.main.feels_like)"
                self.weatherMain["minimum temperature"] = "\(self.currentWeather!.main.temp_min)"
                self.weatherMain["maximum temperature"] = "\(self.currentWeather!.main.temp_max)"
                self.weatherMain["pressure"] = "\(self.currentWeather!.main.pressure)"
                                
                for (key, value) in self.weatherMain {
                    self.weatherMainKeys.append(key)
                    self.weatherMainValues.append(value)
                }
                
                self.weatherWind["speed"] = "\(self.currentWeather!.wind.speed)"
                self.weatherWind["deg"] = "\(self.currentWeather!.wind.deg)"
                
                for (key, value) in self.weatherWind {
                    self.weatherWindKeys.append(key)
                    self.weatherWindValues.append(value)
                }
                
                for weather in self.currentWeather!.weather {
                
                    self.weatherWeather["id"] = "\(weather.id)"
                    self.weatherWeather["main"] = weather.main
                    self.weatherWeather["description"] = weather.description
                    self.weatherWeather["icon"] = weather.icon
                
                    for (key, value) in self.weatherWeather {
                        self.weatherWeatherKeys.append(key)
                        self.weatherWeatherValues.append(value)
                    }
                    
                }
                
                
                
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
        
        task.resume()
    }
    
    
    
    // MARK: - Table View
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
            case 0:
            return weatherMain.count
            case 1:
            return weatherWeather.count
            default:
            return weatherWind.count
        }
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "currentWeatherCell", for: indexPath)
        
        switch(indexPath.section) {
        case 0:
            let value = weatherMainKeys[indexPath.row]
            let key = weatherMainValues[indexPath.row]
            
            cell.textLabel!.text = value
            cell.detailTextLabel!.text = key
            
        case 1:
            let value = weatherWeatherKeys[indexPath.row]
            let key = weatherWeatherValues[indexPath.row]
            
            cell.textLabel!.text = value
            cell.detailTextLabel!.text = key
            
        default:
            let value = weatherWindKeys[indexPath.row]
            let key = weatherWindValues[indexPath.row]
            
            cell.textLabel!.text = value
            cell.detailTextLabel!.text = key
        }
                    
        return cell
    }
    
}

