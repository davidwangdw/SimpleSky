

import UIKit

var weatherData = Weather(weatherData: "")

class CurrentViewController : UIViewController, WeatherGetterDelegate {
    
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var logoView: UIImageView!
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    
    //use a hidden label to manage all text colors
    @IBOutlet weak var hiddenLabel: UILabel!
    
    @IBAction func updateWeather(_ sender: Any) {

        var weather: WeatherGetter!
            
        weather = WeatherGetter(delegate: self)
            
        weather.getWeather(coordinates: "40.781693,-73.966590")
        
        updateLabels()
    }
    
    //terrible way to implement viewdidload - change later
    var initialized: Int = 0
    override func viewDidLoad() {
        
        print(initialized)
        
        hiddenLabel.textColor = UIColor.white
        
        colorLabels()
        
        //terrible way to implement viewdidload = change later
        if initialized == 0 {
            initializeLabels()
            initialized += 1
        }
        
        
        
    }
    
    func initializeLabels() {
        highTempLabel.text = ""
        lowTempLabel.text = ""
        degreeLabel.text = ""
        summaryLabel.text = ""
    }
    
    func colorLabels() {
        degreeLabel.textColor = hiddenLabel.textColor
        highTempLabel.textColor = hiddenLabel.textColor
        lowTempLabel.textColor = hiddenLabel.textColor
        summaryLabel.textColor = hiddenLabel.textColor
    }
    
    func updateLabels() {
        //"°"
        degreeLabel.text = String(format:"%.0f", weatherData.temperature) + "°"
        summaryLabel.text = weatherData.summary
        highTempLabel.text = String(format:"%.0f", weatherData.temperatureMax) + "°"
        lowTempLabel.text = String(format:"%.0f", weatherData.temperatureMin) + "°"
    }
    
    func didGetWeather(weather: Weather) {
        DispatchQueue.main.async {
            
        }
        
        weatherData = weather
    }
    func didNotGetWeather(error: NSError) {
        // This method is called asynchronously, which means it won't execute in the main queue.
        // ALl UI code needs to execute in the main queue, which is why we're wrapping the call
        // to showSimpleAlert(title:message:) in a dispatch_async() call.
        //DispatchQueue.main.asynchronously() {
        /*self.showSimpleAlert(title: "Can't get the weather",
         message: "The weather service isn't responding.")*/
        //}
        DispatchQueue.main.async {
            //self.showSimpleAlert(title: "Can't get the weather",
                                 //message: "The weather service isn't responding.")
        }
        print("didNotGetWeather error: \(error)")
    }
    

    
}
