//
//  StartTab.swift
//  Freebird
//
//  Created by Anthony Guzzardo on 7/8/25.
//

import SwiftUI
import SwiftData
struct StartTab : View {
    var body : some View {
        TabView {
            Group {
//                let container = MeetUp.preview
//                let fetchDescriptor = FetchDescriptor<MeetUp>()
//                let meetUp = try! container.mainContext.fetch(fetchDescriptor)[0]
//                MeetUpMap(meetUp: meetUp)
//                    .tabItem {
//                        Label("Map", systemImage: "map")
//                    }
                MeetUpList()
                    .tabItem{
                        Label("Events", systemImage: "globe.desk")
                    }
            }
        }
    }
}
#Preview {
    StartTab()
        .modelContainer(MeetUp.preview)
}
