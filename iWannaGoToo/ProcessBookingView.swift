//
//  ProcessBookingView.swift
//  iWannaGoToo
//
//  Created by tawana howard on 11/16/19.
//  Copyright © 2019 tawana howard. All rights reserved.
//

import SwiftUI

struct ProcessBookingView: View {
    @EnvironmentObject var booking: Booking
    
    static let paymentTypes = ["Hashtags", "Followers", "Likes", "Unicorn Tears"]
    static let donationAmounts = [10, 15, 20, 25, 0]
    
    @State private var paymentType = 0
    @State private var putHashTag = false
    @State private var paymentHashtag = ""
    @State private var donationAmount = 1
    
    var totalPrice: Double {
        let total = Double(booking.total)
        let donationTotal = total / 100 * Double(Self.donationAmounts[donationAmount])
        return total + donationTotal
    }
    
    var body: some View {
        Form {
            Section {
                Picker ("Choose your payment method", selection:
                $paymentType) {
                    ForEach(0..<Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
                
                Toggle(isOn: $putHashTag.animation()) {
                    Text("Add a hashtag here")
                }
                
                if putHashTag {
                    TextField("Enter a travel-worthy hashtag here", text: $paymentHashtag)
                }
            }
            
            Section(header: Text("Donate to Charity?")) {
                Picker("Percentage:", selection:$donationAmount) {
                    ForEach(0..<Self.donationAmounts.count) {
                        Text("\(Self.donationAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            //format with floating code
            Section(header:
            Text("Trip Total: $\(totalPrice, specifier: "%.2f")")
            ) {
                Button("Confirm booking") {
                    //place booking
                }
            }
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
    }
}

struct ProcessBookingView_Previews: PreviewProvider {
    static let booking = Booking()
    
    static var previews: some View {
        ProcessBookingView().environmentObject(booking)
    }
}
