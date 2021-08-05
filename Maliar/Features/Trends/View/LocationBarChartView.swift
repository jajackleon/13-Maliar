//
//  AnimalBarChartView.swift
//  Maliar
//
//  Created by Daniella Stefani on 05/08/21.
//

import SwiftUI
import Charts

struct LocationBarChartView: NSViewRepresentable {
    @StateObject var viewModel = LocationChartViewModel()
    
    func makeNSView(context: Context) -> HorizontalBarChartView {
        return HorizontalBarChartView()
    }
    
    func updateNSView(_ nsView: HorizontalBarChartView, context: Context) {
        let dataSet = BarChartDataSet(entries: viewModel.locationList)
        dataSet.label = "Location"
        nsView.noDataText = "No Data"
        nsView.data = BarChartData(dataSet: dataSet)
        
        //Custom Chart Functions
        nsView.scaleXEnabled = false
        nsView.scaleYEnabled = false
        nsView.legend.enabled = false
        nsView.highlightPerTapEnabled = false
        
        //Chart Formatting
        nsView.barData?.barWidth = 0.5
        nsView.zoom(scaleX: 0.5, scaleY: 1, x: 0, y: 0)
        
        formatDataSet(dataSet: dataSet)
        formatRightAxis(rightAxis: nsView.rightAxis)
        formatLeftAxis(leftAxis: nsView.leftAxis)
        formatXAxis(xAxis: nsView.xAxis)
        
        nsView.notifyDataSetChanged()
    }
    
    func formatDataSet(dataSet: BarChartDataSet) {
        dataSet.colors = [.orange]
        dataSet.valueColors = [.black]
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        dataSet.valueFormatter = DefaultValueFormatter(formatter: formatter)
    }
    
    func formatRightAxis(rightAxis: YAxis) {
        rightAxis.labelTextColor = .black
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        rightAxis.valueFormatter = DefaultAxisValueFormatter(formatter: formatter)
        rightAxis.axisMinimum = 0
        rightAxis.drawGridLinesEnabled = false
    }
    
    func formatLeftAxis(leftAxis: YAxis) {
        leftAxis.enabled = false
        leftAxis.axisMinimum = 0
    }
    
    func formatXAxis (xAxis: XAxis) {
        xAxis.valueFormatter = IndexAxisValueFormatter(values: LocationTrends.locations)
        xAxis.labelPosition = .bottom
        xAxis.labelTextColor = .black
        xAxis.drawGridLinesEnabled = false
        xAxis.granularity = 1
        xAxis.labelCount = 12
        xAxis.wordWrapEnabled = true
    }
    
    
}