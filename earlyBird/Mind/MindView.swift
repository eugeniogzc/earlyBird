//
//  MindView.swift
//  earlyBird
//
//  Created by Santo De La Riva on 25/10/24.
//

import SwiftUI


struct MindView: View {
    // Constants for the progress circles
    private let progressColor = "#7EE2E0" // Convert hex to Color

    var body: some View {
        VStack(spacing: 24) {
            // Header section
            WellnessHeader()
                .padding(.top, 16)
            
            // Progress circles grid
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 20) {
                CircleProgressView(
                    progress: 0.56,
                    centerText: "1.4hr",
                    bottomText: "Focus",
                    colorHex: progressColor
                )
                .frame(height: 140)
                
                CircleProgressView(
                    progress: 0.25,
                    centerText: "25%",
                    bottomText: "Stress",
                    colorHex: progressColor
                )
                .frame(height: 140)
                
                CircleProgressView(
                    progress: 0.74,
                    centerText: "7.4",
                    bottomText: "Emotion",
                    colorHex: progressColor
                )
                .frame(height: 140)
                
                CircleProgressView(
                    progress: 0.88,
                    centerText: "8.8",
                    bottomText: "Clarity",
                    colorHex: progressColor
                )
                .frame(height: 140)
            }
            .padding(.horizontal)
            
            // "Sharpen Your Mind" text
            Text("Sharpen Your Mind")
                .font(.system(size: 24, weight: .regular))
                .padding(.top, 8)
            
            // Mindset card
            MindsetCard(
                title: "How To Cultivate",
                subtitle: "A Healthy Mindset"
            )
            .padding(.horizontal)
            
            Spacer()
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.bottom)
    }
}

