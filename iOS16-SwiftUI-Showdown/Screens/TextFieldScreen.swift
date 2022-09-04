//
//  TextFieldScreen.swift
//  iOS16-SwiftUI-Showdown
//
//  Created by Łukasz Stachnik on 04/09/2022.
//

import SwiftUI

struct TextFieldScreen: View {
    var feature: Feature
    @State var inputText: String = ""
    @State var axis: Axis = .vertical
    var body: some View {
        Form {
            Section("Share Your Feedback 🚀") {
                TextField("Type in your feedback...",
                          text: $inputText,
                          axis: axis) // You can specify in which direction it should resize
                    .lineLimit(5) // You can specify end limit of lines

                TextField("Type in your feedback...",
                          text: $inputText,
                          axis: axis)
                .lineLimit(3...10) // You can specify initial limit of

                // Dynamically changing of the properties works but it is buggy, so do not recommend that
            }
        }
    }
}

struct TextFieldScreen_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldScreen(feature: Feature(title: "TextField", description: "", type: .textField))
    }
}
