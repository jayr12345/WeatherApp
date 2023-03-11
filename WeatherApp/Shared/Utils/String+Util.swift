//
//  String+Util.swift
//  WeatherApp
//
//  Created by JayR Atamosa on 3/12/23.
//

import Foundation

extension String {
    func convertToDate(format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
}
