//
//  HourWeather.swift
//  WeatherApp
//
//  Created by Nikolay on 07/01/2019.
//  Copyright © 2019 Rubs and CO. All rights reserved.
//

import Foundation
import UIKit

class HourWeather {
    private (set) var temperature : String?
    private (set) var image : UIImage?
    private (set) var time : String?
    
    init(temperature: String?, image: UIImage?, time: String?) {
        self.temperature = temperature
        self.image = image
        self.time = time
    }
    
}
