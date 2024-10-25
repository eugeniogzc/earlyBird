//
//  SpiritView.swift
//  earlyBird
//
//  Created by Santo De La Riva on 25/10/24.
//

import SwiftUI

struct BodyView: View {
    // Constants for the progress circles
    private let progressColor = "#9AE27E" // Convert hex to Color for the orange theme
    
    var body: some View {
        VStack(spacing: 24) {
            // Header section
            WellnessHeader()
                .padding(.top, 16)
            
            // Progress circles grid - now showing sleep metrics
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 20) {
                // All circles now show sleep data
                CircleProgressView(
                    progress: 0.86, // Assuming 10.3 hours is 86% of desired sleep
                    centerText: "10.3hr",
                    bottomText: "Sleep",
                    colorHex: progressColor
                )
                .frame(height: 140)
                
                CircleProgressView(
                    progress: 0.86,
                    centerText: "10.3hr",
                    bottomText: "Sleep",
                    colorHex: progressColor
                )
                .frame(height: 140)
                
                CircleProgressView(
                    progress: 0.86,
                    centerText: "10.3hr",
                    bottomText: "Sleep",
                    colorHex: progressColor
                )
                .frame(height: 140)
                
                CircleProgressView(
                    progress: 0.86,
                    centerText: "10.3hr",
                    bottomText: "Sleep",
                    colorHex: progressColor
                )
                .frame(height: 140)
            }
            .padding(.horizontal)
            
            // "Fuel Your Spirit" text
            Text("Nourish Your Body")
                .font(.system(size: 24, weight: .regular))
                .padding(.top, 8)
            
            // Spirit Article Card (replacing MindsetCard)
            BodyCard(
                title: "Restfull Sleep",
                subtitle: "In 10 minutes"
            )
            .padding(.horizontal)
            
            Spacer()
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.bottom)
    }
}
