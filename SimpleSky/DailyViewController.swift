//
//  DailyViewController.swift
//  SimpleSky
//
//  Created by David Wang on 2/16/17.
//

import UIKit

class DailyWeatherCell: UITableViewCell {
    @IBOutlet weak var dailyWeatherDayLabel: UILabel!
    @IBOutlet weak var dailyWeatherSummaryLabel: UILabel!
    @IBOutlet weak var dailyWeatherHighTempLabel: UILabel!
    @IBOutlet weak var dailyWeatherLowTempLabel: UILabel!
    @IBOutlet weak var dailyWeatherHighTempImage: UIImageView!
    @IBOutlet weak var dailyWeatherLowTempImage: UIImageView!
    
    @IBOutlet weak var dailyWeatherSummaryImage: UIImageView!
    @IBOutlet weak var dailyWeatherVerticalSeparator: UIImageView!
    
}

class DailyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var weatherTableView: UITableView!
    
    let dailyWeatherCellIdentifier = "WeatherDailyCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        weatherTableView.delegate = self
        weatherTableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.weatherTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: dailyWeatherCellIdentifier, for: indexPath) as! DailyWeatherCell
        
        if weatherData.temperature == nil {
            cell.dailyWeatherSummaryLabel.text = ""
            
            cell.dailyWeatherDayLabel.text = ""
            cell.dailyWeatherHighTempLabel.text = ""
            cell.dailyWeatherLowTempLabel.text = ""
            
            return cell
        } else {
            cell.dailyWeatherSummaryLabel.text = weatherData.dailySummaryArray[indexPath.row]
            cell.dailyWeatherLowTempLabel.text = String(format: "%.0f", weatherData.dailyTempLow[indexPath.row]) + "°"
            cell.dailyWeatherHighTempLabel.text = String(format: "%.0f", weatherData.dailyTempHigh[indexPath.row]) + "°"
            //cell.fruitImageView?.image = UIImage(named: fruitName)
            /*
             cell.dailyWeatherHighTempImage: UIImage!
             cell.dailyWeatherLowTempImage: UIImage!
 
             cell.dailyWeatherSummaryImage: UIImage!
             cell.dailyWeatherVerticalSeparator: UIImage!*/
            cell.dailyWeatherDayLabel.text = weatherData.dailyTimeArray[indexPath.row]
            return cell
        }
 
    }

}
