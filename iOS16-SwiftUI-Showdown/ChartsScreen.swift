//
//  ChartsScreen.swift
//  iOS16-SwiftUI-Showdown
//
//  Created by Łukasz Stachnik on 27/08/2022.
//

import SwiftUI

struct ChartsScreen: View {
    var feature: Feature
    
    var body: some View {
        VStack {
            Text(feature.description)
                .font(.footnote)
                .padding()
                .multilineTextAlignment(.center)
            Spacer()
            
        }
        .navigationTitle(feature.title)
    }
}

struct ChartsScreen_Previews: PreviewProvider {
    static var previews: some View {
        ChartsScreen(feature: Feature(title: "Charts",
                                      description: "Those are charts which are very crucial part of most technical aplications",
                                      type: .charts))
    }
}
