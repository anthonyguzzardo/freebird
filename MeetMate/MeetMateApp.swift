//
//  FreebirdApp.swift
//  Freebird
//
//  Created by Anthony Guzzardo on 7/1/25.
//

import SwiftUI
import SwiftData

@main
struct MeetMateApp: App {
    @State private var locationManager = LocationManager()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(locationManager)
        }
        .modelContainer(for: MeetUp.self)
    }
}
