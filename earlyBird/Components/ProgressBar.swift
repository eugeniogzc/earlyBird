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
    
    // Add animation state
    @State private var animatedProgress: Double = 0
    
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
                    .trim(from: 0, to: animatedProgress)
                    .stroke(
                        progressColor,
                        style: StrokeStyle(
                            lineWidth: 12,
                            lineCap: .round
                        )
                    )
                    .rotationEffect(.degrees(-90))
                    .animation(.spring(response: 0.6, dampingFraction: 0.8), value: animatedProgress)
                
                Text(centerText)
                    .font(.system(size: 24, weight: .regular))
            }
            .frame(width: 100, height: 100)
            .onAppear {
                // Animate progress when view appears
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    animatedProgress = progress
                }
            }
            
            Spacer()
                .frame(height: 5)
            Text(bottomText)
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(.black)
        }
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
