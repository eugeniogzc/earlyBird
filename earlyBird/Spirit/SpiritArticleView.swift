//
//  SpiritArticleView.swift
//  earlyBird
//
//  Created by Santo De La Riva on 25/10/24.
//

import SwiftUI

struct SpiritArticleView: View {
    let title: String
    let subtitle: String
    let mainHeading: String
    let introduction: String
    let steps: [(title: String, description: String)]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Top card section that extends to the top of the screen
                SpiritCardArticle(
                    title: title,
                    subtitle: subtitle
                )
                .ignoresSafeArea(.container, edges: .top)
                
                // Content section
                VStack(alignment: .leading, spacing: 24) {
                    // Heading with gradient accent line
                    HStack(spacing: 12) {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(.sRGB, red: 0.949, green: 0.376, blue: 0.051, opacity: 1), // #F2601D
                                        Color(.sRGB, red: 0.973, green: 0.643, blue: 0.408, opacity: 1)  // #F8A468
                                    ]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .frame(width: 7, height: 45)
                        
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
            }
        }
        .background(Color(.systemBackground))
        .edgesIgnoringSafeArea(.top)
    }
}

// Updated card for full-width at the top
struct SpiritCardArticle: View {
    let title: String
    let subtitle: String
    let gradientStartColor: Color
    let gradientEndColor: Color
    
    init(
        title: String,
        subtitle: String,
        gradientStartColor: Color = Color(.sRGB, red: 0.949, green: 0.376, blue: 0.051, opacity: 1), // #F2601D
        gradientEndColor: Color = Color(.sRGB, red: 0.973, green: 0.643, blue: 0.408, opacity: 1)    // #F8A468
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
                
                Image(systemName: "figure.mind.and.body")
                    .symbolRenderingMode(.monochrome)
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
struct SpiritArticleView_Previews: PreviewProvider {
    static var previews: some View {
        SpiritArticleView(
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
        )
    }
}
