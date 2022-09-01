//
//  Feature.swift
//  iOS16-SwiftUI-Showdown
//
//  Created by Łukasz Stachnik on 01/09/2022.
//

import Foundation

struct Feature: Identifiable, Hashable, Decodable {
    var id: String = UUID().uuidString
    let title: String
    let description: String
    let type: FeatureType
}
