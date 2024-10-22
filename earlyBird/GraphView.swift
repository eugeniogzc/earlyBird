//
//  GraphView.swift
//  grafico
//
//  Created by Eugenio Garza Cabello on 21/10/24.
//

import SwiftUI
import Charts

struct Info: Identifiable {
    let id: String = UUID().uuidString
    let date: Date
    let views: Int
}

extension Date {
    func last(day: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: -day, to: .now)!
    }
}

let RendimientoModel: [Info] = [
    .init(date: .now.last(day: -1), views: 400),
    .init(date: .now.last(day: -2), views: 300),
    .init(date: .now.last(day: -3), views: 240),
    .init(date: .now.last(day: -4), views: 440),
    .init(date: .now.last(day: -5), views: 700),
    .init(date: .now.last(day: -6), views: 220),
    .init(date: .now.last(day: -7), views: 500),
]

struct GraphView: View {
    var body: some View {
        Text("Rendimiento de La Semana")
            .font(.title2)
            .foregroundColor(.teal)
            .padding()
            

        Chart(RendimientoModel) { data in
            RectangleMark(x: .value("Date", data.date, unit: .day),
                    y: .value("Views", data.views))
            .annotation(position: .top, alignment: .center) {
                Text("\(data.views)")
            }
        }
        .chartXAxis {
            AxisMarks(values: .stride(by: .day)) { day in
                AxisValueLabel()
            }
        }
        .foregroundColor(.cyan)
        .frame(height: 180)
        .frame(width: 380)
    }
}

#Preview {
    GraphView()
}
