

import UIKit

class DailyWeatherCell: UITableViewCell {
    @IBOutlet weak var dailyWeatherSummaryLabel: UILabel!
    
}


class WeeklyViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //use a hidden label to manage all text colors
    @IBOutlet weak var hiddenLabel: UILabel!
    
    @IBOutlet weak var weeklyWeatherView: UIView!
    @IBOutlet weak var weatherTableView: UITableView!
    
    let weatherArray = ["Rain throughout the day.", "Rain throughout the day."]
    let dailyWeatherCellIdentifier = "WeatherDailyCell"
    
    
    override func viewDidLoad() {
        
        //print(weatherData.city)
        
        //didGetWeather(weather: weather)
        
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        
        visualEffectView.frame = weeklyWeatherView.bounds
        
        weeklyWeatherView.insertSubview(visualEffectView, at: 0)
        
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
        
    }
    
    func colorLabels() {
        
    }
    
    func updateLabels() {
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: dailyWeatherCellIdentifier, for: indexPath) as! DailyWeatherCell
        
        let weatherSummaryFromArray = weatherArray[indexPath.row]
        cell.dailyWeatherSummaryLabel.text = weatherSummaryFromArray
        //cell.fruitImageView?.image = UIImage(named: fruitName)
        
        return cell
    }
    
}
