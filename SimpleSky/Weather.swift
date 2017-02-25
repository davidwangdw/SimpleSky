//
//  Weather.swift
//  SimpleSky
//
//  Created by David Wang on 12/28/16.
//  Copyright © 2016 David Wang. All rights reserved.
//

import Foundation

struct Weather {
    
    //this is a terrible way to do this - fix later
    var initialized: Bool
    
    //here we put all the returned weather data into nice neat variables
    //NOTE: This is actually really messy, we could probably do this a better way
    //but we will do this for now and fix it later if I have time!
    
    //current weather data
    var summary: String
    var timezone: String
    
    var temperatureMin: Double
    var temperatureMax: Double
    
    //var city: String
    //var country: String
    //var currentDateAndtime: NSDate
    //var currentDateAndtime: Int
    
    //weather icon
    var icon: String
    
    //var precipIntensity: Double
    //var precipProbability: Double
    //var precipType: String
    
    var temperature: Double? //used to tell whether weather object is initialized
    var apparentTemperature: Double
    
    //var humidity: Double
    //var windSpeed: Double
    
    //hourly
    var dailySummary: String
    
    var hourlySummary: String
    
    var hourlyTimeArray = [Int]()
    var hourlySummaryArray = [String]()
    var hourlyIconArray = [String]()
    var hourlyTemperatureArray = [Double]()
    
    //daily info
    
    var dailyTimeArray = [String]()
    var dailySummaryArray = [String]()
    var dailyIconArray = [String]()
    var dailyTempHigh = [Double]()
    var dailyTempLow = [Double]()
    
    /*var longitude: Double
     var latitude: Double
     //var timezone: String
     
     var dateAndTime: NSDate
     
     //this is specific weather data
     
     
     */
    
    //specific daily data
    var sunriseTime: String
    var sunsetTime: String
    //var temperatureMinTime: NSDate
    
    
    //var precipType: String
    //var humidity: Double
    //var windSpeed: Double
    //var windBearing: Double
    
    //var temperatureMaxTime: NSDate
    //var apparentTemperatureMin: Double
    //var apparentTemperatureMinTime: NSDate
    //var apparentTemperatureMax: Double
    //var apparentTemperatureMaxTime: NSDate
    
    /*var alertTitle: String
     var alertTime: NSDate
     var alertExpire: NSDate
     var alertDescription: String*/
    
