//
//  MeetUpCardOverlay.swift
//  Freebird
//
//  Created by Anthony Guzzardo on 7/9/25.
//

import SwiftUI
import MapKit

public struct MeetUpCardOverlay: View {
    let region: MKCoordinateRegion
    @State private var scale: CGFloat = 0.1
    public var body: some View {
        ZStack {
            // The card itself
            VStack(spacing: 8) {
                Text("Selected Region")
                    .font(.headline)
                    .bold()

                VStack(alignment: .leading, spacing: 4) {
                    Text("Latitude: \(region.center.latitude)")
                        .font(.headline)
                        .bold()
                    Text("Longitude: \(region.center.longitude)")
                        .font(.headline)
                        .bold()
                }
                .foregroundColor(.secondary)

                Button(action: {
                    // Action here
                }) {
                    Text("Add MeetUp")
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.accentColor)
                        )
                }

            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(radius: 8)
            )
            .padding(.top, 32) // make space at the top for the circle

            // The floating icon in front
            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: 60, height: 60)
                    .shadow(radius: 4)

                Image("MeetMateIconPng")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
            }
            .offset(y: -68) // pull it up to sit over the cardbs
            
            Image(systemName: "mappin.circle.fill")
                .font(.system(size: 40))
                .foregroundColor(.black)
                .offset(y: 90)
        }
        
        .padding(.bottom, 60)
        .offset(y: -80)
        .scaleEffect(scale)
        .onAppear {
            withAnimation(
                .spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0)
            ) {
                scale = 1.0
            }
        }
                
    }
}
