//
//  ProgressBarMain.swift
//  earlyBird
//
//  Created by Gabriel Galván on 24/10/24.
//

import SwiftUI

struct CustomProgressBar: View {
    @Binding var progress: Double  // Progress as a value between 0 and 1
    
    var body: some View {
        ZStack {
            // Background Circle (colored backdrop, thicker)
            Circle()
                .stroke(
                    Color(.white),  // Light blue background color
                    lineWidth: 28  // Background line width (slightly thicker)
                )
            
            // Progress Bar (thinner, counterclockwise starting from the top)
            Circle()
                .trim(from: 1 - CGFloat(progress), to: 1)  // Counterclockwise trim
                .stroke(
                    Color(red: 159/255, green: 234/255, blue: 231/255),  // Color #9FEAE7
                    style: StrokeStyle(lineWidth: 20, lineCap: .round)  // Thinner line width for progress bar
                )
                .rotationEffect(Angle(degrees: -90))  // Start from the top (12 o'clock)
                        
            
            // Percentage Text in the center
            Text("\(Int(progress * 100))%")
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 200)  // Adjust as needed
        .animation(.easeInOut(duration: 1), value: progress)  // Smooth transition for progress
    }
}
