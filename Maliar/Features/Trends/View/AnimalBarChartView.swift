//
//  AnimalChartView.swift
//  Maliar
//
//  Created by Daniella Stefani on 05/08/21.
//

import SwiftUI
import Charts

struct AnimalBarChartView: NSViewRepresentable {
    
    let barChart = BarChartView()
//    @StateObject var viewModel = AnimalChartViewModel()
    @ObservedObject var viewModel: TrendsViewModel
    
    func makeNSView(context: Context) -> BarChartView {
        barChart.delegate = context.coordinator
        return barChart
    }
    
    //MARK: Delegate
    class Coordinator: NSObject, ChartViewDelegate {
        let parent: AnimalBarChartView
        init(parent: AnimalBarChartView) {
            self.parent = parent
        }
        
        func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
            parent.viewModel.isAnimalSelected = true
            parent.viewModel.animalSelected = entry.x
            print("\(parent.viewModel.animalSelected)")
        }
        
        func chartValueNothingSelected(_ chartView: ChartViewBase) {
            parent.viewModel.isAnimalSelected = false
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
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
        nsView.highlightPerDragEnabled = false
        
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
        dataSet.colors = [NSColor(.accentColor)]
        dataSet.valueColors = [NSColor(.primary)]
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        dataSet.valueFormatter = DefaultValueFormatter(formatter: formatter)
    }
    
    func formatLeftAxis(leftAxis: YAxis) {
        leftAxis.labelTextColor = NSColor(.primary)
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        leftAxis.valueFormatter = DefaultAxisValueFormatter(formatter: formatter)
        leftAxis.axisMinimum = 0
        leftAxis.drawGridLinesEnabled = false
    }
    
    func formatXAXis(xAxis: XAxis) {
        xAxis.valueFormatter = IndexAxisValueFormatter(values: viewModel.animalNames)
        xAxis.labelPosition = .bottom
        xAxis.labelTextColor = NSColor(.primary)
        xAxis.drawGridLinesEnabled = false
        xAxis.granularity = 1
        xAxis.labelCount = 10
        xAxis.wordWrapEnabled = true
        xAxis.labelRotationAngle = -30
        xAxis.labelRotatedHeight = 2
    }
    
    
    
}
