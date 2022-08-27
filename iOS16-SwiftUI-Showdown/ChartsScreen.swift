//
//  ChartsScreen.swift
//  iOS16-SwiftUI-Showdown
//
//  Created by Łukasz Stachnik on 27/08/2022.
//

import SwiftUI
import Charts

struct Developer: Identifiable {
    let id: UUID = UUID()
    let name: String
    let seniority: Double
}

struct ChartsScreen: View {
    var feature: Feature
    
    @State var team: [Developer] = [
        Developer(name: "Łukasz", seniority: 2.5),
        Developer(name: "Wiktor", seniority: 3.5),
        Developer(name: "Maciek", seniority: 6),
        Developer(name: "Spaghetti", seniority: 6.6),
        Developer(name: "Mateusz", seniority: 4.7),
        Developer(name: "Patryk", seniority: 0.2),
        Developer(name: "Piotrek", seniority: 0.2),
        Developer(name: "Alicja", seniority: 0.2),
        Developer(name: "Kuba", seniority: 0.2),
        Developer(name: "Seba", seniority: 0.2),
        Developer(name: "Damian", seniority: 0.2),
        Developer(name: "Hubert", seniority: 1.3),
        Developer(name: "Kamil", seniority: 10.3),
        Developer(name: "Marcin", seniority: 12.3),
        Developer(name: "Piotr", seniority: 8.25),
        Developer(name: "Rafał S", seniority: 2.9),
        Developer(name: "Miłosz", seniority: 6.3),
        Developer(name: "Rafał", seniority: 6.7),
        Developer(name: "Tomek", seniority: 6.9),
        Developer(name: "Robert", seniority: 6.0)
    ]
    
    var body: some View {
        VStack {
            Text(feature.description)
                .font(.footnote)
                .padding()
                .multilineTextAlignment(.center)
            Spacer()
            
            ScrollView {
                barChart
                
            }
        }
        .navigationTitle(feature.title)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    var barChart: some View {
        VStack {
            Chart(team) {
                BarMark(x: .value("Developer Name", $0.name),
                        y: .value("Developer Seniority", $0.seniority))
                .foregroundStyle(.orange.gradient)
            }
            .frame(height: 400)
            
            HStack {
                Button {
                    withAnimation {
                        team = team.sorted { $0.seniority < $1.seniority }
                    }
                } label: {
                    Text("Sort")
                        .foregroundColor(.white)
                        .padding()
                        .background(.green)
                        .cornerRadius(10)
                }
                
                Button {
                    withAnimation {
                        team = team.shuffled()
                    }
                } label: {
                    Text("Shuffle")
                        .foregroundColor(.white)
                        .padding()
                        .background(.red)
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct ChartsScreen_Previews: PreviewProvider {
    static var previews: some View {
        ChartsScreen(feature: Feature(title: "Charts",
                                      description: "Those are charts which are very crucial part of most technical aplications",
                                      type: .charts))
    }
}
