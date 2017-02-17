//
//  WeatherGetter.swift
//  SimpleSky
//
//  Created by David Wang on 12/28/16.
//  Copyright © 2016 David Wang. All rights reserved.
//

import Foundation


protocol WeatherGetterDelegate {
    func didGetWeather(weather: Weather)
    func didNotGetWeather(error: NSError)
}


class WeatherGetter {
    
    var delegate: WeatherGetterDelegate
    
    init(delegate: WeatherGetterDelegate) {
        self.delegate = delegate
    }
    
    //api.darksky.net/forecast/key/40.781693,-73.966590
    
    private let darkSkyBaseURL = "https://api.darksky.net/forecast"
    private let darkSkyAPIKey = ProcessInfo.processInfo.environment["DARKSKY_API"]!
    
    func getWeather(coordinates: String) {
        
        // This is a pretty simple networking task, so the shared session will do.
        let session = URLSession.shared
        
        let weatherRequestURL = URL(string: "\(darkSkyBaseURL)/\(darkSkyAPIKey)/\(coordinates)")!
        
        // The data task retrieves the data.
        let dataTask = session.dataTask(with: weatherRequestURL) { (data, response, error) -> Void in
            if let networkError = error {
                // Case 1: Error
                // An error occurred while trying to get data from the server.
                self.delegate.didNotGetWeather(error: networkError as NSError)
            }
            else {
                print("Success")
                // Case 2: Success
                // We got data from the server!
                do {
                    // Try to convert that data into a Swift dictionary
                    let weatherData = try JSONSerialization.jsonObject(
                        with: data!,
                        options: .mutableContainers) as! [String: AnyObject]
                    
                    let weather = Weather(weatherData: weatherData)
                    
                    //print("City: \(weather["timezone"]!)")
                    //print("City: \(weather["currently"]!["summary"]!!)")
                    //print("Longitude: \(weather["coord"]!["lon"]!!)")
                    
                    // If we made it to this point, we've successfully converted the
                    // JSON-formatted weather data into a Swift dictionary.
                    // Let's now used that dictionary to initialize a Weather struct.
                    //let weather = Weather(weatherData: weatherData)
                    
                    // Now that we have the Weather struct, let's notify the view controller,
                    // which will use it to display the weather to the user.
                    self.delegate.didGetWeather(weather: weather)
                }
                catch let jsonError as NSError {
                    // An error occurred while trying to convert the data into a Swift dictionary.
                    print("there was an error")
                    self.delegate.didNotGetWeather(error: jsonError)
                }
            }
        }
        
        // The data task is set up...launch it!
        dataTask.resume()
    }
    
    
    
}
