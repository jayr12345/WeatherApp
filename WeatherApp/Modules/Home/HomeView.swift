//
//  SecondView.swift
//  WeatherApp
//
//  Created by JayR Atamosa on 3/11/23.
//

import SwiftUI

struct HomeView: View {
    var topTabBar: TopTabBar
    @Environment(\.openURL) var openURL
    @StateObject var usermanager = UserManager.shared
    @State var cityInput = ""

    var body: some View {
        VStack(alignment: .center) {
            Text(usermanager.user?.name ?? "")
                .padding(.top, 50)
            Button(action: {
                if let nickname = usermanager.user?.nickname {
                    openURL(URL(string: "https://github.com/" + nickname)!)
                }
            }) { if let nickname = usermanager.user?.nickname {
                    Text("https://github.com/" + nickname)
                }
            }.padding(.top, 10)
            HStack {
                Image("search")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.leading, 5)
                    .frame(width: 36, height: 36)
                TextField("City", text: $cityInput).foregroundColor(Color.black).font(Font.custom("Papyrus", size: 16))
            }
            .padding(.top, 10)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(Color.black))
            Button(action: {
                topTabBar.tabIndex = 2
                }, label: {
                    Text("Display Weather")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }).padding(.top, 5)
        }
    }
}