    var precipProbability: Double
    
    
    init(weatherData: [String: AnyObject]) {
        
        initialized = true
        
        
        //overall table is weatherData["key"]
        
        timezone = weatherData["timezone"] as! String
        let timezoneSeparatedArray = timezone.characters.split { $0 == "/"}
        //print(timezoneSeparatedArray.map(String.init))
        let cityStringDraft = String(timezoneSeparatedArray.map(String.init)[1])!
        let cityStringFinal = cityStringDraft.replacingOccurrences(of: "_", with: " ")
        timezone = cityStringFinal
        
        //separate timezone into city and country later
        /*city = "city"
         country = "country"*/
        
        //current data
        let weatherDictCurrently = weatherData["currently"]
        summary = weatherDictCurrently?["summary"] as! String
        //currentDateAndtime = weatherDictCurrently?["time"] as! Int
        icon = weatherDictCurrently?["icon"] as! String
        //precipIntensity = weatherDictCurrently?["precipIntensity"] as! Double
        precipProbability = weatherDictCurrently?["precipProbability"] as! Double
        //precipType = weatherDictCurrently?["precipType"] as! String
        
        temperature = weatherDictCurrently?["temperature"] as? Double
        apparentTemperature = weatherDictCurrently?["apparentTemperature"] as! Double
        
        //humidity = weatherDictCurrently?["humidity"] as! Double
        //windSpeed = weatherDictCurrently?["windSpeed"] as! Double
        
        //hourly data
        let weatherDictHourly = weatherData["hourly"]
        hourlySummary = weatherDictHourly?["summary"] as! String
        let weatherDictHourlyData = weatherDictHourly as! [String: AnyObject]
        let weatherDictHourlyDataDetails = weatherDictHourlyData["data"] as! [[String : AnyObject]]
        
        hourlyTimeArray = []
        hourlySummaryArray = []
        hourlyIconArray = []
        hourlyTemperatureArray = []
        
        dailyTimeArray = []
        dailySummaryArray = []
        dailyIconArray = []
        dailyTempHigh = []
        dailyTempLow = []
        
        //for NS date functions
        let calendar = NSCalendar.current
        
        for i in 0 ... 23 {
            var weatherDictHourlyDataDetails = weatherDictHourlyDataDetails[i]
            let date = NSDate(timeIntervalSince1970: weatherDictHourlyDataDetails["time"] as! TimeInterval)
            let hour = calendar.component(.hour, from: date as Date)
            hourlyTimeArray.append(hour)
            hourlySummaryArray.append(weatherDictHourlyDataDetails["summary"] as! String)
            hourlyIconArray.append(weatherDictHourlyDataDetails["icon"] as! String)
            hourlyTemperatureArray.append(weatherDictHourlyDataDetails["temperature"] as! Double)
        }
        
        //daily info
        
        let weatherDictDaily = weatherData["daily"]
        dailySummary = weatherDictDaily?["summary"] as! String
        let weatherDictDailyData = weatherDictDaily as! [String: AnyObject]
        let weatherDictDailyDataDetails = weatherDictDailyData["data"] as! [[String : AnyObject]]
        
        temperatureMin = 0.0
        temperatureMax = 0.0
        sunriseTime = ""
        sunsetTime = ""
        
        for i in 0 ... 7 {
            var weatherDictDailyDataDetails = weatherDictDailyDataDetails[i]
            let date = NSDate(timeIntervalSince1970: weatherDictDailyDataDetails["time"] as! TimeInterval)
            let day = calendar.component(.weekday, from: date as Date)
            if i == 0 { //first day, i.e. today
                temperatureMin = weatherDictDailyDataDetails["temperatureMin"] as! Double
                temperatureMax = weatherDictDailyDataDetails["temperatureMax"] as! Double
                
                //for sunrise and sunset
                
                let date = NSDate(timeIntervalSince1970: weatherDictDailyDataDetails["sunriseTime"] as! TimeInterval)
                let sunriseTimeHour = calendar.component(.hour, from: date as Date)
                let sunriseTimeMinute = calendar.component(.minute, from: date as Date)
                
                let date2 = NSDate(timeIntervalSince1970: weatherDictDailyDataDetails["sunsetTime"] as! TimeInterval)
                let sunsetTimeHour = calendar.component(.hour, from: date2 as Date)
                let sunsetTimeMinute = calendar.component(.minute, from: date2 as Date)
                
                sunriseTime = String(sunriseTimeHour) + ":" + String(sunriseTimeMinute)
                sunsetTime = String(sunsetTimeHour) + ":" + String(sunsetTimeMinute)
            }
            //add switch statement later
            if day == 1 {
                dailyTimeArray.append("Sunday")
            } else if day == 2 {
                dailyTimeArray.append("Monday")
            } else if day == 3 {
                dailyTimeArray.append("Tuesday")
            } else if day == 4 {
                dailyTimeArray.append("Wedensday")
            } else if day == 5 {
                dailyTimeArray.append("Thursday")
            } else if day == 6 {
                dailyTimeArray.append("Friday")
            } else if day == 7 {
                dailyTimeArray.append("Saturday")
            } else {
                dailyTimeArray.append("error")
            }
            dailySummaryArray.append(weatherDictDailyDataDetails["summary"] as! String)
            dailyIconArray.append(weatherDictDailyDataDetails["icon"] as! String)
            dailyTempHigh.append(weatherDictDailyDataDetails["temperatureMax"] as! Double)
            dailyTempLow.append(weatherDictDailyDataDetails["temperatureMin"] as! Double)
        }
        
        //temperatureMin = weatherDictDailyData["temperatureMin"] as! Double
        //temperatureMin = weatherDictDailyData["temperatureMin"] as! Double
        
        //print(temperatureMin)
        //temperatureMax = weatherDictDailyData["temperatureMax"] as! Double
        
        //print(temperatureMin)
        //dailySummary = weatherDictDailyDetail?["summary"] as! String
        
        //temperatureMin = 0
        
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
    }
    
    init(weatherData: String) {
        
        
        //empty initialization
        initialized = false
        
        timezone = ""
        
        /*city = ""
         country = ""
         
         //current data*/
        summary = ""
        
        //currentDateAndtime = 0
        
        icon = ""
        
        //precipIntensity = 0
        
        //precipProbability = 0
        
        //precipType = ""
        
        temperature = nil
        
        temperatureMin = 0
        temperatureMax = 0
        
        apparentTemperature = 0
        
        precipProbability = 0
        
        dailySummary = ""
        
        //humidity = 0
        
        //windSpeed = 0
        
        //daily summary
        //dailySummary = ""
        hourlySummary = ""
        
        hourlyTimeArray = []
        hourlySummaryArray = []
        hourlyIconArray = []
        hourlyTemperatureArray = []
        
        dailyTimeArray = []
        dailySummaryArray = []
        dailyIconArray = []
        dailyTempHigh = []
        dailyTempLow = []
        
        sunriseTime = ""
        sunsetTime = ""
    }
    
}
