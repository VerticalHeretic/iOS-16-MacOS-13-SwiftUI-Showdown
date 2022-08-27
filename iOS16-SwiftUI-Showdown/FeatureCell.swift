//
//  FeatureCell.swift
//  iOS16-SwiftUI-Showdown
//
//  Created by Łukasz Stachnik on 27/08/2022.
//

import SwiftUI

struct FeatureCell: View {
    var feature: Feature
    var onTap: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading){
                    Text(feature.title)
                        .font(.title)
                    Text(feature.description)
                        .font(.footnote)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .padding()
                    .background(.ultraThinMaterial)
                    .clipShape(Circle())
            }
            Divider()
        }
        .padding()
        .onTapGesture {
            onTap()
        }
    }
}

struct FeatureCell_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCell(feature: Feature(title: "Charts", description: "Those are charts", type: .charts)) {
            
        }
    }
}
