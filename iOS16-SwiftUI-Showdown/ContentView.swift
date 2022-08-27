//
//  ContentView.swift
//  iOS16-SwiftUI-Showdown
//
//  Created by Łukasz Stachnik on 27/08/2022.
//

import SwiftUI

enum FeatureType: String {
    case charts
    case gauge
}

struct Feature: Identifiable, Hashable {
    let id: UUID = UUID()
    let title: String
    let description: String
    let type: FeatureType
}

final class ContentViewModel: ObservableObject {
    @Published var navigationPath = NavigationPath()

    var features: [Feature] = [
        Feature(title: "Charts 📊",
                      description: "Use a chart to build expressive and dynamic data visualizations inside a SwiftUI view.",
                      type: .charts),
        Feature(title: "Gauge 🔜",
                description: "SwiftUI introduces a new view called Gauge for displaying progress. In the most basic form, a gauge has a default range from 0 to 1.",
                type: .gauge)
    ]

    func showFeature(_ feature: Feature) {
        navigationPath.append(feature)
    }
}

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()

    var body: some View {
        NavigationStack(path: $viewModel.navigationPath) {
            ScrollView {
                LazyVStack(spacing: 8) {
                    ForEach(viewModel.features) { feature in
                        FeatureCell(feature: feature) {
                            viewModel.showFeature(feature)
                        }
                    }
                    .navigationDestination(for: Feature.self) { feature in
                        switch feature.type {
                        case .charts:
                            ChartsScreen(feature: feature)
                        case .gauge:
                            GaugeScreen(feature: feature)
                        }
                    }
                    .navigationTitle("iOS16 Features 🚀")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
