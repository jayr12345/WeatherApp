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
}

class WeatherNetworkClient: WeatherNetworkProvider {
    var apiClient: NetworkProvider = NetworkClient.instance
    var userManger: UserManager = UserManager.shared

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
    case photos

    var endpoint: String {
        "https://api.pexels.com/v1"
    }

    var urlString: String {
        "\(endpoint)/\(path)"
    }

    var path: String {
        switch self {
        case .photos:
            return "curated"
        }
    }

    func asRequestInfo() -> RequestInfo {
        let requestInfo: RequestInfo = RequestInfo(url: urlString,
                                                   headers: ["Authorization": "ZHhzFzs6fqaNfv5tga0ZlykLJloX1PLHcM4iS9IMOLx95pfZuIpgnEoF"])
        return requestInfo
    }
}
