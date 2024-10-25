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
            
            VStack {
                Spacer()  // Space at the top

                // Centered and larger leaf icon
                Image(systemName: "leaf")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)  // Bigger size for the icon
                    .foregroundColor(.white.opacity(0.8))

              

                HStack(alignment: .bottom, spacing: 4) {  // Closer gap between title and subtitle
                    VStack(alignment: .leading, spacing: 2) {  // Reduced spacing between text elements
                        Text(title)
                            .font(.system(size: 30, weight: .bold))  // Title size
                            .foregroundColor(.white)
                        
                        Text(subtitle)
                            .font(.system(size: 20, weight: .regular))  // Subtitle size
                            .foregroundColor(.white.opacity(0.9))
                    }
                    Spacer()  // Pushes the text to the left
                }
                .padding([.leading, .bottom], 16)  // Add padding to the bottom and left corner
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 240)  // Make the card closer to a square
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
