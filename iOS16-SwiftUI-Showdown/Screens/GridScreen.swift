//
//  GridScreen.swift
//  iOS16-SwiftUI-Showdown
//
//  Created by Łukasz Stachnik on 04/09/2022.
//

import SwiftUI

struct GridScreen: View {
    var feature: Feature
    
    var body: some View {
        VStack {
            Text(feature.description)
                .font(.footnote)
                .padding()
            
            Spacer()
            
            Grid {
                GridRow {
                    getCharacterView(character: "🙈", .red)
                    getCharacterView(character: "🐍", .orange)
                }
                
                GridRow {
                    getCharacterView(character: "🚀")
                    
                    Grid {
                        GridRow {
                            getCharacterView(character: "💾", .blue)
                            getCharacterView(character: "🏃🏻")
                        }
                        
                        GridRow {
                            getCharacterView(character: "💾", .indigo)
                            getCharacterView(character: "🏃🏻")
                        }
                    }
                }
                
                GridRow {
                    getCharacterView(character: "🦋", .green)
                        .gridCellColumns(2)
                }
            }
        }
    }
    
    @ViewBuilder func getCharacterView(character: String, _ color: Color = .purple) -> some View {
        Text(character)
            .frame(maxWidth: .infinity)
            .padding()
            .background(color.gradient.shadow(.inner(radius: 10)))
            .cornerRadius(10)
            .padding(2)
    }
}

struct GridScreen_Previews: PreviewProvider {
    static var previews: some View {
        GridScreen(feature: Feature(title: "Grid", description: "", type: .grid))
    }
}
