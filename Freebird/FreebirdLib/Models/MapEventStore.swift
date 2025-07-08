//
//  MapEventStore.swift
//  Freebird
//
//  Created by Anthony Guzzardo on 7/7/25.
//

import Foundation
import SwiftUI
import Combine

public class MapEventStore : ObservableObject {
    @Published public var events: [Event] = []
}
