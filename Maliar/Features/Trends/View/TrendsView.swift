//
//  TrendsView.swift
//  Maliar
//
//  Created by Nicholas on 28/07/21.
//

import SwiftUI

struct TrendsView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Trends")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.orange)
                Spacer()
                Text("Calendar")
            }
            
            Spacer()
            
            HStack(spacing: 24) {
                GroupBox() {
                    HStack {
                        Spacer()
                        VStack {
                            Text("Animal Overview")
                            Text("Based on the total number of news")
                            AnimalBarChartView()
                        }
                        Spacer()
                    }
                }
//                .frame(maxHeight: 800)
                .aspectRatio(CGSize(width: 1.2, height: 1), contentMode: .fit)
                
                GroupBox() {
                    HStack {
                        Spacer()
                        VStack {
                            Text("Location Overview")
                            Text("Based on the total number of news")
                            LocationBarChartView()
                        }
                        Spacer()
                    }
                    
                }
//                .frame(maxHeight: 800)
                .aspectRatio(CGSize(width: 0.8, height: 1), contentMode: .fit)
            }
            
        }
        .padding(.horizontal, 24.0)
        .padding(.vertical, 27.0)
    }
}

struct TrendsView_Previews: PreviewProvider {
    static var previews: some View {
        TrendsView()
    }
}
