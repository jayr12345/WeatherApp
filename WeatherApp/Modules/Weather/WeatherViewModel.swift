//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by JayR Atamosa on 3/12/23.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var forecast: Forecast = Forecast(list: [Temperature()])
    var networkClient: WeatherNetworkProvider = WeatherNetworkClient()

    func getForecast() {
        networkClient
            .getForecast()
            .replaceError(with: Forecast(list: [Temperature()]))
            .assign(to: &$forecast)
    }
}
