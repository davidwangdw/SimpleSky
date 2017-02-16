
import UIKit

class HourlyWeatherCell: UITableViewCell {
    @IBOutlet weak var hourlyWeatherSummaryLabel: UILabel!
    
}

class DailyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //use a hidden label to manage all text colors
    @IBOutlet weak var hiddenLabel: UILabel!
    @IBOutlet weak var weatherTableView: UITableView!
    @IBOutlet weak var weeklyWeatherView: UIView!
    
    //test array
    let weatherArray = ["great sun out today", "chance of rain at 5000%"]
    let hourlyWeatherCellIdentifier = "WeatherHourlyCell"
    
    override func viewDidLoad() {
        
        //print(weatherData.city)
        
        //didGetWeather(weather: weather)
        
        /*let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        visualEffectView.frame = weeklyWeatherView.bounds
        weeklyWeatherView.insertSubview(visualEffectView, at: 0)*/
        
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
        
    }
    
    /*func didGetWeather(weather: Weather) {
        DispatchQueue.main.async {
            print(weather.summary)
        }
    }*/
    
    func colorLabels() {
        
    }
    
    func updateLabels() {
        
    }

    //table view delegate functions
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: hourlyWeatherCellIdentifier, for: indexPath) as! HourlyWeatherCell
        
        let weatherSummaryFromArray = weatherArray[indexPath.row]
        cell.hourlyWeatherSummaryLabel.text = weatherSummaryFromArray
        //cell.fruitImageView?.image = UIImage(named: fruitName)
        
        return cell
    }
    
}
