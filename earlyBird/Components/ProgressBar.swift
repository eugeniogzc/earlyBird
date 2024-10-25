//
//  ProgressBar.swift
//  earlyBird
//
//  Created by Santiago De La Riva on 24/10/24.
//

import SwiftUI

struct CircleProgressView: View {
    let progress: Double
    let centerText: String
    let bottomText: String
    let progressColor: Color
    
    init(progress: Double, centerText: String, bottomText: String, colorHex: String) {
        self.progress = progress
        self.centerText = centerText
        self.bottomText = bottomText
        self.progressColor = Color(hex: colorHex) ?? .blue
    }
    
    var body: some View {
        VStack(spacing: 4) {
            ZStack {
                Circle()
                    .stroke(
                        progressColor.opacity(0.2),
                        lineWidth: 12
                    )
                
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(
                        progressColor,
                        style: StrokeStyle(
                            lineWidth: 12,
                            lineCap: .round
                        )
                    )
                    .rotationEffect(.degrees(-90))
                
                Text(centerText)
                    .font(.system(size: 24, weight: .regular))
            }
            .frame(width: 100, height: 100)
            
            Spacer()
                    .frame(height: 5)
            Text(bottomText)
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(.black)
        }
    }
}

extension Color {
    init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else {
            return nil
        }
        
        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}

struct CircleProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircleProgressView(
            progress: 0.75,
            centerText: "1.4hr",
            bottomText: "Sleep",
            colorHex: "#7FDBDA"
        )
    }
}
