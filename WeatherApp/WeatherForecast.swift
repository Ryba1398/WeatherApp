//
//  WeatherForecast.swift
//  WeatherApp
//
//  Created by Nikolay on 04/01/2019.
//  Copyright © 2019 Rubs and CO. All rights reserved.
//

import Foundation

struct CurrentWeather: Decodable {
    let coord: Coord?
    let weather: [Weather]?
    let base: String?
    let main: Main?
    let wind: Wind?
    let clouds: Clouds?
    let rain: Rain?
    let snow: Snow?
    let dt: Double?
    let sys: Sys?
    let id: Int?
    let name: String?
    let cod: Int?
}

struct ShortWeatherForecast: Decodable {
    let cod: String?
    let message: Float?
    let cnt: Int?
    let list: [List]?
    let city: City?
}

struct City: Decodable {
    let id: Int?
    let name: String?
    let coord: Coord?
    let country: String?
}

struct List: Decodable {
    let dt: Double?
    let main: Main?
    let weather: [Weather]?
    let clouds: Clouds?
    let wind: Wind?
    let rain: Rain?
    let snow: Snow?
    let dtTxt: String?

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, rain, snow
        case dtTxt = "dt_txt"
    }
}

struct Clouds: Decodable {
    let all: Int?
}

struct Coord: Decodable {
    let lon, lat: Double
}

struct Main: Decodable {
    let temp: Double?
    let pressure, humidity: Float? //????????????????????????????????????????
    let tempMin, tempMax: Double?
    let seaLevel, groundLevel: Float?
    let tempKf: Float?
    
    enum CodingKeys: String, CodingKey {
        case temp, pressure, humidity
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case seaLevel = "sea_level"
        case groundLevel = "grnd_level"
        case tempKf = "temp_kf"
    }
}

struct Rain: Decodable {
    let the1H: Float?
    let the3H: Float?
    
    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
        case the1H = "1h"
    }
}

struct Snow: Decodable {
    let the1H: Float?
    let the3H: Float?
    
    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
        case the1H = "1h"
    }
}

struct Sys: Decodable {
    let type, id: Int?
    let message: Double?
    let country: String?
    let sunrise, sunset: Double?
}

struct Weather: Decodable {
    let id: Int?
    let main, description, icon: String?
}

struct Wind: Decodable {
    let speed: Double?
    let deg: Float?
}
