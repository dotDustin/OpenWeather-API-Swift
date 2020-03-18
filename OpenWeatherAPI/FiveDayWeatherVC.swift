//
//  FiveDayWeatherVC.swift
//  OpenWeatherAPI
//
//  Created by Dustin M on 3/15/20.
//  Copyright © 2020 Dustin. All rights reserved.
//

import Foundation
import UIKit

class FiveDayWeatherVC: UITableViewController {
    
    // MARK: - Variables and Constants
    
    var openWeatherClient = OpenWeatherClient()
    var fiveDayWeather: FiveDayResults?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getFiveDayWeather(id: "4160812")
        tableView.reloadData()
    }
    
    // MARK: - Methods
    
    func getFiveDayWeather(id: String) {
        openWeatherClient.cityId = id
        let url = openWeatherClient.url
        
        
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            
            if let searchData = try? decoder.decode(FiveDayResults.self, from: data) {
                self.fiveDayWeather = searchData
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
        }
        
        task.resume()
        
    }
    
    
}

extension FiveDayWeatherVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fiveDayWeather?.list.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "fiveDayCell"/*, for: indexPath*/) as? FiveDayTableViewCell else { return UITableViewCell() }
        guard fiveDayWeather != nil else { return cell }
        
        cell.dateLabel.text = fiveDayWeather!.list[indexPath.row].dt_txt
        
        let roundedTemp = round(fiveDayWeather!.list[indexPath.row].main.temp)
        cell.temperatureLabel.text = "\(roundedTemp)°F"
        
        cell.humidityLabel.text = "\(fiveDayWeather!.list[indexPath.row].main.humidity)% RH"
            
        let roundedWindSpeed = round(fiveDayWeather!.list[indexPath.row].wind.speed)
        cell.windLabel.text = "\(roundedWindSpeed) MPH"
        
        cell.weatherImageView.image = UIImage(named: "\(fiveDayWeather!.list[indexPath.row].weather[0].icon)")
        
        return cell
    }
    
}
