//
//  Menu.swift
//  iWannaGoToo
//
//  Created by tawana howard on 11/16/19.
//  Copyright © 2019 tawana howard. All rights reserved.
//

import SwiftUI

struct TripType: Codable, Identifiable {
    var id: UUID
    var name: String
    var items: [TripListing]
}

struct TripListing: Codable, Equatable, Identifiable {
    var id: UUID
    var name: String
    var insta: String
    var price: Int
    var range: [String]
    var description: String

    var mainImage: String {
        name.replacingOccurrences(of: " ", with: "-").lowercased()
    }

    var thumbnailImage: String {
        "\(mainImage)-thumb"
    }

    #if DEBUG
    static let example = TripListing(id: UUID(), name: "Paris One", insta: "Joseph Gonzalez", price: 1700, range: ["G", "V"], description: "Paris")
    #endif
}
