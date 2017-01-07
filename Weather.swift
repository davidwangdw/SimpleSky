//
//  Weather.swift
//  SimpleSky
//
//  Created by David Wang on 12/28/16.
//  Copyright © 2016 David Wang. All rights reserved.
//

import Foundation

struct Weather {
    
    //here we put all the returned weather data into nice neat variables
    
    //current weather data
    var summary: String
    //let timezone: String
    
    var city: String
    /*let country: String
    
    let currentDateAndtime: NSDate
    
    //weather icon
    let icon: String
    
    let precipIntensity: Double
    let precipProbability: Double
    let precipType: String
    
    let temperature: Double
    let apparentTemperature: Double
    
    let humidity: Double
    
    let windSpeed: Double
    
    
    //hourly
    let dailySummary: String
    
    //do I actually need separate variables for all this stuff?
    //try this out then see if we can consolidate this
    let hourlyTime1: NSDate
    let hourlyTime2: NSDate
    let hourlyTime3: NSDate
    let hourlyTime4: NSDate
    let hourlyTime5: NSDate
    let hourlyTime6: NSDate
    let hourlyTime7: NSDate
    let hourlyTime8: NSDate
    let hourlyTime9: NSDate
    let hourlyTime10: NSDate
    let hourlyTime11: NSDate
    let hourlyTime12: NSDate
    let hourlyTime13: NSDate
    let hourlyTime14: NSDate
    let hourlyTime15: NSDate
    let hourlyTime16: NSDate
    let hourlyTime17: NSDate
    let hourlyTime18: NSDate
    let hourlyTime19: NSDate
    let hourlyTime20: NSDate
    let hourlyTime21: NSDate
    let hourlyTime22: NSDate
    let hourlyTime23: NSDate
    let hourlyTime24: NSDate
    
    let hourlySummary1: String
    let hourlySummary2: String
    let hourlySummary3: String
    let hourlySummary4: String
    let hourlySummary5: String
    let hourlySummary6: String
    let hourlySummary7: String
    let hourlySummary8: String
    let hourlySummary9: String
    let hourlySummary10: String
    let hourlySummary11: String
    let hourlySummary12: String
    let hourlySummary13: String
    let hourlySummary14: String
    let hourlySummary15: String
    let hourlySummary16: String
    let hourlySummary17: String
    let hourlySummary18: String
    let hourlySummary19: String
    let hourlySummary20: String
    let hourlySummary21: String
    let hourlySummary22: String
    let hourlySummary23: String
    let hourlySummary24: String
    
    let hourlyIcon1: String
    let hourlyIcon2: String
    let hourlyIcon3: String
    let hourlyIcon4: String
    let hourlyIcon5: String
    let hourlyIcon6: String
    let hourlyIcon7: String
    let hourlyIcon8: String
    let hourlyIcon9: String
    let hourlyIcon10: String
    let hourlyIcon11: String
    let hourlyIcon12: String
    let hourlyIcon13: String
    let hourlyIcon14: String
    let hourlyIcon15: String
    let hourlyIcon16: String
    let hourlyIcon17: String
    let hourlyIcon18: String
    let hourlyIcon19: String
    let hourlyIcon20: String
    let hourlyIcon21: String
    let hourlyIcon22: String
    let hourlyIcon23: String
    let hourlyIcon24: String
    
    let hourlyPrecipProbability1: Double
    let hourlyPrecipProbability2: Double
    let hourlyPrecipProbability3: Double
    let hourlyPrecipProbability4: Double
    let hourlyPrecipProbability5: Double
    let hourlyPrecipProbability6: Double
    let hourlyPrecipProbability7: Double
    let hourlyPrecipProbability8: Double
    let hourlyPrecipProbability9: Double
    let hourlyPrecipProbability10: Double
    let hourlyPrecipProbability11: Double
    let hourlyPrecipProbability12: Double
    let hourlyPrecipProbability13: Double
    let hourlyPrecipProbability14: Double
    let hourlyPrecipProbability15: Double
    let hourlyPrecipProbability16: Double
    let hourlyPrecipProbability17: Double
    let hourlyPrecipProbability18: Double
    let hourlyPrecipProbability19: Double
    let hourlyPrecipProbability20: Double
    let hourlyPrecipProbability21: Double
    let hourlyPrecipProbability22: Double
    let hourlyPrecipProbability23: Double
    let hourlyPrecipProbability24: Double
    
    let hourlyTemperature1: Double
    let hourlyTemperature2: Double
    let hourlyTemperature3: Double
    let hourlyTemperature4: Double
    let hourlyTemperature5: Double
    let hourlyTemperature6: Double
    let hourlyTemperature7: Double
    let hourlyTemperature8: Double
    let hourlyTemperature9: Double
    let hourlyTemperature10: Double
    let hourlyTemperature11: Double
    let hourlyTemperature12: Double
    let hourlyTemperature13: Double
    let hourlyTemperature14: Double
    let hourlyTemperature15: Double
    let hourlyTemperature16: Double
    let hourlyTemperature17: Double
    let hourlyTemperature18: Double
    let hourlyTemperature19: Double
    let hourlyTemperature20: Double
    let hourlyTemperature21: Double
    let hourlyTemperature22: Double
    let hourlyTemperature23: Double
    let hourlyTemperature24: Double
    
    let hourlyApparentTemperature1: Double
    let hourlyApparentTemperature2: Double
    let hourlyApparentTemperature3: Double
    let hourlyApparentTemperature4: Double
    let hourlyApparentTemperature5: Double
    let hourlyApparentTemperature6: Double
    let hourlyApparentTemperature7: Double
    let hourlyApparentTemperature8: Double
    let hourlyApparentTemperature9: Double
    let hourlyApparentTemperature10: Double
    let hourlyApparentTemperature11: Double
    let hourlyApparentTemperature12: Double
    let hourlyApparentTemperature13: Double
    let hourlyApparentTemperature14: Double
    let hourlyApparentTemperature15: Double
    let hourlyApparentTemperature16: Double
    let hourlyApparentTemperature17: Double
    let hourlyApparentTemperature18: Double
    let hourlyApparentTemperature19: Double
    let hourlyApparentTemperature20: Double
    let hourlyApparentTemperature21: Double
    let hourlyApparentTemperature22: Double
    let hourlyApparentTemperature23: Double
    let hourlyApparentTemperature24: Double
    
    //daily info
    
    let dailyTime1: NSDate
    let dailyTime2: NSDate
    let dailyTime3: NSDate
    let dailyTime4: NSDate
    let dailyTime5: NSDate
    let dailyTime6: NSDate
    let dailyTime7: NSDate
    let dailyTime8: NSDate
    let dailyTime9: NSDate
    let dailyTime10: NSDate
    
    let dailySummary1: String
    let dailySummary2: String
    let dailySummary3: String
    let dailySummary4: String
    let dailySummary5: String
    let dailySummary6: String
    let dailySummary7: String
    let dailySummary8: String
    let dailySummary9: String
    let dailySummary10: String
    
    let dailyIcon1: String
    let dailyIcon2: String
    let dailyIcon3: String
    let dailyIcon4: String
    let dailyIcon5: String
    let dailyIcon6: String
    let dailyIcon7: String
    let dailyIcon8: String
    let dailyIcon9: String
    let dailyIcon10: String
    
    let dailyPrecipProbability1: Double
    let dailyPrecipProbability2: Double
    let dailyPrecipProbability3: Double
    let dailyPrecipProbability4: Double
    let dailyPrecipProbability5: Double
    let dailyPrecipProbability6: Double
    let dailyPrecipProbability7: Double
    let dailyPrecipProbability8: Double
    let dailyPrecipProbability9: Double
    let dailyPrecipProbability10: Double*/
    
    

    
    
    

    
    
