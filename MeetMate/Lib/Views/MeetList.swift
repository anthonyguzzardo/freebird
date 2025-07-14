//
//  DestinationList.swift
//  Freebird
//
//  Created by Anthony Guzzardo on 7/8/25.

import SwiftUI
import SwiftData

struct MeetList : View {
    
    // MARK: Struct Members
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Meet.name) private var meets: [Meet]
    //used with Add Meet button
    @State private var newMeet = false
    @State private var meetName = ""
    @State private var path = NavigationPath()
    // MARK: Views
    var body: some View {
        NavigationStack(path: $path) {
            Group {
                if !meets.isEmpty {
                    meetList
                        // THIS RIGHT BELOW
                        .navigationDestination(for: Meet.self){ meet in
                            MeetMap(meet: meet)
                        }
                } else {
                    noMeetsView
                }
            }
            .navigationTitle("My Meets")
            .toolbar {
                addMeetButton
            }
        }
    }

    // MARK: - MeetUp List
    private var meetList: some View {
        List(meets) { meet in
            NavigationLink(value: meet){ // THIS WILL TAKE YOU TO THE EVENT
                MeetRow(meet: meet)
            }
            
        }
    }

    // MARK: - Empty View
    private var noMeetsView: some View {
        ContentUnavailableView(
            "No events found",
            systemImage: "globe.desk",
            description: Text("You have not set up any meets yet. Tap on the plus (+) button to add your first event.")
        )
    }

    // MARK: - Toolbar Button
    private var addMeetButton: some ToolbarContent {
        ToolbarItem(placement: .primaryAction) {
            Button {
                newMeet.toggle()
            } label: {
                Image(systemName: "plus.circle.fill")
            }
            .alert(
                "Enter Meet Up Name",
                isPresented: $newMeet
            ) {
                TextField("Enter MeetUp Name", text: $meetName)
                Button("OK") {
                    if !meetName.isEmpty {
                        let meet = Meet(name: meetName)
                        modelContext.insert(meet)
                        meetName = ""
                    }
                }
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("Create a new Meet")
            }
        }
    }

    private struct MeetRow: View {
        let meet: Meet
        @Environment(\.modelContext) private var modelContext

        var body: some View {
            HStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.primary)

                VStack(alignment: .leading) {
                    Text(meet.name)
                    locationText
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            .swipeActions(edge: .trailing) {
                Button(role: .destructive) {
                    modelContext.delete(meet)
                } label: {
                    Label("Delete", systemImage: "trash")
                }
            }
        }

        private var locationText: Text {
            Text("^[\(meet.mapMarks.count) location](inflect: true)")
        }
    }



}
#Preview {
    MeetList()
        .modelContainer(Meet.preview)
}
