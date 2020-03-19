# Open Weather API

## Description

This code pulls weather data using the free components of open weather's API.

## Usage

Sign up and get an API key from here: https://openweathermap.org/api

Open the OpenWeatherClient.swift file. Replace "YOUR_API_KEY" with your api key. Build and run. APIs currently supported:

_Current Weather_ https://openweathermap.org/current

_5 Day / 3 Hour Forecast_ https://openweathermap.org/forecast5

As of this update, you will need to set the initial view controller to current weather OR Five Day / 3 Hour weather. To use the Current Weather view controller, you will need to uncomment the base url in OpenWeatherClient.Endpoints, that includes "/weather?" while the 5 day uses "/forecast?" To update the location, adjust the cityId variable in either the CurrentWeatherVC.swift file, or the FiveDayWeatherVC.swift file. Info available in the API docs linked above on how to use cityId, or city name to search for weather data.



