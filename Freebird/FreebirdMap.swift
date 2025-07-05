//
//  ContentView.swift
//  Freebird
//
//  Created by Anthony Guzzardo on 7/1/25.
//
import CoreLocation
import MapKit
import SwiftUI
import SwiftData

struct FreebirdMap: View {
    
    let manager = CLLocationManager()
    @State private var cameraPosition : MapCameraPosition = .userLocation(fallback: .automatic)
    
    var body: some View {
        Map(position: $cameraPosition){
            UserAnnotation()// displays users location
        }
        .mapControls{
            MapUserLocationButton() // tap to snap back to location
        }
        .onAppear{
            manager.requestWhenInUseAuthorization()
        }
    }
}

#Preview {
    FreebirdMap()
}

//final class CurrentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{
//    var locationManager : CLLocationManager?
//    
//    func checkIfLocationServicesEnabled() {
//        if CLLocationManager.locationServicesEnabled() {
//            locationManager = CLLocationManager()
//            locationManager!.delegate = self // force is fine because we create line above
//            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
//            
//        } else {
//            print("Location services are disabled, enable to allow application to determine your location")
//        }
//    }
//    private func checkLocationAuthorizationStatus() {
//        guard let locationManager = locationManager else { return }
//        
//        let status = locationManager.authorizationStatus
//        
//        switch (status){
//                
//        case .notDetermined:
//            locationManager.requestWhenInUseAuthorization()
//        case .denied:
//            print("Location services in application are denied, fix in settings") // add button to settings
//        case .restricted:
//            print("Your location is restricted fix in settings")
//        case .authorizedWhenInUse:
//            locationManager.startUpdatingLocation()
//        case .authorizedAlways:
//            break
//        @unknown default:
//            break
//        }
//    }
//    
//    /// If user changes locations settings outside of application
//    /// This is a delegate method you must set the delegate
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//        checkLocationAuthorizationStatus()
//    }
//
//}
