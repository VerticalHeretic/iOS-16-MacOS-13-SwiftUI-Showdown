//
//  JSONDecoder+Singleton.swift
//  iOS16-SwiftUI-Showdown
//
//  Created by Łukasz Stachnik on 28/08/2022.
//

import Foundation

extension JSONDecoder {
    static var shared: JSONDecoder = {
        let decoder = JSONDecoder()
        return decoder
    }()
}
