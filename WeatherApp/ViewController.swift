//
//  ViewController.swift
//  WeatherApp
//
//  Created by Nickolay on 17.02.2018.
//  Copyright © 2018 Rubs and CO. All rights reserved.
//

import UIKit

import Foundation
import CoreLocation

class ViewController: UIViewController{//}, UICollectionViewDelegate, UICollectionViewDataSource {
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 1
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        let cell = WeatherCollectionViewCell()
//        return cell
//    }
    
    
    let location = LocationClass<CurrentWeather>() //???????????????/
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //location.exploreLocation()
    
        
        
        DispatchQueue.global(qos:.utility).async{
            let forecast = self.location.download(completion: { (weather) in
                DispatchQueue.main.async {
                //self.tempField.text = String(weather.main!.temp)
//
//
//                    //for element in weather.list!{
//                    print(weather.main?.temp)
//                    print((weather.dt)!)
//                        let date =  Date(timeIntervalSince1970: (weather.dt)!)
//                        //print(Date(timeIntervalSince1970: <#T##TimeInterval#>))
//                        let sunRise =  Date(timeIntervalSince1970: (weather.sys?.sunset)!)
//                        print(date)
//                        print(sunRise)
//                    //}
//                    print(weather.name)
//                    //print((TimeZone.current.secondsFromGMT())/3600)
                 
                    let f = DateFormatter()
                    
                    print(f.weekdaySymbols![Calendar.current.component(.weekday, from: Date(timeIntervalSince1970: (weather.sys?.sunset)!))-1])
                    
                    
                }
                
            })
        }
        


        
    }
    
    

}


extension Thread {
    
    var threadName: String {
        if let currentOperationQueue = OperationQueue.current?.name {
            return "OperationQueue: \(currentOperationQueue)"
        } else if let underlyingDispatchQueue = OperationQueue.current?.underlyingQueue?.label {
            return "DispatchQueue: \(underlyingDispatchQueue)"
        } else {
            let name = __dispatch_queue_get_label(nil)
            return String(cString: name, encoding: .utf8) ?? Thread.current.description
        }
    }
}


