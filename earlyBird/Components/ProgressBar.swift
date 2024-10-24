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
        VStack {
            ZStack {
                // Background circle
                Circle()
                    .stroke(
                        progressColor.opacity(0.2),
                        lineWidth: 30  // Increased from 15 to 30
                    )
                
                // Progress circle
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(
                        progressColor,
                        style: StrokeStyle(
                            lineWidth: 30,  // Increased from 15 to 30
                            lineCap: .round
                        )
                    )
                    .rotationEffect(.degrees(-90))
                
                // Center text
                Text(centerText)
                    .font(.system(size: 34, weight: .regular))  // Increased size, changed to regular weight
            }
            .frame(width: 180, height: 180)  // Slightly adjusted size to match proportions
            
            // Bottom text
            Text(bottomText)
                .font(.system(size: 32, weight: .regular))  // Increased size, changed to regular weight
                .padding(.top, 12)
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
            centerText: "10.3hr",
            bottomText: "Sleep",
            colorHex: "#7FDBDA"
        )
    }
}
