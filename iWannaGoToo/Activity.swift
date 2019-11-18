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
    static let example = TripListing(id: UUID(), name: "French Riviera", insta: "Joseph Gonzalez", price: 1700, range: ["L", "C"], description: "This sun-drenched playground has always attracted the glitterati, especially during The Cannes Film Festival (expect anyone from Tom Hardy to Nicole Kidman on any given year). While there are dreamy hotels, such as the Grand-Hotel du Cap-Ferrat and Hotel du Cap-Eden-Roc, Bella Thorne stayed in a luxury villa. Many stars prefer to charter a yacht — Gwyneth Paltrow has vacationed on-board one in St. Tropez, while J. Lo and A-Rod cruised around the posh resort town of Antibes.")
    #endif
}
