//
//  ListingRow.swift
//  iWannaGoToo
//
//  Created by tawana howard on 11/16/19.
//  Copyright © 2019 tawana howard. All rights reserved.
//

import SwiftUI

struct ListingRow: View {
        static let colors: [String: Color] = ["B": .purple, "C": .orange, "F": .red, "H": .blue, "L": .green]
    var item: TripListing
    
    var body: some View {
        NavigationLink(destination: TripInfo(item: item)) {
            HStack {
                Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                    Text("$\(item.price)")
                }.layoutPriority(1)
                
                Spacer()
                
                ForEach(item.range, id: \.self) {range in Text(range)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(Self.colors[range, default: .black])
                    .clipShape(Circle())
                    .foregroundColor(.white)
                }
            }
        }
    }
}

struct ListingRow_Previews: PreviewProvider {
    static var previews: some View {
        ListingRow(item: TripListing.example)
    }
}
