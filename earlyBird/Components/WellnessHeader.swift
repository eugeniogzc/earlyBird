//
//  WellnessHeader.swift
//  earlyBird
//
//  Created by Santo De La Riva on 24/10/24.
//

import SwiftUI

enum WellnessSection: String, CaseIterable {
    case mind = "Mind"
    case body = "Body"
    case spirit = "Spirit"
    
    var color: Color {
        switch self {
        case .mind:
            return Color(red: 0.49, green: 0.89, blue: 0.88) // #7EE2E0
        case .body:
            return Color(red: 0.60, green: 0.89, blue: 0.49) // #9AE27E
        case .spirit:
            return Color(red: 0.97, green: 0.64, blue: 0.41) // #F8A468
        }
    }
}

class WellnessSectionManager: ObservableObject {
    @Published var selectedSection: WellnessSection = .mind
    @Published var isTransitioning: Bool = false
}

struct WellnessHeader: View {
    @ObservedObject var sectionManager: WellnessSectionManager
    
    var body: some View {
        HStack(spacing: 33) {
            ForEach(WellnessSection.allCases, id: \.self) { section in
                Text(section.rawValue)
                    .font(.system(size: 20, weight: sectionManager.selectedSection == section ? .semibold : .regular))
                    .foregroundColor(sectionManager.selectedSection == section ? section.color : .black)
                    .animation(.easeInOut(duration: 0.2), value: sectionManager.selectedSection)
                    .onTapGesture {
                        withAnimation {
                            // Reset progress before changing view
                            sectionManager.isTransitioning = true
                            sectionManager.selectedSection = section
                            
                            // Allow time for view transition before starting progress animation
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                sectionManager.isTransitioning = false
                            }
                        }
                    }
            }
        }
        .padding()
    }
}

