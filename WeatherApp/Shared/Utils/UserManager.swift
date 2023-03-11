//
//  UserManager.swift
//  WeatherApp
//
//  Created by JayR Atamosa on 3/11/23.
//

import Foundation

class UserManager: ObservableObject {

    // create a singleton
    static let shared = UserManager()

    @Published var user: User? {
        didSet {
            let userDefaults = UserDefaults.standard
            if user == nil {
                userDefaults.removeObject(forKey: "loggedinUser")
            } else {
                do {
                    let encoder = JSONEncoder()
                    let data = try encoder.encode(user)
                    UserDefaults.standard.set(data, forKey: "loggedinUser")
                } catch {
                    print("Unable to Encode Note (\(error))")
                }
            }
        }
    }

    // create a private initializer
    private init() {
        if let data = UserDefaults.standard.data(forKey: "loggedinUser") {
            do {
                let decoder = JSONDecoder()
                let savedUser = try decoder.decode(User.self, from: data)
                self.user = savedUser
            } catch {
                print("Unable to Decode Note (\(error))")
            }
        }
    }
}
