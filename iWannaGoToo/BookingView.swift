//
//  BookingView.swift
//  iWannaGoToo
//
//  Created by tawana howard on 11/16/19.
//  Copyright © 2019 tawana howard. All rights reserved.
//

import SwiftUI

struct BookingView: View {
    @EnvironmentObject var booking: Booking
    
    static let paymentTypes = ["Hashtags", "Followers", "Likes", "Unicorn Tears"]
    @State private var paymentType = 0
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(booking.items) {item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }.onDelete(perform: deleteTripListing)
                }
                
                Section {
                    NavigationLink(destination:
                    ProcessBookingView()){
                        Text("Book It")
                    }
                }.disabled(booking.items.isEmpty)
            }
            .navigationBarTitle("Booking")
            .listStyle(GroupedListStyle())
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func deleteTripListing(at offsets: IndexSet) {
        booking.items.remove(atOffsets: offsets)
    }
}

struct BookingView_Previews: PreviewProvider {
    static let booking = Booking()
    
    static var previews: some View {
        BookingView().environmentObject(booking)
    }
}
    
