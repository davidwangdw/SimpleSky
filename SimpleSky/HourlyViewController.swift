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

class HourlyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var weatherTableView: UITableView!
    
    let hourlyWeatherCellIdentifier = "WeatherHourlyCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("in hourly view")
        weatherTableView.delegate = self
        weatherTableView.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.weatherTableView.reloadData()
    }
    
    //table view delegate functions
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 24
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: hourlyWeatherCellIdentifier, for: indexPath) as! HourlyWeatherCell

        if weatherData.temperature == nil {
            cell.hourlyWeatherHourLabel.text = ""
            cell.hourlyWeatherSummaryLabel.text = ""
            return cell
        } else {
            cell.hourlyWeatherHourLabel.text = String(weatherData.hourlyTimeArray[indexPath.row]) + ":00"
            cell.hourlyWeatherSummaryLabel.text = weatherData.hourlySummaryArray[indexPath.row]
            cell.hourlyWeatherTempLabel.text = String(format: "%.0f", weatherData.hourlyTemperatureArray[indexPath.row]) + "°"
            //cell.fruitImageView?.image = UIImage(named: fruitName)
            return cell
        }

    }

}
