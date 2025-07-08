//
//  DestinationList.swift
//  Freebird
//
//  Created by Anthony Guzzardo on 7/8/25.

import SwiftUI
import SwiftData

struct MeetUpList : View {
    @Query(sort: \MeetUp.name) private var meetUps: [MeetUp]
    var body : some View {
        NavigationStack{
            Group{
                if !meetUps.isEmpty {
                    Text("Hello, World!")
                } else {
                    ContentUnavailableView(
                        "No events found",
                        systemImage: "globe.desk",
                        description: Text("You have not set up any events yet. Tap on the plus (+) button to add your first event.")
                    )
                }
            }

        }
        .navigationTitle("My Meet Ups")
        .toolbar {
            Button {
                
            }label: {
                Image(systemName: "plus.circle.fill")
            }
        }
    }
}
#Preview {
    MeetUpList()
        .modelContainer(MeetUp.preview)
}
