//
//  ContentViewModel.swift
//  iOS16-SwiftUI-Showdown
//
//  Created by Åukasz Stachnik on 01/09/2022.
//

import SwiftUI

final class ContentViewModel: ObservableObject {
    @Published var navigationPath = NavigationPath()

    var features: [Feature] = [
        Feature(title: "Charts ð",
                description: "Use a chart to build expressive and dynamic data visualisations inside a SwiftUI view.",
                type: .charts),
        Feature(title: "Gauge ð",
                description: """
SwiftUI introduces a new view called Gauge for displaying progress.
In the most basic form, a gauge has a default range from 0 to 1.
""",
                type: .gauge),
        Feature(title: "Gradients and Shadows ð¤",
                description: "Gradients and shadows come with minor tweaks and enchances",
                type: .gradientsAndShadows),
        Feature(title: "ShareLink ð«",
                description: "Finally native ShareLink coming to iOS16, no need for UIKit wrapper from now on",
                type: .share),
        Feature(title: "Expandable TextField ð¬",
                description: "Some minor and major improvements to the textField",
                type: .textField),
        Feature(title: "Grid Layout ð±", description: """
SwiftUI 4.0 introduces a new Grid API for composing grid-based layout.
You can arrange the same layout by using VStack and HStact.
The Grid view, however, makes it a lot easier.
""",
                type: .grid),
        Feature(title: "View That Fits ð",
                description: "It's a layout feature that gives you an ability to analyse the space and present best view layout for it",
                type: .viewThatFits),
        Feature(title: "AnyLayout and Layout Protocol ð",
                description: """
The new version of SwiftUI provides AnyLayout and the Layout protocol for developers to create customized and complex layouts.
""",
                type: .layout),
        Feature(title: "Muli Date Picker ð´",
                description: "Calendar picker view where you are able to choose multiple dates",
                type: .datePicker),
        Feature(title: "â¬ï¸ Bottom Sheet",
                description: """
From iOS16+ we have ability to create bottoms sheets with custom sizes and control they appearance programmatically
""",
                type: .bottomSheet),
        Feature(title: "Table â",
                description: "Table implementation working great on iPad and MacoS",
                type: .table),
        Feature(title: "Custom Layout âï¸", description: "The custom layout made using Layout protocol", type: .layout)
    ]

    func showFeature(_ feature: Feature) {
        navigationPath.append(feature)
    }
}
