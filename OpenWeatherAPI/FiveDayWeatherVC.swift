//
//  FiveDayWeatherVC.swift
//  OpenWeatherAPI
//
//  Created by Dustin Mahone on 3/15/20.
//  Copyright © 2020 Dustin. All rights reserved.
//

import Foundation
import UIKit

class FiveDayWeatherVC: UITableViewController {
    
    // MARK: - Variables and Constants
    
    var openWeatherClient = OpenWeatherClient()
    var fiveDayWeather: WeatherResults?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getFiveDayWeather(id: "4160812")
    }
    
    // MARK: - Methods
    
    func getFiveDayWeather(id: String) {
        openWeatherClient.cityId = id
        let url = openWeatherClient.url
        
        print(url)
        
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            
            print(data)
            
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            
            if let searchData = try? decoder.decode(WeatherResults.self, from: data) {
                self.fiveDayWeather = searchData
                print(self.fiveDayWeather)
            }
        }
        
        task.resume()
        
    }
    
    
}

extension FiveDayWeatherVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "currentWeatherCell"/*, for: indexPath*/) as? FiveDayTableViewCell else { return UITableViewCell() }
        
        
        return cell
    }
    
}
