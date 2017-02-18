//
//  DetailedViewController.swift
//  SimpleSky
//
//  Created by David Wang on 2/16/17.
//

import UIKit

class DetailedViewController: UIViewController {
    
    @IBOutlet weak var apparentTempLabel: UILabel!
    @IBOutlet weak var weatherDetailText: UITextView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var precipitationLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    
    @IBOutlet weak var weatherSummaryImage: UIImageView!
    
    //static labels - need to change color
    @IBOutlet weak var detailsLabelStatic: UILabel!
    @IBOutlet weak var temperatureLabelStatic: UILabel!
    @IBOutlet weak var feelsLikeLabelStatic: UILabel!
    @IBOutlet weak var precipitationLabelStatic: UILabel!
    @IBOutlet weak var highTempStatic: UILabel!
    @IBOutlet weak var lowTempStatic: UILabel!
    
    //use a hidden label to manage all text colors
    @IBOutlet weak var hiddenLabel: UILabel!
    
    @IBOutlet weak var dailyWeatherView: UIView!
    
    @IBOutlet weak var sunriseTimeLabel: UILabel!
    @IBOutlet weak var sunsetTimeLabel: UILabel!
    
    @IBOutlet weak var sunriseTimeUnderlayImage: UIImageView!
    @IBOutlet weak var sunriseTimeOverlayImage: UIImageView!
    
    @IBAction func websiteLinkButton(_ sender: Any) {
        UIApplication.shared.openURL(URL(string: "http://www.davidwangdw.com")!)
        
    }
    
    @IBAction func githubLinkButton(_ sender: Any) {
        UIApplication.shared.openURL(URL(string: "https://github.com/davidwangdw/SimpleSky")!)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeLabels()
        
        //hiddenLabel.textColor = UIColor.white
        
        //colorLabels()
        
        //updateLabels()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        updateLabels()
    }
    
    func updateLabels() {
        
        if weatherData.initialized == true { //weather object does not have valid data
            apparentTempLabel.text = String(format:"%.0f", weatherData.apparentTemperature) + "°"
            temperatureLabel.text = String(format:"%.0f", weatherData.temperature!) + "°"
            highTempLabel.text = String(format:"%.0f", weatherData.temperatureMax) + "°"
            lowTempLabel.text = String(format:"%.0f", weatherData.temperatureMin) + "°"
            precipitationLabel.text = String(format:"%.0f", weatherData.precipProbability * 100) + "%"
            weatherDetailText.text = weatherData.dailySummary
            sunriseTimeLabel.text = weatherData.sunriseTime
            sunsetTimeLabel.text = weatherData.sunsetTime
        } else {
            initializeLabels()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializeLabels() {
        
        apparentTempLabel.text = ""
        lowTempLabel.text = ""
        highTempLabel.text = ""
        precipitationLabel.text = ""
        temperatureLabel.text = ""
        sunriseTimeLabel.text = ""
        sunsetTimeLabel.text = ""
    }
    
    /*override func viewDidAppear(_ animated: Bool) {
     //print("view appeared!")
     
     func colorLabels() {
     apparentTempLabel.textColor = hiddenLabel.textColor
     weatherDetailText.textColor = hiddenLabel.textColor
     lowTempLabel.textColor = hiddenLabel.textColor
     highTempLabel.textColor = hiddenLabel.textColor
     
     detailsLabelStatic.textColor = hiddenLabel.textColor
     temperatureLabelStatic.textColor = hiddenLabel.textColor
     feelsLikeLabelStatic.textColor = hiddenLabel.textColor
     precipitationLabelStatic.textColor = hiddenLabel.textColor
     
     highTempStatic.textColor = hiddenLabel.textColor
     lowTempStatic.textColor = hiddenLabel.textColor
     
     }
     
     */


}
