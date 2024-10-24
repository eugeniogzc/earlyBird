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
            // Background Circle
            Circle()
                .stroke(lineWidth: 15)
                .opacity(0.2)
                .foregroundColor(Color.white)
            
            // Progress Bar (Counterclockwise, starting from top)
            Circle()
                .trim(from: 1 - CGFloat(progress), to: 1)  // Inverted to fill counterclockwise
                .stroke(
                    AngularGradient(gradient: Gradient(colors: [Color.white]), center: .center),
                    style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round)
                )
                .rotationEffect(Angle(degrees: -90))  // Start from the top (12 o'clock)
                    
                
            
            // Percentage Text in the center
            Text("\(Int(progress * 100))%")
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(.white)
        }
        .frame(width: 150, height: 150)  // Adjust as needed
    }
}

