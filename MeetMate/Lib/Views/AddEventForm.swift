import SwiftUI
import MapKit
struct FormView: View {
    @State private var title : String = ""
    @State private var eventCategory : MeetCategory = .NULL_VALUE
    @State private var coordinate : Coordinate = Coordinate(0,0)
    @State private var selectedCategory: MeetCategory = .Sport

    
    var body: some View {
        NavigationStack {
            Map(){}
            Form {
                TextField("Title", text: $title)
                    .navigationTitle("Add Event")
                Picker("Category", selection: $selectedCategory) {
                    ForEach(MeetCategory.allCases.filter{ $0 != .NULL_VALUE }, id: \.self) { category in
                        Text(category.displayName).tag(category)
                    }
                }
                .pickerStyle(.menu)
                DatePicker("Date", selection: .constant(Date()))
                
            }
        }

    }
}
#Preview {
    FormView()
}
