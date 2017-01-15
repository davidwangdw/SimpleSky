//
//  DailyDetailViewController.swift
//  SimpleSky
//
//  Created by David Wang on 1/7/17.
//  Copyright © 2017

import UIKit

class DailyDetailViewController: UIViewController {
    
    @IBOutlet weak var apparentTempLabel: UILabel!
    
    @IBOutlet weak var weatherDetailText: UITextView!
    
    //use a hidden label to manage all text colors
    @IBOutlet weak var hiddenLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        hiddenLabel.textColor = UIColor.white
        
        colorLabels()
        
        updateLabels() 
    }
    
    func initializeLabels() {
        
        apparentTempLabel.text = ""
        weatherDetailText.text = ""
        
    }
    
    func colorLabels() {
        apparentTempLabel.textColor = hiddenLabel.textColor
        
        weatherDetailText.textColor = hiddenLabel.textColor
    }
    
    func updateLabels() {
        apparentTempLabel.text = String(format:"%.0f", weatherData.apparentTemperature) + "°"
        
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
