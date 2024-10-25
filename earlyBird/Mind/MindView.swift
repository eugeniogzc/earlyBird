//
//  MindView.swift
//  earlyBird
//
//  Created by Santo De La Riva on 25/10/24.
//

import SwiftUI


struct MindView: View {
    @ObservedObject var sectionManager: WellnessSectionManager
    private let progressColor = "#7EE2E0" // Convert hex to Color

    var body: some View {
        VStack(spacing: 24) {
            // Header section
            
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
            
            NavigationLink(destination: ArticleView(
                            title: "How To Cultivate",
                            subtitle: "A Healthy Mindset",
                            mainHeading: "Sleep Like A Baby",
                            introduction: "In Our Fast-Paced World, Falling Asleep Quickly And Getting Quality Rest Can Seem Challenging. However, With The Right Approach, It's Possible To Achieve Restful Sleep In As Little As 10 Minutes. Here Are A Few Techniques To Help You Relax And Drift Off More Efficiently:",
                            steps: [
                                (
                                    title: "Create A Calm Environment:",
                                    description: "Dim The Lights, Reduce Noise, And Make Sure Your Room Is At A Comfortable Temperature."
                                ),
                                (
                                    title: "Practice Deep Breathing:",
                                    description: "Focusing On Slow, Deep Breaths Can Calm Your Nervous System And Prepare Your Body For Rest."
                                ),
                                (
                                    title: "Use Progressive Muscle Relaxation:",
                                    description: "Tense And Relax Different Muscle Groups To Release Tension And Promote Physical Relaxation."
                                )
                            ]
                        )) {
                            MindsetCard(
                                title: "How To Cultivate",
                                subtitle: "A Healthy Mindset"
                            )
                            .padding(.horizontal)
                        }
            
            Spacer()
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.bottom)
    }
}

