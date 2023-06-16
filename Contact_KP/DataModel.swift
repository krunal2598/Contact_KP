//
//  DataModel.swift
//  Contact_KP
//
//  Created by Krunal Parmar on 2023-06-15.
//

import UIKit


import SwiftUI

struct ContactData: Identifiable {
    var id: Int
    var fullName: String
    var phone: String
    var email: String
    var address: String
    var isFavorite: Bool
}

class DataModel: ObservableObject {
    static let data: [ContactData] = [
        ContactData(id: 1, fullName: "John Doe", phone: "1234567890", email: "john.doe@gmail.com", address: "123 Main St, City, Country", isFavorite: true),
        ContactData(id: 2, fullName: "Jane Smith", phone: "0987654321", email: "jane.smith@gmail.com", address: "456 Elm St, City, Country", isFavorite: false),
        ContactData(id: 3, fullName: "Alice Johnson", phone: "5555555555", email: "alice.johnson@gmail.com", address: "789 Oak St, City, Country", isFavorite: true)
    ]
}



