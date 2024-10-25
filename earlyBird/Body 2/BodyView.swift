//
//  SpiritView.swift
//  earlyBird
//
//  Created by Santo De La Riva on 25/10/24.
//

import SwiftUI

struct BodyView: View {
    @ObservedObject var sectionManager: WellnessSectionManager
    private let progressColor = "#9AE27E" // Convert hex to Color for the orange theme
    
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
            Text("Nourish Your Body")
                .font(.system(size: 24, weight: .regular))
                .padding(.top, 8)
            
            // Spirit Article Card (replacing MindsetCard)
            NavigationLink(destination: BodyArticleView(
                            title: "Restful Sleep",
                            subtitle: "In 10 Minutes",
                            mainHeading: "Better Sleep Habits",
                            introduction: "Getting quality sleep is crucial for your physical and mental well-being. Here are some proven techniques to help you fall asleep faster and enjoy more restful nights:",
                            steps: [
                                (
                                    title: "Create a Bedtime Routine:",
                                    description: "Establish a consistent schedule and relaxing activities to signal to your body that it's time to wind down for sleep."
                                ),
                                (
                                    title: "Optimize Your Sleep Environment:",
                                    description: "Keep your bedroom cool, dark, and quiet. Consider using blackout curtains or white noise if needed."
                                ),
                                (
                                    title: "Practice Relaxation Techniques:",
                                    description: "Try deep breathing exercises, progressive muscle relaxation, or gentle stretching to help your body and mind prepare for rest."
                                )
                            ]
                        )) {
                            BodyCard(
                                title: "Restful Sleep",
                                subtitle: "In 10 minutes"
                            )
                            .padding(.horizontal)
                        }
            
            Spacer()
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.bottom)
    }
}
