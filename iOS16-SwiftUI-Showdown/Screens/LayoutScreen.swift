//
//  LayoutScreen.swift
//  iOS16-SwiftUI-Showdown
//
//  Created by Łukasz Stachnik on 04/09/2022.
//

import SwiftUI

struct LayoutScreen: View {
    var feature: Feature
    @State private var changeLayout = false
    
    var body: some View {
        let layout = changeLayout ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())
        // there is an error in official apple documentation about definining this as of 04 September 2022
        let layout2 = changeLayout ? AnyLayout(HStackLayout()) : AnyLayout(GridLayout())
        
        ScrollView {
            VStack {
                layout {
                    Image("apple2")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 300, maxHeight: 200)
                        .clipped()
                    
                    Image("apple1")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 300, maxHeight: 200)
                        .clipped()
                }
                .animation(.default, value: changeLayout)
                .onTapGesture {
                    changeLayout.toggle()
                }
                
                layout2 {
                    Image("apple2")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 300, maxHeight: 200)
                        .clipped()
                    
                    Image("apple1")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 300, maxHeight: 200)
                        .clipped()
                    
                    Image("apple1")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 300, maxHeight: 200)
                        .clipped()
                    
                    Image("apple2")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 300, maxHeight: 200)
                        .clipped()
                }
                .animation(.default, value: changeLayout)
                .onTapGesture {
                    changeLayout.toggle()
                }
            }
        }
    }
}

struct LayoutScreen_Previews: PreviewProvider {
    static var previews: some View {
        LayoutScreen(feature: Feature(title: "Layouts", description: "Custom Layouts implementation", type: .layout))
    }
}
