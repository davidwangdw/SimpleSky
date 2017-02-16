//
//  DailyDetailViewController.swift
//  SimpleSky
//
//  Created by David Wang on 1/7/17.
//  Copyright © 2017

import UIKit

class DailyDetailViewController: UIViewController {
    
    //labels for outputs
    @IBOutlet weak var apparentTempLabel: UILabel!
    @IBOutlet weak var weatherDetailText: UITextView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var precipitationLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    
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

    @IBAction func websiteLinkButton(_ sender: Any) {
        UIApplication.shared.openURL(URL(string: "http://www.davidwangdw.com")!)
        
    }
    override func viewDidLoad() {
        
        print("in daily detail view controller")
        super.viewDidLoad()
        
        blurBackground() 
        
        hiddenLabel.textColor = UIColor.white
        
        colorLabels()
        
        updateLabels()
    }
    
    func blurBackground() {
        
        /*let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        visualEffectView.frame = dailyWeatherView.bounds
        dailyWeatherView.insertSubview(visualEffectView, at: 0)*/
    }
    
    func initializeLabels() {
        
        apparentTempLabel.text = ""
        weatherDetailText.text = ""
        
    }
    
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
    
    func updateLabels() {
        apparentTempLabel.text = String(format:"%.0f", weatherData.apparentTemperature) + "°"
        highTempLabel.text = String(format:"%.0f", weatherData.temperatureMax) + "°"
        lowTempLabel.text = String(format:"%.0f", weatherData.temperatureMin) + "°"
        weatherDetailText.text = weatherData.dailySummary
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension UIImageView{
    func blurImage()
    {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds

        self.addSubview(blurEffectView)
    }
}
