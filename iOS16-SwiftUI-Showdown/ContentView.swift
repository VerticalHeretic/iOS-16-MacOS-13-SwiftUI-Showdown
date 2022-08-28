//
//  ContentView.swift
//  iOS16-SwiftUI-Showdown
//
//  Created by Łukasz Stachnik on 27/08/2022.
//

import SwiftUI

enum FeatureType: String, Decodable {
    case charts
    case gauge
}

struct Feature: Identifiable, Hashable, Decodable {
    var id: String = UUID().uuidString
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
                .onOpenURL { url in
                    print("🚀 \(url)")
                    
                    guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return }
                    let query = components.queryItems ?? []
                    let host = components.host
                    let scheme = components.scheme
                    
                    if scheme == "showdownRouting" && host == "feature" {
                        var jsonQuery = query.map { "\"\($0.name)\":\"\($0.value ?? "")\"" }.joined(separator: ",")
                        jsonQuery = "{\(jsonQuery)}"
                        
                        guard let jsonData = jsonQuery.data(using: .utf8) else {
                           return
                        }
                        
                        do {
                            let feature = try JSONDecoder.shared.decode(Feature.self, from: jsonData)
                            viewModel.showFeature(feature)
                        } catch {
                            print(error)
                        }
                    }
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
