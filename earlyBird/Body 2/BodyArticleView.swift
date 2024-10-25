//
//  BodyArticleView.swift
//  earlyBird
//
//  Created by Santo De La Riva on 25/10/24.
//

import SwiftUI

struct BodyArticleView: View {
    let title: String
    let subtitle: String
    let mainHeading: String
    let introduction: String
    let steps: [(title: String, description: String)]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Top card section that extends to the top of the screen
                BodyCardArticle(
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
                                        Color(.sRGB, red: 0.576, green: 0.929, blue: 0.412, opacity: 1), // #93ED69
                                        Color(.sRGB, red: 0.494, green: 0.886, blue: 0.878, opacity: 1)  // #7EE2E0
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
struct BodyCardArticle: View {
    let title: String
    let subtitle: String
    let gradientStartColor: Color
    let gradientEndColor: Color
    
    init(
        title: String,
        subtitle: String,
        gradientStartColor: Color = Color(.sRGB, red: 0.576, green: 0.929, blue: 0.412, opacity: 1), // #93ED69
        gradientEndColor: Color = Color(.sRGB, red: 0.494, green: 0.886, blue: 0.878, opacity: 1)    // #7EE2E0
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
                
                Image(systemName: "bed.double")
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
struct BodyArticleView_Previews: PreviewProvider {
    static var previews: some View {
        BodyArticleView(
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
        )
    }
}
