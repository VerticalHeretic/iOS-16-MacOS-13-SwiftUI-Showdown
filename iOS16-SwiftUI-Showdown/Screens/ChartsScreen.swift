//
//  ChartsScreen.swift
//  iOS16-SwiftUI-Showdown
//
//  Created by Łukasz Stachnik on 27/08/2022.
//

import SwiftUI
import Charts

struct Developer: Identifiable {
    let id = UUID()
    let name: String
    let seniority: Double
    
    var seniorityLabel: String {
        if seniority > 6 {
            return "Senior iOS Developer 🚀"
        } else if seniority > 2 {
            return "Mid iOS Developer 🍎"
        } else if seniority > 0.5 {
            return "Junior iOS Developer 💾"
        } else {
            return "iOS Developer Intern 📚"
        }
    }
    
    var seniorityString: String {
        String(seniority.rounded())
    }
}

struct Score: Identifiable {
    let id = UUID()
    let date: Date
    let value: Double
}

final class ChartsViewModel: ObservableObject {
    
    @Published var team: [Developer] = [
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

    @Published var scoresA: [Score] = [
        Score(date: Calendar.current.date(byAdding: .day, value: 0, to: Date())!, value: 21),
        Score(date: Calendar.current.date(byAdding: .day, value: 1, to: Date())!, value: 37),
        Score(date: Calendar.current.date(byAdding: .day, value: 2, to: Date())!, value: 69),
        Score(date: Calendar.current.date(byAdding: .day, value: 3, to: Date())!, value: 211),
        Score(date: Calendar.current.date(byAdding: .day, value: 4, to: Date())!, value: 2137)
    ]

    @Published var scoresB: [Score] = [
        Score(date: Calendar.current.date(byAdding: .day, value: 0, to: Date())!, value: 21),
        Score(date: Calendar.current.date(byAdding: .day, value: 2, to: Date())!, value: 1111),
        Score(date: Calendar.current.date(byAdding: .day, value: 4, to: Date())!, value: 233),
        Score(date: Calendar.current.date(byAdding: .day, value: 5, to: Date())!, value: 2111),
        Score(date: Calendar.current.date(byAdding: .day, value: 8, to: Date())!, value: 444)
    ]
}

// A lot about charts can be found in documentation, for samples search for keyword `Mark`
struct ChartsScreen: View {
    var feature: Feature
    @Binding var navigationPath: NavigationPath
    @StateObject var viewModel = ChartsViewModel()

    var body: some View {
        VStack {
            Text(feature.description)
                .font(.footnote)
                .padding()
                .multilineTextAlignment(.center)
                .onTapGesture {
                    navigationPath.removeLast(navigationPath.count)
                }

            Spacer()

            HStack {
                Button {
                    withAnimation {
                        viewModel.team = viewModel.team.sorted { $0.seniority < $1.seniority }
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
                        viewModel.team = viewModel.team.shuffled()
                    }
                } label: {
                    Text("Shuffle")
                        .foregroundColor(.white)
                        .padding()
                        .background(.red)
                        .cornerRadius(10)
                }
            }

            ScrollView {
                barChart
                lineChart
                areaChart
            }
        }
        .navigationTitle(feature.title)
    }

    var lineChart: some View {
        Chart {
            ForEach(viewModel.scoresA) {
                LineMark(x: .value("Date", $0.date),
                         y: .value("Score", $0.value))
                .foregroundStyle(.orange)
                .interpolationMethod(.stepStart)
            }
//            This is not working as in documentation :/
//            ForEach(viewModel.scoresB) {
//                LineMark(x: .value("Date", $0.date),
//                         y: .value("Score B", $0.value))
//                .foregroundStyle(.red)
//            }

            RuleMark(
                y: .value("Mid Threshold", 1000)
            )
            .foregroundStyle(.green)

            RuleMark(
                y: .value("Pro Threshold", 2000)
            )
            .foregroundStyle(.yellow)
        }
        .frame(height: 400)
    }

    var barChart: some View {
        Chart(viewModel.team) {
            BarMark(x: .value("Developer Name", $0.name),
                    y: .value("Developer Seniority", $0.seniority))
            .foregroundStyle(.orange.gradient)
        }
        .frame(height: 400)
    }

    var areaChart: some View {
        Chart(viewModel.scoresA) {
            AreaMark(x: .value("Date", $0.date),
                     y: .value("Score", $0.value))
            .foregroundStyle(.green.gradient)
        }
        .frame(height: 400)
    }
}

struct ChartsScreen_Previews: PreviewProvider {
    @State static var path = NavigationPath()
    static var previews: some View {
        ChartsScreen(feature: Feature(title: "Charts",
                                      description: """
Those are charts which are very crucial part of most technical aplications
""",
                                      type: .charts),
                     navigationPath: $path)
    }
}
