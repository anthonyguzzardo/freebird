//
//  DestinationList.swift
//  Freebird
//
//  Created by Anthony Guzzardo on 7/8/25.

import SwiftUI
import SwiftData

struct MeetUpList : View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \MeetUp.name) private var meetUps: [MeetUp]
    //used with Add MeetUp button
    @State private var newMeetUp = false
    @State private var meetUpName = ""
    var body : some View {
        NavigationStack{
            Group{
                if !meetUps.isEmpty {
                    List(meetUps){meetUp in
                        HStack{
                            Image(systemName : "globe")
                                .imageScale(.large)
                                .foregroundStyle(.primary)
                            
                            VStack(alignment: .leading){
                                Text(meetUp.name)
                                // String interpolation to pluralize location(s)
                                Text("^[\(meetUp.mapMarks.count) location](inflect: true)")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                        .swipeActions(content: .trailing){
                            Button(role: .destructive){
                                modelContext.delete(meetUp)
                            }
                        }
                    }
                } else {
                    ContentUnavailableView(
                        "No events found",
                        systemImage: "globe.desk",
                        description: Text("You have not set up any events yet. Tap on the plus (+) button to add your first event.")
                    )
                }
            }
            .navigationTitle("My Meet Ups")
            .toolbar {
                Button {
                    newMeetUp.toggle()
                }label: {
                    Image(systemName: "plus.circle.fill")
                }
                .alert(
                    "Enter Meet Up Name",
                    isPresented: $newMeetUp) {
                        TextField("Enter MeetUp Name", text: $meetUpName)
                        Button("OK"){
                            if !meetUpName.isEmpty {
                                let meetUp = MeetUp(name: meetUpName)
                                modelContext.insert(meetUp)
                                meetUpName = ""
                            }
                        }
                        Button("Cancel", role: .cancel){}
                    } message : {
                        Text("Create a new MeetUp")
                    }
            }
        }

    }
}
#Preview {
    MeetUpList()
        .modelContainer(MeetUp.preview)
}
