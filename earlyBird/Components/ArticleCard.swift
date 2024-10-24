//
//  ArticleCard.swift
//  earlyBird
//
//  Created by Santo De La Riva on 24/10/24.
//

import SwiftUI

struct MindsetCard: View {
    let title: String
    let subtitle: String
    let gradientStartColor: Color
    let gradientEndColor: Color
    
    init(
        title: String,
        subtitle: String,
        gradientStartColor: Color = Color(.sRGB, red: 0.584, green: 0.839, blue: 0.969, opacity: 1), // #95D6F7
        gradientEndColor: Color = Color(.sRGB, red: 0.494, green: 0.886, blue: 0.878, opacity: 1)    // #7EE2E0
    ) {
        self.title = title
        self.subtitle = subtitle
        self.gradientStartColor = gradientStartColor
        self.gradientEndColor = gradientEndColor
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [gradientStartColor, gradientEndColor]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            VStack(spacing: 16) {
                // Simple icon from SF Symbols
                Image(systemName: "leaf.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)  // Increased size for the icon
                    .foregroundColor(.white)
                    .padding(.bottom, 24)
                
                VStack(alignment: .leading, spacing: 8) { // Left-align the text
                    Text(title)
                        .font(.system(size: 40, weight: .bold))  // Bigger title
                        .foregroundColor(.white)
                    
                    Text(subtitle)
                        .font(.system(size: 28, weight: .regular))  // Bigger subtitle
                        .foregroundColor(.white.opacity(0.9))
                }
                .padding(.horizontal, 24)  // Add horizontal padding
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 300)  // Increased card height for bigger elements
    }
}

// Preview
struct MindsetCard_Previews: PreviewProvider {
    static var previews: some View {
        MindsetCard(
            title: "How To Cultivate",
            subtitle: "A Healthy Mindset"
        )
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
