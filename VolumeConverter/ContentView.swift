//
//  ContentView.swift
//  VolumeConverter
//
//  Created by Jack Lingle on 11/18/23.
//

import SwiftUI

struct ContentView: View {
    enum Volumes: String, CaseIterable, Identifiable {
        var id: String { UUID().uuidString }
        case milliliters = "milliliters"
        case liters = "liters"
        case cups = "cups"
        case pints = "pints"
        case gallons = "gallons"
    }
    @State private var selectedInputType: Volumes = .liters
    @State private var selectedOutputType: Volumes = .milliliters
    @State private var input = 0.0
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            ForEach(Volumes.allCases, id: \.id) { volume in
                Text(volume.rawValue)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
