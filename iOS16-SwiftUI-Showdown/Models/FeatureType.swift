//
//  FeatureType.swift
//  iOS16-SwiftUI-Showdown
//
//  Created by Łukasz Stachnik on 01/09/2022.
//

import Foundation

enum FeatureType: String, Decodable {
    case charts
    case gauge
    case gradientsAndShadows
    case share
    case textField
    case grid
    case viewThatFits
    case layout
    case datePicker
}
