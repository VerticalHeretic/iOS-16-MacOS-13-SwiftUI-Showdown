//
//  GaugeScreen.swift
//  iOS16-SwiftUI-Showdown
//
//  Created by Łukasz Stachnik on 27/08/2022.
//

import SwiftUI

struct GaugeScreen: View {
    var feature: Feature
    @State private var progress: Double = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            Text(feature.description)
                .font(.footnote)
                .padding()
                .multilineTextAlignment(.center)

            Gauge(value: progress) {
                Text("Task progress")
                    .font(.title)
            }  currentValueLabel: {
                Text(progress.formatted(.percent))
                    .font(.footnote)
            } minimumValueLabel: {
                Text(0.formatted(.percent))
                    .font(.footnote)
            } maximumValueLabel: {
                Text(100.formatted(.percent))
                    .font(.footnote)
            }
            .padding()

            Gauge(value: progress) {
                Text("Status")
                    .font(.footnote)
            } currentValueLabel: {
                Text(progress.formatted(.percent))
                    .font(.footnote)
            }
            .padding()
            .gaugeStyle(.accessoryCircularCapacity)
            .tint(.orange)

            Gauge(value: progress) {
                Text("Status")
                    .font(.footnote)
            } currentValueLabel: {
                Text(progress.formatted(.percent))
                    .font(.footnote)
            }
            .scaleEffect(2.0)
            // To make the circular ones bigger you need to use scaleEffect and for the linear frame will be sufficient
            .padding()
            .gaugeStyle(.accessoryCircular)
            .tint(.indigo)

            Gauge(value: progress) {
                Text("Status")
                    .font(.footnote)
            } currentValueLabel: {
                Text(progress.formatted(.percent))
                    .font(.footnote)
            }
            .padding()
            .gaugeStyle(.accessoryLinearCapacity)
            .tint(.pink)

            Spacer()

        }
        .onReceive(timer) { _ in
            if progress < 1.0 {
                withAnimation {
                    progress += 0.025
                }
            }
        }
        .navigationTitle(feature.title)
    }
}

struct GaugeScreen_Previews: PreviewProvider {
    static var previews: some View {
        GaugeScreen(feature: Feature(title: "Gauge 🔜",
                                      description: """
SwiftUI introduces a new view called Gauge for displaying progress.
In the most basic form, a gauge has a default range from 0 to 1.
""",
                                      type: .gauge))
    }
}
