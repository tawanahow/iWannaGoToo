//
//  TripInfo.swift
//  iWannaGoToo
//
//  Created by tawana howard on 11/16/19.
//  Copyright © 2019 tawana howard. All rights reserved.
//

import SwiftUI

struct TripInfo: View {
    @EnvironmentObject var booking: Booking
    var item: TripListing
    
    var body: some View {
        VStack{
            ZStack(alignment:
                .bottomTrailing){
                Image(item.mainImage)
                Text("📸:\(item.insta)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            
            Text(item.description)
                .padding()
            
            Button("Book It"){
                self.booking.add(item: self.item)
            }.font(.headline)
            
            Spacer()
            
        }.navigationBarTitle(Text(item.name), displayMode: .inline)
    }
}

struct TripInfo_Previews: PreviewProvider {
    static let booking = Booking()
    
    static var previews: some View {
        NavigationView{
            TripInfo(item: TripListing.example).environmentObject(booking)
        }
    }
}
