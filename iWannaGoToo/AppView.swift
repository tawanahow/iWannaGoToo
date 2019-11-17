//
//  AppView.swift
//  iWannaGoToo
//
//  Created by tawana howard on 11/17/19.
//  Copyright © 2019 tawana howard. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName:"list.dash")
                    Text("Menu")
                }
            
            BookingView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Order")
                }
            
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static let booking = Booking()
    
    static var previews: some View {
        AppView().environmentObject(booking)
    }
}
