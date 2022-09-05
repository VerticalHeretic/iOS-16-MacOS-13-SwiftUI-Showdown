//
//  BottomSheetScreen.swift
//  iOS16-SwiftUI-Showdown
//
//  Created by Łukasz Stachnik on 05/09/2022.
//

import SwiftUI

struct CustomDetent: CustomPresentationDetent {
    
    static func height(in context: Context) -> CGFloat? {
        return 210.37
    }
}

struct BottomSheetScreen: View {
    var feature: Feature
    @State private var showSheet = false
    private let detents: Set<PresentationDetent> = [.medium, .large, .fraction(0.69), .fraction(0.2), .custom(CustomDetent.self) ]
    @State private var selectedDetent: PresentationDetent = .medium
    
    var body: some View {
        Button {
            showSheet.toggle()
        } label: {
            Text("Hello there!")
                .foregroundColor(.white)
                .padding(14)
                .background(.blue.gradient)
                .clipShape(Capsule())
        }
        .sheet(isPresented: $showSheet) {
            Text("Hello there from resizable sheet 🚀")
                .presentationDetents(detents,
                                     selection: $selectedDetent)
        }

    }
}

struct BottomSheetScreen_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetScreen(feature: Feature(title: "Bottom Sheet",
                                           description: "Bottom Sheet - description",
                                           type: .bottomSheet))
    }
}
