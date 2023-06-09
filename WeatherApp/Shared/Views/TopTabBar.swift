//
//  TopTabBar.swift
//  WeatherApp
//
//  Created by JayR Atamosa on 3/11/23.
//

import SwiftUI

struct TopTabBar: View {
    @StateObject var usermanager = UserManager.shared
    @Binding var tabIndex: Int
    var body: some View {
        HStack(spacing: 20) {
            TabBarButton(text: "Login", isSelected: .constant(tabIndex == 0))
                .onTapGesture { onButtonTapped(index: 0) }
            TabBarButton(text: "Home", isSelected: .constant(tabIndex == 1))
                .onTapGesture { onButtonTapped(index: 1) }
                .disabled(usermanager.user == nil ? true : false)
            TabBarButton(text: "Weather", isSelected: .constant(tabIndex == 2))
                .onTapGesture { onButtonTapped(index: 2) }
                .disabled(usermanager.user == nil ? true : false)
            Spacer()
        }
        .border(width: 1, edges: [.bottom], color: .black)
    }

    private func onButtonTapped(index: Int) {
        withAnimation { tabIndex = index }
    }
}
