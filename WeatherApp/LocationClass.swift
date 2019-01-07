//
//  LocationClass.swift
//  WeatherApp
//
//  Created by Nikolay on 04/01/2019.
//  Copyright © 2019 Rubs and CO. All rights reserved.
//

import Foundation
import CoreLocation

class LocationClass <structure> : NSObject, CLLocationManagerDelegate { //<structure>
        
    let LocationObject = CLLocationManager()
    
    let weatherObject = Network()
    
    var weatherTask: URLSessionDataTask!
    
    var temperature : String? = nil
    
    let apiKey="0264cc5f6543775f035a55dae9b27c80"
    
    var lat : String? = nil
    var lon : String? = nil
    
    let structure = CurrentWeather.self
    
    let types = type(of: CurrentWeather.self)
    
    func exploreLocation(){
        LocationObject.delegate = self
        LocationObject.startUpdatingLocation()
        LocationObject.requestWhenInUseAuthorization()
        LocationObject.desiredAccuracy = kCLLocationAccuracyBest
        LocationObject.distanceFilter = 1000
        
        self.lat = String((self.LocationObject.location?.coordinate.latitude)!)
        
        self.lon = String((self.LocationObject.location?.coordinate.longitude)!)
    }
    
    func download (completion: @escaping (structure) ->()) {
        
        self.exploreLocation()
        
        let typeType = type(of: structure.self)
        
        print(typeType)
        
        let url = "http://api.openweathermap.org/data/2.5/weather?lat=\((self.lat)!)&lon=\((self.lon)!)&APPID=\(self.apiKey)&units=metric"
        
        weatherObject.getData(urlString: url ,completion: { (Data) in
            let dataManager = JsonParser(inpputJson: Data, outputType: self.structure)
            completion(dataManager.output! as! structure)
        })
        
    }
}
