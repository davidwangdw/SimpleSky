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
    var timezone: String
    
    //var city: String
    //var country: String
    //var currentDateAndtime: NSDate
    //var currentDateAndtime: Int
    
    //weather icon
    //var icon: String
    
    //var precipIntensity: Double
    //var precipProbability: Double
    //var precipType: String
    
    var temperature: Double
    //var apparentTemperature: Double
    
    //var humidity: Double
    //var windSpeed: Double
    
    //hourly
    //var dailySummary: String
    
    //do I actually need separate variables for all this stuff?
    //try this out then see if we can consolidate this
    /*var hourlyTime1: NSDate
    var hourlyTime2: NSDate
    var hourlyTime3: NSDate
    var hourlyTime4: NSDate
    var hourlyTime5: NSDate
    var hourlyTime6: NSDate
    var hourlyTime7: NSDate
    var hourlyTime8: NSDate
    var hourlyTime9: NSDate
    var hourlyTime10: NSDate
    var hourlyTime11: NSDate
    var hourlyTime12: NSDate
    var hourlyTime13: NSDate
    var hourlyTime14: NSDate
    var hourlyTime15: NSDate
    var hourlyTime16: NSDate
    var hourlyTime17: NSDate
    var hourlyTime18: NSDate
    var hourlyTime19: NSDate
    var hourlyTime20: NSDate
    var hourlyTime21: NSDate
    var hourlyTime22: NSDate
    var hourlyTime23: NSDate
    var hourlyTime24: NSDate
    
    var hourlySummary1: String
    var hourlySummary2: String
    var hourlySummary3: String
    var hourlySummary4: String
    var hourlySummary5: String
    var hourlySummary6: String
    var hourlySummary7: String
    var hourlySummary8: String
    var hourlySummary9: String
    var hourlySummary10: String
    var hourlySummary11: String
    var hourlySummary12: String
    var hourlySummary13: String
    var hourlySummary14: String
    var hourlySummary15: String
    var hourlySummary16: String
    var hourlySummary17: String
    var hourlySummary18: String
    var hourlySummary19: String
    var hourlySummary20: String
    var hourlySummary21: String
    var hourlySummary22: String
    var hourlySummary23: String
    var hourlySummary24: String
    
    var hourlyIcon1: String
    var hourlyIcon2: String
    var hourlyIcon3: String
    var hourlyIcon4: String
    var hourlyIcon5: String
    var hourlyIcon6: String
    var hourlyIcon7: String
    var hourlyIcon8: String
    var hourlyIcon9: String
    var hourlyIcon10: String
    var hourlyIcon11: String
    var hourlyIcon12: String
    var hourlyIcon13: String
    var hourlyIcon14: String
    var hourlyIcon15: String
    var hourlyIcon16: String
    var hourlyIcon17: String
    var hourlyIcon18: String
    var hourlyIcon19: String
    var hourlyIcon20: String
    var hourlyIcon21: String
    var hourlyIcon22: String
    var hourlyIcon23: String
    var hourlyIcon24: String
    
    var hourlyPrecipProbability1: Double
    var hourlyPrecipProbability2: Double
    var hourlyPrecipProbability3: Double
    var hourlyPrecipProbability4: Double
    var hourlyPrecipProbability5: Double
    var hourlyPrecipProbability6: Double
    var hourlyPrecipProbability7: Double
    var hourlyPrecipProbability8: Double
    var hourlyPrecipProbability9: Double
    var hourlyPrecipProbability10: Double
    var hourlyPrecipProbability11: Double
    var hourlyPrecipProbability12: Double
    var hourlyPrecipProbability13: Double
    var hourlyPrecipProbability14: Double
    var hourlyPrecipProbability15: Double
    var hourlyPrecipProbability16: Double
    var hourlyPrecipProbability17: Double
    var hourlyPrecipProbability18: Double
    var hourlyPrecipProbability19: Double
    var hourlyPrecipProbability20: Double
    var hourlyPrecipProbability21: Double
    var hourlyPrecipProbability22: Double
    var hourlyPrecipProbability23: Double
    var hourlyPrecipProbability24: Double
    
    var hourlyTemperature1: Double
    var hourlyTemperature2: Double
    var hourlyTemperature3: Double
    var hourlyTemperature4: Double
    var hourlyTemperature5: Double
    var hourlyTemperature6: Double
    var hourlyTemperature7: Double
    var hourlyTemperature8: Double
    var hourlyTemperature9: Double
    var hourlyTemperature10: Double
    var hourlyTemperature11: Double
    var hourlyTemperature12: Double
    var hourlyTemperature13: Double
    var hourlyTemperature14: Double
    var hourlyTemperature15: Double
    var hourlyTemperature16: Double
    var hourlyTemperature17: Double
    var hourlyTemperature18: Double
    var hourlyTemperature19: Double
    var hourlyTemperature20: Double
    var hourlyTemperature21: Double
    var hourlyTemperature22: Double
    var hourlyTemperature23: Double
    var hourlyTemperature24: Double
    
    var hourlyApparentTemperature1: Double
    var hourlyApparentTemperature2: Double
    var hourlyApparentTemperature3: Double
    var hourlyApparentTemperature4: Double
    var hourlyApparentTemperature5: Double
    var hourlyApparentTemperature6: Double
    var hourlyApparentTemperature7: Double
    var hourlyApparentTemperature8: Double
    var hourlyApparentTemperature9: Double
    var hourlyApparentTemperature10: Double
    var hourlyApparentTemperature11: Double
    var hourlyApparentTemperature12: Double
    var hourlyApparentTemperature13: Double
    var hourlyApparentTemperature14: Double
    var hourlyApparentTemperature15: Double
    var hourlyApparentTemperature16: Double
    var hourlyApparentTemperature17: Double
    var hourlyApparentTemperature18: Double
    var hourlyApparentTemperature19: Double
    var hourlyApparentTemperature20: Double
    var hourlyApparentTemperature21: Double
    var hourlyApparentTemperature22: Double
    var hourlyApparentTemperature23: Double
    var hourlyApparentTemperature24: Double
    
    //daily info
    
    var dailyTime1: NSDate
    var dailyTime2: NSDate
    var dailyTime3: NSDate
    var dailyTime4: NSDate
    var dailyTime5: NSDate
    var dailyTime6: NSDate
    var dailyTime7: NSDate
    var dailyTime8: NSDate
    var dailyTime9: NSDate
    var dailyTime10: NSDate
    
    var dailySummary1: String
    var dailySummary2: String
    var dailySummary3: String
    var dailySummary4: String
    var dailySummary5: String
    var dailySummary6: String
    var dailySummary7: String
    var dailySummary8: String
    var dailySummary9: String
    var dailySummary10: String
    
    var dailyIcon1: String
    var dailyIcon2: String
    var dailyIcon3: String
    var dailyIcon4: String
    var dailyIcon5: String
    var dailyIcon6: String
    var dailyIcon7: String
    var dailyIcon8: String
    var dailyIcon9: String
    var dailyIcon10: String
    
    var dailyPrecipProbability1: Double
    var dailyPrecipProbability2: Double
    var dailyPrecipProbability3: Double
    var dailyPrecipProbability4: Double
    var dailyPrecipProbability5: Double
    var dailyPrecipProbability6: Double
    var dailyPrecipProbability7: Double
    var dailyPrecipProbability8: Double
    var dailyPrecipProbability9: Double
    var dailyPrecipProbability10: Double*/
    
    

    
    
    

    
    
    /*var longitude: Double
    var latitude: Double
    //var timezone: String
    
    var dateAndTime: NSDate
    
    //this is specific weather data
    
    var icon: String
    var precipProbability: Double
    var precipType: String
    var temperature: Double
    var apparentTemperature: Double
    var humidity: Double
    var windSpeed: Double
    var windBearing: Double*/
    
    
    //specific daily data
    /*var sunriseTime:NSDate
    var sunsetTime: NSDate
    var temperatureMin: Double
    var temperatureMinTime: NSDate
    var temperatureMax: Double
    var temperatureMaxTime: NSDate
    var apparentTemperatureMin: Double
    var apparentTemperatureMinTime: NSDate
    var apparentTemperatureMax: Double
    var apparentTemperatureMaxTime: NSDate*/
    
    /*var alertTitle: String
    var alertTime: NSDate
    var alertExpire: NSDate
    var alertDescription: String*/

    
    init(weatherData: [String: AnyObject]) {
        
        
        //overall table is weatherData["key"]
        
        timezone = weatherData["timezone"] as! String
        
        //separate timezone into city and country later
        
        /*city = "city"
        country = "country"*/
        
        //current data
        
        let weatherDictCurrently = weatherData["currently"]
        
        summary = weatherDictCurrently?["summary"] as! String
        
        //currentDateAndtime = weatherDictCurrently?["time"] as! Int
        
        //icon = weatherDictCurrently?["icon"] as! String
        
        //precipIntensity = weatherDictCurrently?["precipIntensity"] as! Double
        
        //precipProbability = weatherDictCurrently?["precipProbability"] as! Double

        //precipType = weatherDictCurrently?["precipType"] as! String
        
        temperature = weatherDictCurrently?["temperature"] as! Double
        
        //apparentTemperature = weatherDictCurrently?["apparentTemperature"] as! Double
        
        //humidity = weatherDictCurrently?["humidity"] as! Double
        
        //windSpeed = weatherDictCurrently?["windSpeed"] as! Double
        
        //daily summary
        
        //let weatherDictDailyDetail = weatherData["daily"]
        //dailySummary = weatherDictDailyDetail?["summary"] as! String
        
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
        
        /*var weatherDictMinutely = weatherData["minutely"]![0] as! [String: AnyObject]
        
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
        
        var weatherDictHourly = weatherData["hourly"]![0] as! [String: AnyObject]
        
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
        
        var weatherDictDaily = weatherData["daily"]![0] as! [String: AnyObject]
        
        dateAndTime = NSDate(timeIntervalSince1970: weatherDictDaily["time"] as! TimeInterval)

        summary = weatherDictHourly["summary"] as! String
        icon = weatherDictHourly["summary"] as! String*/
    }
    
    //add the weather get function within the weather class
    
    /*private var darkSkyBaseURL = "https://api.darksky.net/forecast"
    private var darkSkyAPIKey = ProcessInfo.processInfo.environment["DARKSKY_API"]!
    
    func getWeather(coordinates: String) {
        print("started function")
        
        // This is a pretty simple networking task, so the shared session will do.
        var session = URLSession.shared
        
        var weatherRequestURL = URL(string: "\(darkSkyBaseURL)/\(darkSkyAPIKey)/\(coordinates)")!
        
        // The data task retrieves the data.
        var dataTask = session.dataTask(with: weatherRequestURL) {
            (data, response, error) -> Void in
            if var error = error {
                // Case 1: Error
                // We got some kind of error while trying to get data from the server.
                print("Error:\n\(error)")
            }
            else {
                // Case 2: Success
                // We got a response from the server!
                do {
                    // Try to convert that data into a Swift dictionary
                    var weather = try JSONSerialization.jsonObject(
                        with: data!,
                        options: .mutableContainers) as! [String: AnyObject]
                    print("in do try catch")
                    //print("City: \(weather["timezone"]!)")
                }
                catch var jsonError as NSError {
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
        print("empty initialization")
        
        timezone = ""
        
        /*city = ""
        country = ""
        
        //current data*/
        summary = ""
        
        //currentDateAndtime = 0
        
        //icon = ""
        
        //precipIntensity = 0
        
        //precipProbability = 0
        
        //precipType = ""
        
        temperature = 0
        
        //apparentTemperature = 0
        
        //humidity = 0
        
        //windSpeed = 0
        
        //daily summary
        //dailySummary = ""
    }

}
