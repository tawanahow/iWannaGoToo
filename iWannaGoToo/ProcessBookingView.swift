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
    
    static let paymentTypes = ["Likes", "Followers", "Hashtags"]
    @State private var paymentType = 0
    
    var body: some View {
        VStack {
            Section {
                Picker ("Choose your payment method", selection:
                $paymentType) {
                    ForEach(0..<Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
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
