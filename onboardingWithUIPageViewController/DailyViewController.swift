
import UIKit

class DailyViewController: UIViewController {
    
    //use a hidden label to manage all text colors
    @IBOutlet weak var hiddenLabel: UILabel!
    
    @IBOutlet weak var weeklyWeatherView: UIView!
    
    override func viewDidLoad() {
        
        //print(weatherData.city)
        
        //didGetWeather(weather: weather)
        
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        
        visualEffectView.frame = weeklyWeatherView.bounds
        
        weeklyWeatherView.insertSubview(visualEffectView, at: 0)
        
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
    
    
}
