//
//  DestinationList.swift
//  Freebird
//
//  Created by Anthony Guzzardo on 7/8/25.

import SwiftUI
import SwiftData

struct MeetUpList : View {
    
    // MARK: Struct Members
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \MeetUp.name) private var meetUps: [MeetUp]
    //used with Add MeetUp button
    @State private var newMeetUp = false
    @State private var meetUpName = ""
    
    // MARK: Views
    var body: some View {
        NavigationStack {
            Group {
                if !meetUps.isEmpty {
                    meetUpList
                } else {
                    noMeetUpsView
                }
            }
            .navigationTitle("My Meet Ups")
            .toolbar {
                addMeetUpButton
            }
        }
    }

    // MARK: - MeetUp List
    private var meetUpList: some View {
        List(meetUps) { meetUp in
            MeetUpRow(meetUp: meetUp)
        }
    }

    // MARK: - Empty View
    private var noMeetUpsView: some View {
        ContentUnavailableView(
            "No events found",
            systemImage: "globe.desk",
            description: Text("You have not set up any events yet. Tap on the plus (+) button to add your first event.")
        )
    }

    // MARK: - Toolbar Button
    private var addMeetUpButton: some ToolbarContent {
        ToolbarItem(placement: .primaryAction) {
            Button {
                newMeetUp.toggle()
            } label: {
                Image(systemName: "plus.circle.fill")
            }
            .alert(
                "Enter Meet Up Name",
                isPresented: $newMeetUp
            ) {
                TextField("Enter MeetUp Name", text: $meetUpName)
                Button("OK") {
                    if !meetUpName.isEmpty {
                        let meetUp = MeetUp(name: meetUpName)
                        modelContext.insert(meetUp)
                        meetUpName = ""
                    }
                }
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("Create a new MeetUp")
            }
        }
    }

    private struct MeetUpRow: View {
        let meetUp: MeetUp
        @Environment(\.modelContext) private var modelContext

        var body: some View {
            HStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.primary)

                VStack(alignment: .leading) {
                    Text(meetUp.name)
                    locationText
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            .swipeActions(edge: .trailing) {
                Button(role: .destructive) {
                    modelContext.delete(meetUp)
                } label: {
                    Label("Delete", systemImage: "trash")
                }
            }
        }

        private var locationText: Text {
            Text("^[\(meetUp.mapMarks.count) location](inflect: true)")
        }
    }



}
#Preview {
    MeetUpList()
        .modelContainer(MeetUp.preview)
}
