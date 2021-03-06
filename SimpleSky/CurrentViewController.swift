//
//  CurrentViewController.swift
//  SimpleSky
//
//  Created by David Wang on 2/16/17.
//

import UIKit
import CoreLocation

var weatherData = Weather(weatherData: "")
//terrible way to implement check - change later
var initialized: Int = 0

class CurrentViewController: UIViewController, WeatherGetterDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var logoView: UIImageView!
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    //use a hidden label to manage all text colors
    @IBOutlet weak var hiddenLabel: UILabel!
    
    @IBOutlet weak var getStartedLabel: UILabel!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    var animated: Bool = false
    var errorOccured: Bool = false
    
    var locationManager: CLLocationManager = CLLocationManager()
    var startLocation: CLLocation!
    
    var latitudeFromCurrentLocation: Double = 0.0
    var longitudeFromCurrentLocation: Double = 0.0
    
    //images
    @IBOutlet weak var currentWeatherSummaryImage: UIImageView!
    @IBOutlet weak var currentWeatherHighTemp: UIImageView!
    @IBOutlet weak var currentWeatherLowTemp: UIImageView!
    
    @IBAction func updateWeather(_ sender: Any) {
        
        startLocation = nil
        
        var weather: WeatherGetter!
        
        weather = WeatherGetter(delegate: self)
        
        //print(String(format:"%.6f", latitudeFromCurrentLocation) + "," + String(format: "%.6f", longitudeFromCurrentLocation))
        
        let coordinates = String(format:"%.6f", latitudeFromCurrentLocation) + "," + String(format: "%.6f", longitudeFromCurrentLocation)
        
        weather.getWeather(coordinates: coordinates)
        //weather.getWeather(coordinates: "40.781693,-73.966590")
        
        print("in udpateWeather")
        
        initialized = 1
        
    }

    override func viewDidLoad() {
        //hiddenLabel.textColor = UIColor.white
        
        //colorLabels()
        
        initializeLabels()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        startLocation = nil
        
        degreeLabel.center.x -= view.bounds.width
        degreeLabel.text = ""
        summaryLabel.center.y -= view.bounds.height
        highTempLabel.center.y -= view.bounds.height
        lowTempLabel.center.y -= view.bounds.height
        errorLabel.center.y += view.bounds.height
        
        currentWeatherSummaryImage.isHidden = true
        currentWeatherHighTemp.isHidden = true
        currentWeatherLowTemp.isHidden = true
        
        currentWeatherLowTemp.tintColor = UIColor.white
        currentWeatherSummaryImage.tintColor = UIColor.white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animatedLabels() {
        
        if animated == true {
            return
        }
        
        UIView.animate(withDuration: 4, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
            self.getStartedLabel.center.y += self.view.bounds.height }, completion: nil)
        
        UIView.animate(withDuration: 1.5, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
            self.degreeLabel.center.x += self.view.bounds.width }, completion: nil)
        
        UIView.animate(withDuration: 1.5, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
            self.summaryLabel.center.y += self.view.bounds.height }, completion: nil)
        
        UIView.animate(withDuration: 1.5, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
            self.lowTempLabel.center.y += self.view.bounds.height }, completion: nil)
        
        UIView.animate(withDuration: 1.5, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
            self.highTempLabel.center.y += self.view.bounds.height }, completion: nil)
        
        
        currentWeatherSummaryImage.isHidden = false
        currentWeatherLowTemp.isHidden = false
        currentWeatherHighTemp.isHidden = false
        
        let imageFade = CABasicAnimation(keyPath: "opacity")
            //imageFade.beginTime = CACurrentMediaTime() + 0.4
        imageFade.isRemovedOnCompletion = false
        imageFade.fromValue = 0
        imageFade.duration = 2.5
        imageFade.toValue = 1
        currentWeatherSummaryImage.layer.add(imageFade, forKey: "imageFade")
        currentWeatherHighTemp.layer.add(imageFade, forKey: "imageFade")
        currentWeatherLowTemp.layer.add(imageFade, forKey: "imageFade")
        cityLabel.layer.add(imageFade, forKey: "imageFade")
    

        animated = true

    }

    func initializeLabels() {
        cityLabel.text = ""
    }
    
    func colorLabels() {
        degreeLabel.textColor = hiddenLabel.textColor
        highTempLabel.textColor = hiddenLabel.textColor
        lowTempLabel.textColor = hiddenLabel.textColor
        summaryLabel.textColor = hiddenLabel.textColor
        cityLabel.textColor = hiddenLabel.textColor
    }
    
    func updateLabels() {
        //"°"
        degreeLabel.text = String(format:"%.0f", weatherData.temperature!) + "°"
        /*degreeLabel.layer.shadowOffset = CGSize(width: 0, height: 0)
        degreeLabel.layer.shadowOpacity = 1
        degreeLabel.layer.shadowRadius = 6*/
        summaryLabel.text = weatherData.summary
        highTempLabel.text = String(format:"%.0f", weatherData.temperatureMax) + "°"
        lowTempLabel.text = String(format:"%.0f", weatherData.temperatureMin) + "°"
        cityLabel.text = weatherData.timezone
        print(weatherData.icon)
        
        let weatherIconArray = ["clear-day", "clear-night", "rain", "snow", "sleet", "wind", "fog", "cloudy", "partly-cloudy-day", "partly-cloudy-night"]
        
        if weatherIconArray.contains(weatherData.icon) {
            currentWeatherSummaryImage.image = UIImage(named: weatherData.icon)
        } else {
            currentWeatherSummaryImage.image = UIImage(named: "clear-day")
        }
        
    }

    /*func startLocationManager() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
            locationManager.startUpdatingLocation()
            updatingLocation = true
            
        }
    }
    
    @IBAction func getLocation() {
        let authStatus = CLLocationManager.authorizationStatus()
        
        if authStatus == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
            return
        }
        
        if authStatus == .denied || authStatus == .restricted {
            //showLocationServicesDeniedAlert()
            return
        }
        
        if updatingLocation {
            //stopLocationManager()
        } else {
            location = nil
            lastLocationError = nil
            placemark = nil
            lastGeocodingError = nil
            startLocationManager()
        }
        
        //updateWeather()
        updateLabels()
    }*/
    
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation])
    {
        let latestLocation: CLLocation = locations[locations.count - 1]
        
        //latitude.text = String(format: "%.4f", latestLocation.coordinate.latitude)
        //longitude.text = String(format: "%.4f", latestLocation.coordinate.longitude)
        //horizontalAccuracy.text = String(format: "%.4f", latestLocation.horizontalAccuracy)
        //altitude.text = String(format: "%.4f", latestLocation.altitude)
        //verticalAccuracy.text = String(format: "%.4f", latestLocation.verticalAccuracy)
        
        latitudeFromCurrentLocation = latestLocation.coordinate.latitude
        longitudeFromCurrentLocation = latestLocation.coordinate.longitude
        
        if startLocation == nil {
            startLocation = latestLocation
        }
        
        //let distanceBetween: CLLocationDistance = latestLocation.distance(from: startLocation)
        
        //distance.text = String(format: "%.2f", distanceBetween)
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didFailWithError error: Error) {
        
    }

    
    func didGetWeather(weather: Weather) {
        DispatchQueue.main.async {
            weatherData = weather
            self.updateLabels()
            self.animatedLabels()
        }
        
    }
    func didNotGetWeather(error: NSError) {
        // This method is called asynchronously, which means it won't execute in the main queue.
        // ALl UI code needs to execute in the main queue, which is why we're wrapping the call
        // to showSimpleAlert(title:message:) in a dispatch_async() call.
        //DispatchQueue.main.asynchronously() {
        //self.showSimpleAlert(title: "Can't get the weather",
         //message: "The weather service isn't responding.")
        //}
        
        
        
        DispatchQueue.main.async {
            //self.showSimpleAlert(title: "Can't get the weather",
            //message: "The weather service isn't responding.")
            
            //add a check to get rid of error message if service works again
            UIView.animate(withDuration: 1.5, delay: 0.4, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
                self.errorLabel.center.y -= self.view.bounds.height }, completion: nil)
            
            self.errorOccured = true
        }
        print("didNotGetWeather error: \(error)")
    }

}
