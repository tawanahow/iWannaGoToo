//
//  Booking.swift
//  iWannaGoToo
//
//  Created by tawana howard on 11/16/19.
//  Copyright © 2019 tawana howard. All rights reserved.
//


import SwiftUI

class Booking: ObservableObject {
    @Published var items = [TripListing]()

    var total: Int {
        if items.count > 0 {
            return items.reduce(0) { $0 + $1.price }
        } else {
            return 0
        }
    }

    func add(item: TripListing) {
        items.append(item)
    }

    func remove(item: TripListing) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
}
