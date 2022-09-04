//
//  ShareLinkScreen.swift
//  iOS16-SwiftUI-Showdown
//
//  Created by Łukasz Stachnik on 04/09/2022.
//

import SwiftUI

struct Progress: Transferable {
    static var transferRepresentation: some TransferRepresentation {
        ProxyRepresentation(exporting: \.image)
    }

    public var image: Image
    public var value: Double
}

struct ShareLinkScreen: View {
    var feature: Feature
    @State var progress: Progress = Progress(image: Image(systemName: "timer"), value: 0.0)
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            Text(feature.description)
                .font(.footnote)
                .padding()
                .multilineTextAlignment(.center)

            ShareLink(item: progress,
                      preview: SharePreview(String(progress.value),
                                            image: progress.image),
                      label: {
                Gauge(value: progress.value) {
                    Text("Task progress")
                        .font(.title)
                }  currentValueLabel: {
                    Text(progress.value.formatted(.percent))
                        .font(.footnote)
                } minimumValueLabel: {
                    Text(0.formatted(.percent))
                        .font(.footnote)
                } maximumValueLabel: {
                    Text(100.formatted(.percent))
                        .font(.footnote)
                }
                .padding()
            })
            .tint(.black)
            .onReceive(timer) { _ in
                if progress.value < 1.0 {
                    withAnimation {
                        progress.value += 0.01
                    }
                }
            }

            ShareLink("Funny link", item: URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ")!)

            Spacer()
        }
        .navigationTitle(feature.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ShareLinkScreen_Previews: PreviewProvider {
    static var previews: some View {
        ShareLinkScreen(feature: Feature(title: "ShareLink", description: "Share", type: .share))
    }
}
