//
//  Forecast.swift
//  WeatherApp
//
//  Created by JayR Atamosa on 3/12/23.
//

import Foundation

struct Forecast: Codable, ArrayProtocol {

    enum CodingKeys: String, CodingKey {
        case cod, message, cnt, list
    }

    var cod: String?
    var message: Int?
    var cnt: Int?
    var list: [Temperature]
    typealias BaseCollection = [Temperature]
    subscript(index: Int) -> Temperature { list[index] }
}

struct Temperature: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id = "dt"
        case main
        case datetext = "dt_txt"
    }

    var id: Int?
    var datetext: String?
    var main: MainTemperature?
}

struct MainTemperature: Codable {
    enum CodingKeys: String, CodingKey {
        case temp, humidity, pressure
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }

    var temp: Double?
    var humidity: Int?
    var pressure: Int?
    var tempMin: Double?
    var tempMax: Double?
}
