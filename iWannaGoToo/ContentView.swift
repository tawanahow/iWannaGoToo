//
//  ContentView.swift
//  iWannaGoToo
//
//  Created by tawana howard on 11/16/19.
//  Copyright © 2019 tawana howard. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let listing = Bundle.main.decode([TripType].self, from: "listing.json")
    var body: some View {
        NavigationView {
            List {
                ForEach(listing) { section in
                    Section(header: Text(section.name)) {
                        ForEach(section.items) {item in ListingRow(item:item)
                        }
                    }
                }
            }.navigationBarTitle("Trips")
            .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
