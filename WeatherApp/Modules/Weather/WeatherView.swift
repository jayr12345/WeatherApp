//
//  WeatherView.swift
//  WeatherApp
//
//  Created by JayR Atamosa on 3/11/23.
//

import SwiftUI

struct WeatherView: View {
    @StateObject var viewModel = WeatherViewModel()
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var topTabBar: TopTabBar

    struct TableRowView: View {
        var date: String
        var temp: String
        var body: some View {
            HStack {
                Text(date)
                Spacer()
                Text(temp)
            }
        }
    }

    var body: some View {
        VStack {
            if horizontalSizeClass == .compact {
                HStack {
                    Text("Date mm/dd/yyyy HH:mm:ss")
                        .foregroundColor(.blue)
                    Spacer()
                    Text("Temp(F)")
                        .foregroundColor(.blue)
                        .padding(.trailing, 30)
                }
            }
            Table(viewModel.forecast.list) {
                TableColumn("Date (\(Date.now.convertToString(format: "MM/dd/yyyy HH:mm:ss")))") { temp in
                                if horizontalSizeClass == .compact {
                                    let date = temp.datetext?.convertToDate(format: "yyyy-MM-dd HH:mm:ss")
                                    let displayDate = date?.convertToString(format: "MM/dd/yyyy HH:mm:ss")
                                    if let tempDisplay = temp.main?.temp {
                                        let temperature = String(format: "%.1f", tempDisplay)
                                        TableRowView(date: displayDate ?? "", temp: temperature)
                                    }
                                } else {
                                    let date = temp.datetext?.convertToDate(format: "yyyy-MM-dd HH:mm:ss")
                                    let displayDate = date?.convertToString(format: "MM/dd/yyyy HH:mm:ss")
                                    Text(displayDate ?? "")
                                }
                            }
                TableColumn("Temp(F)") { temp in
                    if let tempDisplay = temp.main?.temp {
                        let temperature = String(format: "%.1f", tempDisplay)
                        Text(temperature)
                    }
                }
            }
        }
        .onAppear {
            viewModel.getForecast()
        }
    }

}
