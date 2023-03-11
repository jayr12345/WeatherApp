//
//  User.swift
//  WeatherApp
//
//  Created by JayR Atamosa on 3/11/23.
//

import Foundation
import JWTDecode

struct User: Codable {
    let id: String
    let email: String
    let picture: String
}

extension User {
    init?(from idToken: String) {
        guard let jwt = try? decode(jwt: idToken),
              let id = jwt.subject,
              let email = jwt["email"].string,
              let picture = jwt["picture"].string
        else { return nil }
        self.id = id
        self.email = email
        self.picture = picture
    }
}
