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
            DatePicker(selection: $startDate, in: ...Date(), displayedComponents: .date) {
                Image(systemName: "calendar")
            }
            .datePickerStyle(StepperFieldDatePickerStyle())
            DatePicker("——", selection: $endDate, in: startDate...Date(), displayedComponents: .date)
                .datePickerStyle(StepperFieldDatePickerStyle())
        }
        .frame(width: 290)
        .foregroundColor(.accentColor)
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
