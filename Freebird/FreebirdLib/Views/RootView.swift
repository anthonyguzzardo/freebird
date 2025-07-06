//
//  RootView.swift
//  Freebird
//
//  Created by Anthony Guzzardo on 7/6/25.
//
import SwiftUI

struct RootView: View {
    @Environment(LocationManager.self) private var locationManager
    @State private var showSplash = true

    var body: some View {
        Group {
            if showSplash {
                LoadApp()
                    .onAppear {
                        // After 2 seconds, hide splash
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                showSplash = false
                            }
                        }
                    }
            } else {
                if locationManager.isAuthorized {
                    FreebirdMap()
                } else {
                    Text("Need to help user")
                }
            }
        }
    }
}

