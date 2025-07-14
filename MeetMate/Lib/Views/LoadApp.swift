//
//  LoadPage.swift
//  Freebird
//
//  Created by Anthony Guzzardo on 7/6/25.
//
import SwiftData
import SwiftUI

struct LoadApp: View {
    @State private var isActive = true
    
    var body: some View {
        if isActive {
            // Replace `MainContentView()` with your actual main view
            let container = MeetUp.preview
            let fetchDescriptor = FetchDescriptor<MeetUp>()
            let meetUp = try! container.mainContext.fetch(fetchDescriptor)[0]
            MeetUpMap(meetUp: meetUp)
        } else {
            VStack {
                Spacer()
                
                // Example: Your App Logo
                Image("MeetMateIcon")
                    .resizable()
                    .frame(width: 220, height: 220)
                    .foregroundColor(.yellow)
                
                
                Spacer()
                
                // Loading Indicator
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                    .scaleEffect(1.2)
                    .padding(.bottom, 40)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemBackground))
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                // Simulate loading delay (e.g., 2 seconds)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}
