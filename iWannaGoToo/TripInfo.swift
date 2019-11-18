//
//  TripInfo.swift
//  iWannaGoToo
//
//  Created by tawana howard on 11/16/19.
//  Copyright © 2019 tawana howard. All rights reserved.
//

import SwiftUI

struct TripInfo: View {
    static let colors: [String: Color] = ["B": .purple, "C": .orange, "F": .red, "H": .blue, "L": .green]
    static let keys: [String: String] = ["B": "Beach", "C": "City Break", "F": "Foodie", "H": "Culture", "L": "Luxury", "S": "Spa"]
    
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
            
            VStack {
                Text(item.description)
                    .padding()
            }
            
            HStack {
                ForEach(item.range, id: \.self) {range in Text(range)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(10)
                    .background(Self.colors[range, default: .black])
                    .clipShape(Circle())
                    .foregroundColor(.white)
                }
            }
            Spacer()
            
            Text("Tag a Friend")
            Button("You Wanna Go With Me?"){
            }.padding()
      
            
            Button("You Wanna Go? Book It"){
                self.booking.add(item: self.item)
            }.font(.title)
            .padding()
                .frame(minWidth: 1, maxWidth: .infinity)
            .background(Color.green)
            .cornerRadius(40)
                .padding(.horizontal, 5)
            .foregroundColor(.white)
            .padding(10)
                .frame(minWidth: 1, maxWidth: .infinity)
            .overlay(RoundedRectangle(cornerRadius: 40)
                .stroke(Color.green, lineWidth: 5)
                .padding(.horizontal, 5)
                
            )
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
