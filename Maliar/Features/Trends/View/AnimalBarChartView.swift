//
//  AnimalChartView.swift
//  Maliar
//
//  Created by Daniella Stefani on 05/08/21.
//

import SwiftUI
import Charts

struct AnimalBarChartView: NSViewRepresentable {
    
    @StateObject var viewModel = AnimalChartViewModel()
    
    func makeNSView(context: Context) -> BarChartView {
        return BarChartView()
    }
    
    func updateNSView(_ nsView: BarChartView, context: Context) {
        let dataSet = BarChartDataSet(entries: viewModel.animalList)
        dataSet.label = "Animal"
        nsView.noDataText = "No Data"
        nsView.data = BarChartData(dataSet: dataSet)
        
        //Custom Chart Functions
        nsView.rightAxis.enabled = false
        nsView.scaleXEnabled = false
        nsView.scaleYEnabled = false
        nsView.legend.enabled = false
        
        //Chart Formatting
        nsView.barData?.barWidth = 0.5
        nsView.zoom (scaleX: 0.5, scaleY: 1, x: 0, y: 0)
        formatDataSet(dataSet: dataSet)
        formatLeftAxis(leftAxis: nsView.leftAxis)
        formatXAXis(xAxis: nsView.xAxis)
        
        nsView.notifyDataSetChanged()
    }
    
    //MARK: Format Chart
    func formatDataSet(dataSet: BarChartDataSet) {
        dataSet.colors = [.orange]
        dataSet.valueColors = [.black]
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        dataSet.valueFormatter = DefaultValueFormatter(formatter: formatter)
    }
    
    func formatLeftAxis(leftAxis: YAxis) {
        leftAxis.labelTextColor = .black
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        leftAxis.valueFormatter = DefaultAxisValueFormatter(formatter: formatter)
        leftAxis.axisMinimum = 0
        leftAxis.drawGridLinesEnabled = false
    }
    
    func formatXAXis(xAxis: XAxis) {
        xAxis.valueFormatter = IndexAxisValueFormatter(values: AnimalTrends.animals)
        xAxis.labelPosition = .bottom
        xAxis.labelTextColor = .black
        xAxis.drawGridLinesEnabled = false
        xAxis.granularity = 1
        xAxis.labelCount = 12
        xAxis.wordWrapEnabled = true
    }
}
