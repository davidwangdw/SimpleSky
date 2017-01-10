
import UIKit

class DailyViewController: UIViewController {
    
    //var city: String = "Not set"
    
    override func viewDidLoad() {
        
        print("In daily view controller")
        
        //print(weatherData.city)
        
        //didGetWeather(weather: weather)
        
    }
    
    func didGetWeather(weather: Weather) {
        DispatchQueue.main.async {
            print(weather.summary)
        }
    }
    
    
    /*func didGetWeather(weather: Weather) {
        DispatchQueue.main.async {
            print(weather.city)
        }
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
    }*/
    
}
