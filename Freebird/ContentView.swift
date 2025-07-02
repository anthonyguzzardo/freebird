import MapKit
import SwiftUI

struct ContentView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 41.8826, longitude: -87.6298),
        span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
    )

    struct Place: Identifiable {
        let id = UUID()
        let name: String
        let coordinate: CLLocationCoordinate2D
    }

    let locations: [Place] = [
        Place(name: "Wrigley", coordinate: CLLocationCoordinate2D(latitude: 41.948, longitude: -87.6553)),
        Place(name: "Sears", coordinate: CLLocationCoordinate2D(latitude: 41.8789, longitude: -87.6259)),
        Place(name: "Bean", coordinate: CLLocationCoordinate2D(latitude: 41.8826, longitude: -87.6226))
    ]

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations) { location in
            MapAnnotation(coordinate: location.coordinate) {
                VStack {
                    Text(location.name)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        Map(
    }
}

#Preview {
    ContentView()
}