    /*let longitude: Double
    let latitude: Double
    //let timezone: String
    
    let dateAndTime: NSDate
    
    //this is specific weather data
    
    let icon: String
    let precipProbability: Double
    let precipType: String
    let temperature: Double
    let apparentTemperature: Double
    let humidity: Double
    let windSpeed: Double
    let windBearing: Double*/
    
    
    //specific daily data
    /*let sunriseTime:NSDate
    let sunsetTime: NSDate
    let temperatureMin: Double
    let temperatureMinTime: NSDate
    let temperatureMax: Double
    let temperatureMaxTime: NSDate
    let apparentTemperatureMin: Double
    let apparentTemperatureMinTime: NSDate
    let apparentTemperatureMax: Double
    let apparentTemperatureMaxTime: NSDate*/
    
    /*let alertTitle: String
    let alertTime: NSDate
    let alertExpire: NSDate
    let alertDescription: String*/

    
    init(weatherData: [String: AnyObject]) {
        
        print("got into initialization")
        
        let weatherDictCurrently = weatherData["currently"]
        
        summary = weatherDictCurrently?["summary"] as! String
        
        city = weatherData["timezone"] as! String
        
        //separate timezone into city and country
        
        
        /*
        
        longitude = weatherData["longitude"] as! Double
        latitude = weatherData["latitude"] as! Double
        
        
        
        dateAndTime = NSDate(timeIntervalSince1970: weatherDictCurrently["time"] as! TimeInterval)
        
        
        icon = weatherDictCurrently["summary"] as! String
        precipProbability = weatherDictCurrently["summary"] as! Double
        precipType = weatherDictCurrently["summary"] as! String
        temperature = weatherDictCurrently["summary"] as! Double
        apparentTemperature = weatherDictCurrently["summary"] as! Double
        humidity = weatherDictCurrently["summary"] as! Double
        windSpeed = weatherDictCurrently["summary"] as! Double
        windBearing = weatherDictCurrently["summary"] as! Double*/
        
        /*let weatherDictMinutely = weatherData["minutely"]![0] as! [String: AnyObject]
        
        dateAndTime = NSDate(timeIntervalSince1970: weatherDictMinutely["time"] as! TimeInterval)
        
        summary = weatherDictMinutely["summary"] as! String
        icon = weatherDictMinutely["summary"] as! String
        precipProbability = weatherDictMinutely["summary"] as! Double
        precipType = weatherDictMinutely["summary"] as! String
        temperature = weatherDictMinutely["summary"] as! Double
        apparentTemperature = weatherDictMinutely["summary"] as! Double
        humidity = weatherDictMinutely["summary"] as! Double
        windSpeed = weatherDictMinutely["summary"] as! Double
        windBearing = weatherDictMinutely["summary"] as! Double
        
        let weatherDictHourly = weatherData["hourly"]![0] as! [String: AnyObject]
        
        dateAndTime = NSDate(timeIntervalSince1970: weatherDictHourly["time"] as! TimeInterval)

        summary = weatherDictHourly["summary"] as! String
        icon = weatherDictHourly["summary"] as! String
        precipProbability = weatherDictHourly["summary"] as! Double
        precipType = weatherDictHourly["summary"] as! String
        temperature = weatherDictHourly["summary"] as! Double
        apparentTemperature = weatherDictHourly["summary"] as! Double
        humidity = weatherDictHourly["summary"] as! Double
        windSpeed = weatherDictHourly["summary"] as! Double
        windBearing = weatherDictHourly["summary"] as! Double
        
        let weatherDictDaily = weatherData["daily"]![0] as! [String: AnyObject]
        
        dateAndTime = NSDate(timeIntervalSince1970: weatherDictDaily["time"] as! TimeInterval)

        summary = weatherDictHourly["summary"] as! String
        icon = weatherDictHourly["summary"] as! String*/
    }
    
