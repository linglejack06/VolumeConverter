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
    var outputValue: Double {
        var completeInput: Measurement<UnitVolume>
        switch(selectedInputType) {
            case .liters:
                completeInput = Measurement(value: input, unit: UnitVolume.liters)
            case .milliliters:
                completeInput = Measurement(value: input, unit: UnitVolume.milliliters)
            case .cups:
                completeInput = Measurement(value: input, unit: UnitVolume.cups)
            case .pints:
                completeInput = Measurement(value: input, unit: UnitVolume.pints)
            case .gallons:
                completeInput = Measurement(value: input, unit: UnitVolume.gallons)
        }
        switch(selectedOutputType) {
        case .liters:
            return completeInput.converted(to: UnitVolume.liters).value
        case .milliliters:
            return completeInput.converted(to: UnitVolume.milliliters).value
        case .cups:
            return completeInput.converted(to: UnitVolume.cups).value
        case .pints:
            return completeInput.converted(to: UnitVolume.pints).value
        case .gallons:
            return completeInput.converted(to: UnitVolume.gallons).value
        }
    }
    var body: some View {
        Form {
            Section("Input Value") {
                TextField("Value", value: $input, format: .number)
                Picker("Units", selection: $selectedInputType) {
                    ForEach(Volumes.allCases) {
                        Text($0.rawValue)
                            .tag($0)
                    }
                }.pickerStyle(.segmented)
            }
            Section("Output: \(outputValue.formatted())") {
                Picker("Output units", selection: $selectedOutputType) {
                    ForEach(Volumes.allCases) {
                        Text($0.rawValue)
                            .tag($0)
                    }
                }.pickerStyle(.segmented)
            }
        }
    }
}

#Preview {
    ContentView()
}
