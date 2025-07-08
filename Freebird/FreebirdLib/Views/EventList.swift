//
//  DestinationList.swift
//  Freebird
//
//  Created by Anthony Guzzardo on 7/8/25.
//

import SwiftUI
import SwiftData

struct EventList : View {
    @Query(sort: \Event.name) private var events: [Event]
    
    var body : some View {
        NavigationStack{
            Group{
                if !events.isEmpty {
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
        .navigationTitle("My Events")
        .toolbar {
            Button {
                
            }label: {
                Image(systemName: "plus.circle.fill")
            }
        }
    }
}
#Preview {
    EventList()
        .modelContainer(Event.preview)
}
