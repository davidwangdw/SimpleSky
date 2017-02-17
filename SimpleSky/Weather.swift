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
    
    var hourlyTimeArray = [NSDate]()
    var hourlySummaryArray = [String]()
    var hourlyIconArray = [String]()
    var hourlyTemperatureArray = [Double]()
    
    //daily info
    
    var dailyTimeArray = [NSDate]()
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
    //var sunriseTime:NSDate
    //var sunsetTime: NSDate
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
        
        
        //overall table is weatherData["key"]
        
        timezone = weatherData["timezone"] as! String
        
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
        
        for i in 0 ... 23 {
            var weatherDictHourlyDataDetails = weatherDictHourlyDataDetails[i]
            let date = NSDate(timeIntervalSince1970: weatherDictHourlyDataDetails["time"] as! TimeInterval)
            //hourlyTimeArray.append(weatherDictHourlyDataDetails["time"] as! NSDate)
            hourlyTimeArray.append(date)
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
        
        for i in 0 ... 7 {
            var weatherDictDailyDataDetails = weatherDictDailyDataDetails[i]
            let date = NSDate(timeIntervalSince1970: weatherDictDailyDataDetails["time"] as! TimeInterval)
            if i == 0 { //first day, i.e. today
                temperatureMin = weatherDictDailyDataDetails["temperatureMin"] as! Double
                temperatureMax = weatherDictDailyDataDetails["temperatureMax"] as! Double
            }
            //dailyTimeArray.append(weatherDictDailyDataDetails["time"] as! NSDate)
            dailyTimeArray.append(date)
            dailySummaryArray.append(weatherDictDailyDataDetails["summary"] as! String)
            dailyIconArray.append(weatherDictDailyDataDetails["icon"] as! String)
            dailyTempHigh.append(weatherDictDailyDataDetails["temperatureMax"] as! Double)
            dailyTempLow.append(weatherDictDailyDataDetails["temperatureMin"] as! Double)
        }
        
        //print(weatherDictDailyDataDetails1["temperatureMin"])
        //print(weatherDictDailyDataDetails[0])
        //print(weatherDictDailyData)
        
        //}
        
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
    
    init(weatherData: String) {
        //empty initialization
        
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
    }
    
}
