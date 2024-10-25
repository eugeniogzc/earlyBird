//
//  ModalView.swift
//  earlyBird
//
//  Created by Gabriel Galván on 24/10/24.
//

import SwiftUI

struct ModalContentView: View {
    // Constants for the progress circles
    private let progressColor = "#7EE2E0" // Turquoise color from the image
    
    var body: some View {
        VStack(spacing: 24) {
            // Header section
            WellnessHeader()
                .padding(.top, 16)
            
            // Progress circles grid
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 20) {
                CircleProgressView(
                    progress: 0.56, // Approximate from image
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
            
            // Mindset card
            MindsetCard(
                title: "How To Cultivate",
                subtitle: "A Healthy Mindset"
            )
            .padding(.horizontal)
            
            Spacer()
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.bottom)
    }
}




// Custom Modal View (Handles the modal's behavior and layout)
struct CustomModalView: View {
    @Binding var modalOffset: CGFloat  // Binding to control modal position externally
    @Binding var isModalVisible: Bool  // Binding to control modal visibility
    
    let minHeight: CGFloat = UIScreen.main.bounds.height * 0.61   // 40% of screen height
    let fullHeight: CGFloat = UIScreen.main.bounds.height * 0.05  // Leave some space at the top (10%)
    
    var body: some View {
        if isModalVisible {
            VStack {
                ModalContentView()  // Include the separate modal content view
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background(Color.white)  // Set modal background to white
            .cornerRadius(20)
            .shadow(radius: 10)
            .offset(y: modalOffset)  // Move the modal up and down based on the passed offset
            .gesture(
                DragGesture()
                    .onChanged { value in
                        // Update modal position based on drag
                        let newOffset = max(minHeight + value.translation.height, fullHeight)
                        self.modalOffset = newOffset
                    }
                    .onEnded { _ in
                        // Snap modal to minimized (40%) or full-screen (near full) position with animation
                        withAnimation(.spring()) {
                            if self.modalOffset > UIScreen.main.bounds.height * 0.3 {
                                // If dragged down beyond 30%, snap to minimized (40%)
                                self.modalOffset = minHeight
                            } else {
                                // Otherwise, snap to near full screen (10% offset from the top)
                                self.modalOffset = fullHeight
                            }
                        }
                    }
            )
        }
    }
}

struct Modal_Previews: PreviewProvider {
    static var previews: some View {
        ModalContentView()
    }
}
