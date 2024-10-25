//
//  SpiritArticleCard.swift
//  earlyBird
//
//  Created by Santo De La Riva on 25/10/24.
//

//
//  ArticleCard.swift
//  earlyBird
//
//  Created by Santo De La Riva on 24/10/24.
//

import SwiftUI

struct SpiritCard: View {
    let title: String
    let subtitle: String
    let gradientStartColor: Color
    let gradientEndColor: Color
    
    init(
        title: String,
        subtitle: String,
        gradientStartColor: Color = Color(.sRGB, red: 0.576, green: 0.929, blue: 0.412, opacity: 1), // #93ED69
        gradientEndColor: Color = Color(.sRGB, red: 0.494, green: 0.886, blue: 0.878, opacity: 1)
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

                // Updated to use bed.double system icon instead of leaf
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
        }
        .frame(maxWidth: .infinity)
        .frame(height: 240)
    }
}

// Extension to support hex color initialization


// Preview
struct SpiritCard_Preview: PreviewProvider {
    static var previews: some View {
        SpiritCard(
            title: "Restful Sleep",
            subtitle: "In 10 Minutes"
        )
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
