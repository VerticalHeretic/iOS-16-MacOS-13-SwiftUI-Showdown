//
//  TableScreen.swift
//  iOS16-SwiftUI-Showdown
//
//  Created by Łukasz Stachnik on 05/09/2022.
//

import SwiftUI

struct TableScreen: View {
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
        Developer(name: "Robert", seniority: 6.0),
        Developer(name: "Kacper", seniority: 1)
    ]
    
    var body: some View {
        Table(team) {
            TableColumn("Name", value: \.name)
            TableColumn("Seniority:", value: \.seniorityString)
            TableColumn("Title", value: \.seniorityLabel)
        }
    }
}

struct TableScreen_Previews: PreviewProvider {
    static var previews: some View {
        TableScreen(feature: Feature(title: "Table", description: "Table - description", type: .table))
    }
}
