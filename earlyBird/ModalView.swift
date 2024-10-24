//
//  ModalView.swift
//  earlyBird
//
//  Created by Gabriel Galván on 24/10/24.
//

import SwiftUI

struct ModalContentView: View {
    var body: some View {
        VStack {
            Button(action: {
                print("Hello World from the modal")  // Button inside modal
            }) {
                Text("Hello World")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }

            // Additional content for the modal can go here
            // e.g., other buttons, images, text, etc.
            Text("This is where you can add more content!")
                .padding()
                .foregroundColor(.gray)
            
            Spacer()
        }
    }
}


// Custom Modal View (Handles the modal's behavior and layout)
struct CustomModalView: View {
    @Binding var modalOffset: CGFloat  // Binding to control modal position externally
    @Binding var isModalVisible: Bool  // Binding to control modal visibility
    
    let minHeight: CGFloat = UIScreen.main.bounds.height * 0.7  // 40% of screen height
    let fullHeight: CGFloat = 0  // Full screen height (0 means no offset from the top)
    
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
                        // Snap modal to minimized (40%) or full-screen (100%) position with animation
                        withAnimation(.spring()) {
                            if self.modalOffset > UIScreen.main.bounds.height * 0.3 {
                                // If dragged down beyond 30%, snap to minimized (40%)
                                self.modalOffset = minHeight
                            } else {
                                // Otherwise, snap to full screen (0 offset)
                                self.modalOffset = fullHeight
                            }
                        }
                    }
            )
        }
    }
}
