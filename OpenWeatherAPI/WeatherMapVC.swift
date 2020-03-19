//
//  WeatherMapVC.swift
//  OpenWeatherAPI
//
//  Created by Dustin M on 3/18/20.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit

class WeatherMapVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        getWeatherMap()
    }
    
    func getWeatherMap() {
        
        guard let url = URL(string: "https://tile.openweathermap.org/map/temp_new/1/0/0.png?appid=YOUR_API_KEY") else { return  }
        
        
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            //let imageData = try! decoder.decode(MapImage.self, from: data)
            //print(imageData)
            let downloadedImage = UIImage(data: data)
            DispatchQueue.main.async {
                self.imageView.image = downloadedImage
            }
            
        }
        
        task.resume()
    }
    
}



//https://tile.openweathermap.org/map/{layer}/{z}/{x}/{y}.png?appid={api_key}

//layers
//clouds_new
//precipitation_new
//pressure_new
//wind_new
//temp_new

//{layer} layer name
//{z} number of zoom level {"message":"On zoom level 2, {x} should be an integer from 0 to 3"}
//{x} number of x tile coordinate {y} number of y tile coordinate {api_key} Your API key
