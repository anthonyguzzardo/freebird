//
//  StartTab.swift
//  Freebird
//
//  Created by Anthony Guzzardo on 7/8/25.
//

import SwiftUI

struct StartTab : View {
    var body : some View {
        TabView {
            Group {
                MMMap()
                    .tabItem {
                        Label("MeetMateMap", systemImage: "map")
                    }
                EventList()
                    .tabItem{
                        Label("Events", systemImage: "globe.disk")
                    }
            }
        }
    }
}
#Preview {
    StartTab()
        .modelContainer(Event.preview)
}
