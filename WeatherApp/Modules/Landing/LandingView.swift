//
//  landingView.swift
//  WeatherApp
//
//  Created by JayR Atamosa on 3/11/23.
//

import SwiftUI

struct LandingView: View {
    @StateObject var viewModel = LandingViewModel()
    @StateObject var usermanager = UserManager.shared

    var message = ["Welcome to the Weather forecast application. ",
                   "Please login your Github user to use the application",
                   "and view the weather in your city."].joined()
    var body: some View {
        VStack(alignment: .leading) {
            Text(message)
                .multilineTextAlignment(.leading)
                .padding(.top, 100)
            Button("Login") {
                viewModel.login()
            }
            .disabled(usermanager.user == nil ? false : true)
            .padding(.top, 20)
        }
    }
}
