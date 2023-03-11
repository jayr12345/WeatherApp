//
//  landingView.swift
//  WeatherApp
//
//  Created by JayR Atamosa on 3/11/23.
//

import SwiftUI

struct LandingView: View{
    var body: some View{
        VStack(alignment: .leading){
            Text("Welcome to the Weather forecast application. Please login your Github user to use the application and view the weather in your city.")
                .multilineTextAlignment(.leading)
                .padding(.top, 100)
            Button("Login") {
                
            }
            .padding(.top, 20)
        }
    }
}