    //add the weather get function within the weather class
    
    /*private let darkSkyBaseURL = "https://api.darksky.net/forecast"
    private let darkSkyAPIKey = ProcessInfo.processInfo.environment["DARKSKY_API"]!
    
    func getWeather(coordinates: String) {
        print("started function")
        
        // This is a pretty simple networking task, so the shared session will do.
        let session = URLSession.shared
        
        let weatherRequestURL = URL(string: "\(darkSkyBaseURL)/\(darkSkyAPIKey)/\(coordinates)")!
        
        // The data task retrieves the data.
        let dataTask = session.dataTask(with: weatherRequestURL) {
            (data, response, error) -> Void in
            if let error = error {
                // Case 1: Error
                // We got some kind of error while trying to get data from the server.
                print("Error:\n\(error)")
            }
            else {
                // Case 2: Success
                // We got a response from the server!
                do {
                    // Try to convert that data into a Swift dictionary
                    let weather = try JSONSerialization.jsonObject(
                        with: data!,
                        options: .mutableContainers) as! [String: AnyObject]
                    print("in do try catch")
                    //print("City: \(weather["timezone"]!)")
                }
                catch let jsonError as NSError {
                    // An error occurred while trying to convert the data into a Swift dictionary.
                    print("JSON error description: \(jsonError.description)")
                }
            }
        }
        
        // The data task is set up...launch it!
        dataTask.resume()
    }*/
    init(weatherData: String) {
        //empty initialization
        print("Got into empty initialization")
        summary = ""
        city = ""
    }

}
