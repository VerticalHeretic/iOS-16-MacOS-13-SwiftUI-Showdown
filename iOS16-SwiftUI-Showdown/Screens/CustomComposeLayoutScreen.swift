//
//  CustomComposeLayoutScreen.swift
//  iOS16-SwiftUI-Showdown
//
//  Created by Łukasz Stachnik on 14/09/2022.
//

import SwiftUI

struct Pet: Identifiable, Equatable {
    let type: String
    let icon: String
    var votes = 0
    var id: String { type }
}

struct CustomComposeLayoutScreen: View {
    @State var pets: [Pet] = [Pet(type: "Dog", icon: "🐶", votes: 3),
                              Pet(type: "Cat", icon: "😼", votes: 4),
                              Pet(type: "Spider", icon: "🕷", votes: 2),
                              Pet(type: "Hawk", icon: "🦅", votes: 1),
                              Pet(type: "Fish", icon: "🐠", votes: 1),
                              Pet(type: "Turtle", icon: "🐢", votes: 1),
                              Pet(type: "Dino", icon: "🦖", votes: 1),
                              Pet(type: "Monkey", icon: "🐒", votes: 1)] {
        didSet {
            totalVotes = pets.reduce(.zero) { count, pets in
                count + pets.votes
            }
        }
    }
    @State var totalVotes = 0
    
    var body: some View {
        ScrollView {
            VStack {
                RadialLayout {
                    ForEach(pets) { pet in
                        Text(pet.icon)
                            .padding(20)
                            .background(.green)
                            .clipShape(Circle())
                            .onTapGesture {
                                pets.shuffle()
                            }
                    }
                }
                .frame(height: 500)
                leaderBoard
                buttons
            }
        }
        .onAppear {
            totalVotes = pets.reduce(.zero) { count, pets in
                count + pets.votes
            }
        }
        .animation(.default, value: pets)
    }
    
    var leaderBoard: some View {
        Grid(alignment: .leading) {
            ForEach(pets) { pet in
                GridRow {
                    Text(pet.type)
                        .bold()
                    
                    ProgressView(value: Double(pet.votes),
                                 total: Double(totalVotes))
                    .progressViewStyle(.linear)
                    
                    Text("\(pet.votes)")
                        .gridColumnAlignment(.trailing)
                }
                Divider()
            }
        }
    }

    var buttons: some View {
        ViewThatFits {
            EqualWidthHStack {
                Buttons(pets: $pets)
            }
            EqualWidthVStack {
                Buttons(pets: $pets)
            }
        }
//        .environment(\.dynamicTypeSize, .accessibility1)
    }
}

struct Buttons: View {
    @Binding var pets: [Pet]
    
    var body: some View {
        ForEach($pets) { $pet in
            Button {
                pet.votes += 1
                pets = pets.sorted(by: { $0.votes > $1.votes })
            } label: {
                Text(pet.type)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.bordered)
        }
    }
}

struct CustomComposeLayoutScreen_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposeLayoutScreen()
    }
}
