//
//  FreebirdApp.swift
//  Freebird
//
//  Created by Anthony Guzzardo on 7/1/25.
//

import SwiftUI
import SwiftData

@main
struct FreebirdApp: App {
    @State private var locationManager = LocationManager()
    @StateObject private var eventStore = MapEventStore()
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(locationManager)
                .environmentObject(eventStore)
        }
        .modelContainer(for: Destination.self)
    }
}
