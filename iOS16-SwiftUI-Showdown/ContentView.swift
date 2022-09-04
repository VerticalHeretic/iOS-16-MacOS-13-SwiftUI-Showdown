//
//  ContentView.swift
//  iOS16-SwiftUI-Showdown
//
//  Created by Łukasz Stachnik on 27/08/2022.
//

import SwiftUI

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
                            ChartsScreen(feature: feature, navigationPath: $viewModel.navigationPath)
                        case .gauge:
                            GaugeScreen(feature: feature)
                        case .gradientsAndShadows:
                            GradientsAndShadowsScreen(feature: feature)
                        case .share:
                            ShareLinkScreen(feature: feature)
                        case .textField:
                            TextFieldScreen(feature: feature)
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
