

import UIKit

var weatherData = Weather(weatherData: "")

class CurrentViewController : UIViewController, WeatherGetterDelegate {
    
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var logoView: UIImageView!
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!

    
    @IBAction func updateWeather(_ sender: Any) {
        updateLabels()
    }
    override func viewDidLoad() {

        
        var weather: WeatherGetter!
        
        weather = WeatherGetter(delegate: self)
        
        weather.getWeather(coordinates: "40.781693,-73.966590")
        
        degreeLabel.text = "56°"
        
    }
    
    func updateLabels() {
        //"°"
        degreeLabel.text = "20°"
        summaryLabel.text = weatherData.summary
    }
    
    func didGetWeather(weather: Weather) {
        DispatchQueue.main.async {
            print(weather.summary)
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
