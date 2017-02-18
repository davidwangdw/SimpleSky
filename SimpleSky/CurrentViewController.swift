//
//  CurrentViewController.swift
//  SimpleSky
//
//  Created by David Wang on 2/16/17.
//

import UIKit

var weatherData = Weather(weatherData: "")
//terrible way to implement check - change later
var initialized: Int = 0

class CurrentViewController: UIViewController, WeatherGetterDelegate {
    
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
    
    @IBAction func updateWeather(_ sender: Any) {
        
        var weather: WeatherGetter!
        
        weather = WeatherGetter(delegate: self)
        
        weather.getWeather(coordinates: "40.781693,-73.966590")
        
        initialized = 1
        
    }

    override func viewDidLoad() {
        //hiddenLabel.textColor = UIColor.white
        
        //colorLabels()
        
        //terrible way to implement viewdidload = change later
        if initialized == 0 {
            //initializeLabels()
            
        } else {
            //updateLabels()
        }
        
        degreeLabel.center.x -= view.bounds.width
        degreeLabel.text = ""
        summaryLabel.center.y -= view.bounds.height
        highTempLabel.center.y -= view.bounds.height
        lowTempLabel.center.y -= view.bounds.height
        errorLabel.center.y += view.bounds.height
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
        UIView.animate(withDuration: 4, delay: 0.4, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
            self.getStartedLabel.center.y += self.view.bounds.height }, completion: nil)
        
        UIView.animate(withDuration: 1.5, delay: 0.4, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
            self.degreeLabel.center.x += self.view.bounds.width }, completion: nil)
        
        UIView.animate(withDuration: 1.5, delay: 0.4, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
            self.summaryLabel.center.y += self.view.bounds.height }, completion: nil)
        
        UIView.animate(withDuration: 1.5, delay: 0.4, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
            self.lowTempLabel.center.y += self.view.bounds.height }, completion: nil)
        
        UIView.animate(withDuration: 1.5, delay: 0.4, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
            self.highTempLabel.center.y += self.view.bounds.height }, completion: nil)
        
        
        animated = true
    }

    func initializeLabels() {
        highTempLabel.text = ""
        lowTempLabel.text = ""
        degreeLabel.text = ""
        summaryLabel.text = ""
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
        summaryLabel.text = weatherData.summary
        highTempLabel.text = String(format:"%.0f", weatherData.temperatureMax) + "°"
        lowTempLabel.text = String(format:"%.0f", weatherData.temperatureMin) + "°"
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
            UIView.animate(withDuration: 1.5, delay: 0.4, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
                self.errorLabel.center.y -= self.view.bounds.height }, completion: nil)
        }
        print("didNotGetWeather error: \(error)")
    }

}
