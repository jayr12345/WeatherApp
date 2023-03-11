//
//  WeatherView.swift
//  WeatherApp
//
//  Created by JayR Atamosa on 3/11/23.
//

import SwiftUI

struct WeatherView: View {
    var topTabBar: TopTabBar
    @StateObject var viewModel = HomeViewModel()

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.yellow)
            Text("Weather View")
        }
    }
}
