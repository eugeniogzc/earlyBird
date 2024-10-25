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
                    progress: 1, // Assuming 10.3 hours is 86% of desired sleep
                    centerText: "3/3",
                    bottomText: "Gratitude",
                    colorHex: progressColor
                )
                .frame(height: 140)
                
                CircleProgressView(
                    progress: 0.50,
                    centerText: "5min",
                    bottomText: "Meditation",
                    colorHex: progressColor
                )
                .frame(height: 140)
                
                CircleProgressView(
                    progress: 0.76,
                    centerText: "1hr",
                    bottomText: "Nature",
                    colorHex: progressColor
                )
                .frame(height: 140)
                
                CircleProgressView(
                    progress: 0.64,
                    centerText: "10p",
                    bottomText: "Reading",
                    colorHex: progressColor
                )
                .frame(height: 140)
            }
            .padding(.horizontal)
            
            // "Fuel Your Spirit" text
            Text("Fuel Your Spirit")
                .font(.system(size: 24, weight: .regular))
                .padding(.top, 8)
            
            NavigationLink(destination: SpiritArticleView(
                            title: "Spiritual Wellness:",
                            subtitle: "A Guide",
                            mainHeading: "Inner Peace & Balance",
                            introduction: "In our fast-paced modern world, finding spiritual balance and inner peace is essential for overall wellbeing. Here are some practical steps to help you cultivate a deeper connection with yourself and enhance your spiritual wellness:",
                            steps: [
                                (
                                    title: "Practice Mindful Meditation:",
                                    description: "Start with just 5-10 minutes of quiet reflection each day, focusing on your breath and being present in the moment."
                                ),
                                (
                                    title: "Connect with Nature:",
                                    description: "Spend time outdoors regularly, whether it's a walk in the park or simply sitting in a garden, to ground yourself and feel connected to the natural world."
                                ),
                                (
                                    title: "Cultivate Gratitude:",
                                    description: "Keep a daily gratitude journal to shift your focus towards the positive aspects of your life and develop a more appreciative mindset."
                                )
                            ]
                        )) {
                            SpiritCard(
                                title: "Spiritual Wellness:",
                                subtitle: "A Guide"
                            )
                            .padding(.horizontal)
                        }
            Spacer()
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.bottom)
    }
}
