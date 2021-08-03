//
//  DateSelectorView.swift
//  Maliar
//
//  Created by Nicholas on 02/08/21.
//

import SwiftUI

struct DateSelectorView: View {
    @Binding var startDate: Date
    @Binding var endDate: Date
    
    var body: some View {
        HStack {
            Image(systemName: "calendar")
                .foregroundColor(.accentColor)
            DatePicker("", selection: $startDate, in: ...Date(), displayedComponents: .date)
                .datePickerStyle(StepperFieldDatePickerStyle())
            VStack {
                Divider()
                    .background(Color.accentColor)
            }
            .frame(width: 10)
            DatePicker("", selection: $endDate, in: startDate...Date(), displayedComponents: .date)
                .datePickerStyle(StepperFieldDatePickerStyle())
        }
        .frame(width: 270)
    }
}

struct DateSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        DateSelectorView(startDate: .constant(Date()), endDate: .constant(Date()))
            .previewDisplayName("Date: Light Mode")
            .preferredColorScheme(.light)
        DateSelectorView(startDate: .constant(Date()), endDate: .constant(Date()))
            .previewDisplayName("Date: Dark Mode")
            .preferredColorScheme(.dark)
    }
}
