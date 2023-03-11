//
//  LandingViewModel.swift
//  WeatherApp
//
//  Created by JayR Atamosa on 3/11/23.
//

import Foundation

class LandingViewModel: ObservableObject {
    var networkClient: WeatherNetworkProvider = WeatherNetworkClient()

    func login() {
        networkClient.login()
    }

    func logout() {
        networkClient.logout()
    }
}
