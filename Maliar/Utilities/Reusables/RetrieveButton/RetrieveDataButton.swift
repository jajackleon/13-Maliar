//
//  RetrieveDataButton.swift
//  Maliar
//
//  Created by Nicholas on 12/08/21.
//

import SwiftUI

struct RetrieveDataButton: View {
    var clickedAction: () -> ()
    
    var body: some View {
        Button(action: clickedAction) {
            ZStack {
                Color.accentColor
                    .cornerRadius(8)
                Text("Retreive new data")
                    .padding(.all, 4)
                    .foregroundColor(.white)
            }
        }
        .buttonStyle(BorderlessButtonStyle())
    }
}

struct RetrieveDataButton_Previews: PreviewProvider {
    static var previews: some View {
        RetrieveDataButton {
            print("abcde")
        }
    }
}
