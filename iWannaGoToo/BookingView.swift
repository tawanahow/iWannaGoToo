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
    
    static let paymentTypes = ["Likes", "Followers", "Hashtags"]
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
                    }
                }
                
                Section {
                    NavigationLink(destination:
                    Text("Check Out")){
                        Text("Book It")
                    }
                }
            }
            .navigationBarTitle("Booking")
            .listStyle(GroupedListStyle())
        }
    }
}

struct BookingView_Previews: PreviewProvider {
    static let booking = Booking()
    
    static var previews: some View {
        BookingView().environmentObject(booking)
    }
}
    
