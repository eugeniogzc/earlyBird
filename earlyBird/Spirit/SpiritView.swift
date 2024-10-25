//
//  SpiritView.swift
//  earlyBird
//
//  Created by Santo De La Riva on 25/10/24.
//

import SwiftUI

struct SpiritView: View {
    @ObservedObject var sectionManager: WellnessSectionManager
    private let progressColor = "#F8A468" // Convert hex to Color for the orange theme
    
    var body: some View {
        VStack(spacing: 24) {
            // Header section
        
            
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
            Text("Fuel Your Spirit")
                .font(.system(size: 24, weight: .regular))
                .padding(.top, 8)
            
            // Spirit Article Card (replacing MindsetCard)
            SpiritCard(
                title: "Spiritual Wellness:",
                subtitle: "A Guide"
            )
            .padding(.horizontal)
            
            Spacer()
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.bottom)
    }
}
