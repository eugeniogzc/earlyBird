import SwiftUI

struct SpiritCard: View {
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

                // Updated to use figure.mind.and.body icon which represents meditation/wellness
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
        }
        .frame(maxWidth: .infinity)
        .frame(height: 240)
    }
}

// Preview
struct SpiritArticleCard_Preview: PreviewProvider {
    static var previews: some View {
        SpiritCard(
            title: "Spiritual Wellness:",
            subtitle: "A Guide"
        )
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
