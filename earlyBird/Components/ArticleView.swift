//
//  ArticleView.swift
//  earlyBird
//
//  Created by Santo De La Riva on 24/10/24.
//

import SwiftUI

struct ArticleView: View {
    let title: String
    let subtitle: String
    let mainHeading: String
    let introduction: String
    let steps: [(title: String, description: String)]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Top card section that extends to the top of the screen
                MindsetCardArticle(
                    title: title,
                    subtitle: subtitle
                )
                .ignoresSafeArea(.container, edges: .top)
                
                // Content section with white background
                VStack(alignment: .leading, spacing: 24) {
                    // Heading with blue accent line
                    HStack(spacing: 16) {
                        Rectangle()
                            .fill(Color.blue.opacity(0.3))
                            .frame(width: 4, height: 24)
                        
                        Text(mainHeading)
                            .font(.system(size: 28, weight: .bold))
                    }
                    
                    Text(introduction)
                        .font(.system(size: 16))
                        .foregroundColor(.secondary)
                        .lineSpacing(4)
                    
                    // Steps
                    VStack(alignment: .leading, spacing: 16) {
                        ForEach(Array(steps.enumerated()), id: \.offset) { index, step in
                            HStack(alignment: .top, spacing: 12) {
                                Text("\(index + 1).")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(.secondary)
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(step.title)
                                        .font(.system(size: 16, weight: .semibold))
                                    
                                    Text(step.description)
                                        .font(.system(size: 16))
                                        .foregroundColor(.secondary)
                                        .lineSpacing(4)
                                }
                            }
                        }
                    }
                }
                .padding(24)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .padding(.horizontal)
                .offset(y: -24) // Overlap with the card above
            }
        }
        .background(Color(.systemBackground))
        .edgesIgnoringSafeArea(.top)
    }
}

// Update MindsetCard to be full-width at the top
struct MindsetCardArticle: View {
    let title: String
    let subtitle: String
    let gradientStartColor: Color
    let gradientEndColor: Color
    
    init(
        title: String,
        subtitle: String,
        gradientStartColor: Color = Color(.sRGB, red: 0.584, green: 0.839, blue: 0.969, opacity: 1),
        gradientEndColor: Color = Color(.sRGB, red: 0.494, green: 0.886, blue: 0.878, opacity: 1)
    ) {
        self.title = title
        self.subtitle = subtitle
        self.gradientStartColor = gradientStartColor
        self.gradientEndColor = gradientEndColor
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [gradientStartColor, gradientEndColor]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            VStack {
                Spacer()
                
                Image(systemName: "leaf")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                    .foregroundColor(.white.opacity(0.8))
                
                HStack(alignment: .bottom, spacing: 4) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text(title)
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(.white)
                        
                        Text(subtitle)
                            .font(.system(size: 20, weight: .regular))
                            .foregroundColor(.white.opacity(0.9))
                    }
                    Spacer()
                }
                .padding([.leading, .bottom], 16)
            }
            .padding(.top, 48) // Add padding for safe area
        }
        .frame(height: 270) // Increased height to cover top section
    }
}

// Preview
struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(
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
        )
    }
}
