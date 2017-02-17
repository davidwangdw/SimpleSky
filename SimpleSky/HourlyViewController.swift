//
//  HourlyViewController.swift
//  SimpleSky
//
//  Created by David Wang on 2/16/17.
//

import UIKit

class HourlyWeatherCell: UITableViewCell {
    @IBOutlet weak var hourlyWeatherSummaryLabel: UILabel!
    @IBOutlet weak var hourlyWeatherSummaryImage: UIImageView!
    @IBOutlet weak var hourlyWeatherTempLabel: UILabel!
    @IBOutlet weak var hourlyWeatherHourLabel: UILabel!
    
    
}

class HourlyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("in hourly view")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
