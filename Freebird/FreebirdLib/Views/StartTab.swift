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
                        Label("Map", systemImage: "map")
                    }
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
