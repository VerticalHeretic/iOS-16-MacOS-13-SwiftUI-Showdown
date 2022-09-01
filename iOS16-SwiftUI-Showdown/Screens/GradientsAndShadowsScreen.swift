//
//  GradientsAndShadowsScreen.swift
//  iOS16-SwiftUI-Showdown
//
//  Created by Łukasz Stachnik on 01/09/2022.
//

import SwiftUI

struct GradientsAndShadowsScreen: View {
    let feature: Feature
    let colors: [Color] = [.blue, .cyan, .green, .yellow, .orange, .red, .purple]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(Array(zip(colors.indices, colors)), id: \.0) { index, color in
                    if index % 2 == 0 {
                        Rectangle()
                            .fill(color.gradient)
                            .frame(height: 80)
                    } else {
                        Rectangle()
                            .fill(color.shadow(.inner(radius: 4)))
                            .frame(height: 80)
                    }
                }
            }
        }
    }
}

struct GradientsAndShadowsScreen_Previews: PreviewProvider {
    static var previews: some View {
        GradientsAndShadowsScreen(feature: Feature(title: "Gradients and Shadows",
                                                   description: "Gradients and shadows come with minor tweaks and enchances",
                                                   type: .gradientsAndShadows))
    }
}
