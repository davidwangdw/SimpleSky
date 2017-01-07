

import UIKit

var weatherData = Weather(weatherData: "")

class CurrentViewController : UIViewController, WeatherGetterDelegate {
    
    

    
    override func viewDidLoad() {
        
        //let controller = segue.destinationViewController as! SecondViewController
        
        var weather: WeatherGetter!
        
        weather = WeatherGetter(delegate: self)
        
        weather.getWeather(coordinates: "40.781693,-73.966590")
        
    }
    
    func didGetWeather(weather: Weather) {
        DispatchQueue.main.async {
            print(weather.summary)
        }
        
        weatherData.city = weather.city
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
