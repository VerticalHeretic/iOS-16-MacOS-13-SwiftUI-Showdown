//
//  MultidatePickerScreen.swift
//  iOS16-SwiftUI-Showdown
//
//  Created by Łukasz Stachnik on 05/09/2022.
//

import SwiftUI

struct MultidatePickerScreen: View {
    var feature: Feature
    
    @State private var selectedDates = Set<DateComponents>()
    @State private var showPicker = false
    
    var body: some View {
        VStack {
            ForEach(selectedDates.map { DateFormatter.localizedString(from: $0.date ?? Date(), dateStyle: .long, timeStyle: .none)}, id: \.self) { date in
                Text(date)
                    .bold()
            }
            
            Button {
                withAnimation {
                    showPicker.toggle()
                }
            } label: {
                Text("Pick days")
                    .foregroundColor(.white)
                    .bold()
                    .padding(16)
                    .background(.blue.gradient)
                    .clipShape(Capsule())
            }

            Spacer()
            
            if showPicker {
                MultiDatePicker("Choose your meal dates", selection: $selectedDates)
                    .frame(maxHeight: 300)
                    .transition(.move(edge: .bottom))
            }
        }
    }
}

struct MultidatePickerScreen_Previews: PreviewProvider {
    static var previews: some View {
        MultidatePickerScreen(feature: Feature(title: "Picker",
                                               description: "Let's you choose multiple dates",
                                               type: .datePicker))
    }
}
