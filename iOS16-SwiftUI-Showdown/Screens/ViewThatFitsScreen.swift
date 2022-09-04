//
//  ViewThatFitsScreen.swift
//  iOS16-SwiftUI-Showdown
//
//  Created by Łukasz Stachnik on 04/09/2022.
//

import SwiftUI

struct ViewThatFitsScreen: View {
    var feature: Feature
    @State var height: Double = 500
    
    var body: some View {
        VStack {
            Text(feature.description)
                .font(.footnote)
                .padding()
            
            Image("pizza")
                .resizable()
                .scaledToFill()
                .frame(height: height)
                .onTapGesture {
                    if height == 500 {
                        withAnimation {
                            height = 600
                        }
                    } else {
                        withAnimation {
                            height = 500
                        }
                    }
                }
            
            Text("Photo by Shourav Sheikh from Unslpash")
                .font(.footnote)
            
            ViewThatFits {
                VStack {
                    Button(action: {}) {
                        Text("Buy")
                            .frame(maxWidth: .infinity)
                            .padding()
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.horizontal)
                    
                    Button(action: {}) {
                        Text("Cancel")
                            .frame(maxWidth: .infinity)
                            .padding()
                    }
                    .tint(.gray)
                    .buttonStyle(.borderedProminent)
                    .padding(.horizontal)
                }
                .frame(maxHeight: 200)
                
                HStack {
                    Button(action: {}) {
                        Text("Buy")
                            .frame(maxWidth: .infinity)
                            .padding()
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.leading)
                    
                    Button(action: {}) {
                        Text("Cancel")
                            .frame(maxWidth: .infinity)
                            .padding()
                    }
                    .tint(.gray)
                    .buttonStyle(.borderedProminent)
                    .padding(.trailing)
                }
                .frame(maxHeight: 100)
            }
        }
        .navigationTitle(feature.title)
    }
}

struct ViewThatFitsScreen_Previews: PreviewProvider {
    static var previews: some View {
        ViewThatFitsScreen(feature: Feature(title: "ViewThatFits", description: "Adaptive type of view", type: .viewThatFits))
    }
}
