//
//  WeatherNetworkProvider.swift
//  WeatherApp
//
//  Created by JayR Atamosa on 3/11/23.
//

import Foundation
import Combine
import Auth0

protocol WeatherNetworkProvider {
    func login()
    func logout()
    func getForecast() -> AnyPublisher<Forecast, Error>
}

class WeatherNetworkClient: WeatherNetworkProvider {
    var apiClient: NetworkProvider = NetworkClient.instance
    var userManger: UserManager = UserManager.shared

    func getForecast() -> AnyPublisher<Forecast, Error> {
        apiClient.request(WeatherNetworkRouter.forecast).decode()
    }

    func login() {
        Auth0
            .webAuth()
            .start { [self] result in
                switch result {
                case .success(let credentials):
                    let user = User(from: credentials.idToken)
                    userManger.user = user
                case .failure:
                    userManger.user = nil
                }
            }
    }

    func logout() {
        Auth0
            .webAuth()
            .clearSession { [self] result in
                switch result {
                case .success:
                    userManger.user = nil
                case .failure(let error):
                    print("Failed with: \(error)")
                }
            }

    }

}

enum WeatherNetworkRouter: RequestInfoConvertible {
    case forecast

    var endpoint: String {
        "http://api.openweathermap.org/data/2.5"
    }

    var urlString: String {
        "\(endpoint)/\(path)"
    }

    var path: String {
        switch self {
        case .forecast:
            return "forecast?q="
        }
    }

    func asRequestInfo() -> RequestInfo {
        var newUrlString = urlString
        if let searchCity = UserDefaults.standard.object(forKey: "searchCity") as? String {
            newUrlString = urlString + searchCity + "&cnt=5&appid=bf701fb2157e9ae467c78109113b86ce"
        }
        let requestInfo: RequestInfo = RequestInfo(url: newUrlString)
        return requestInfo
    }
}
