//
//  FreebirdApp.swift
//  Freebird
//
//  Created by Anthony Guzzardo on 7/1/25.
//

import SwiftUI
@main
struct FreebirdApp: App {
    @State private var locationManager = LocationManager()
    var body: some Scene {
        WindowGroup {
            if locationManager.isAuthorized{
                ActionBar()
            } else {
                Text("Need to help user")
            }
            FreebirdMap()
        }
    }
}
