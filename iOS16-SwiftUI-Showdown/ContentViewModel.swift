//
//  ContentViewModel.swift
//  iOS16-SwiftUI-Showdown
//
//  Created by Łukasz Stachnik on 01/09/2022.
//

import SwiftUI

final class ContentViewModel: ObservableObject {
    @Published var navigationPath = NavigationPath()

    var features: [Feature] = [
        Feature(title: "Charts 📊",
                description: "Use a chart to build expressive and dynamic data visualizations inside a SwiftUI view.",
                type: .charts),
        Feature(title: "Gauge 🔜",
                description: """
SwiftUI introduces a new view called Gauge for displaying progress.
In the most basic form, a gauge has a default range from 0 to 1.
""",
                type: .gauge),
        Feature(title: "Gradients and Shadows 👤",
                description: "Gradients and shadows come with minor tweaks and enchances",
                type: .gradientsAndShadows),
        Feature(title: "ShareLink 🛫",
                description: "Finally native ShareLink coming to iOS16, no need for UIKit wrapper from now on",
                type: .share),
        Feature(title: "Expandable TextField 💬",
                description: "Some minor and major improvements to the textField",
                type: .textField),
        Feature(title: "Grid Layout 📱", description: """
SwiftUI 4.0 introduces a new Grid API for composing grid-based layout.
You can arrange the same layout by using VStack and HStact.
The Grid view, however, makes it a lot easier.
""",
                type: .grid),
        Feature(title: "View That Fits 🍕",
                description: "It's a layout feature that gives you an ability to analyse the space and present best view layout for it",
                type: .viewThatFits)
        
    ]

    func showFeature(_ feature: Feature) {
        navigationPath.append(feature)
    }
}
