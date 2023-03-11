//
//  ContentView.swift
//  WeatherApp
//
//  Created by JayR Atamosa on 3/11/23.
//

import SwiftUI

struct ContentView: View {
    @State var tabIndex = 0
    @StateObject var usermanager = UserManager.shared
    @StateObject var viewModel = LandingViewModel()

    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    HStack {
                        Spacer()
                        Text("Weather Forecast")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 20).bold())
                            .frame(width: 200, height: 24, alignment: .center)
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Button("Logout") {
                            viewModel.logout()
                        }.disabled(usermanager.user == nil ? true : false)
                    }

                }

                TopTabBar(tabIndex: $tabIndex)
                if tabIndex == 0 {
                    LandingView()
                } else if tabIndex == 1 {
                    HomeView()
                } else {
                    WeatherView()
                }
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width - 24, alignment: .center)
            .padding(.horizontal, 12)
            .navigationBarHidden(true)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
