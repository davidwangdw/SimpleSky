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
    @IBOutlet weak var dailyWeatherHighTempImage: UIImage!
    @IBOutlet weak var dailyWeatherLowTempImage: UIImage!
    
    @IBOutlet weak var dailyWeatherSummaryImage: UIImage!
    @IBOutlet weak var dailyWeatherVerticalSeparator: UIImage!
    
}

class DailyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var weatherTableView: UITableView!
    
    let dailyWeatherCellIdentifier = "WeatherDailyCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        weatherTableView.delegate = self
        weatherTableView.dataSource = self
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
            //cell.dailyWeatherSummaryLabel.text = weatherData.hourlySummaryArray[indexPath.row]
            //cell.fruitImageView?.image = UIImage(named: fruitName)
            /*
             cell.dailyWeatherHighTempImage: UIImage!
             cell.dailyWeatherLowTempImage: UIImage!
 
             cell.dailyWeatherSummaryImage: UIImage!
             cell.dailyWeatherVerticalSeparator: UIImage!*/
            return cell
        }
 
    }

}
