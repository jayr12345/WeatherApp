//
//  Date+Util.swift
//  WeatherApp
//
//  Created by JayR Atamosa on 3/12/23.
//

import Foundation

extension Date {
    func convertToString(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
