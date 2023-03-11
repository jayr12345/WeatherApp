//
//  ContentView.swift
//  WeatherApp
//
//  Created by JayR Atamosa on 3/11/23.
//

import SwiftUI

struct ContentView: View {
    @State var tabIndex = 0
    
    var body: some View {
        NavigationView {
            VStack{
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
                            
                        }
                    }
                    
                }
                
                
                TopTabBar(tabIndex: $tabIndex)
                if tabIndex == 0 {
                    LandingView()
                }
                else {
                    HomeView()
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
