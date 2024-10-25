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

struct WellnessHeader: View {
    @State private var selectedSection: WellnessSection = .mind
    
    var body: some View {
        HStack(spacing: 33) {
            ForEach(WellnessSection.allCases, id: \.self) { section in
                Text(section.rawValue)
                    .font(.system(size: 20, weight: selectedSection == section ? .semibold : .regular))
                    .foregroundColor(selectedSection == section ? section.color : .black)
                    .animation(.easeInOut(duration: 0.2), value: selectedSection)
                    .onTapGesture {
                        withAnimation {
                            selectedSection = section
                        }
                    }
            }
        }
        .padding()
    }
}

struct WellnessHeader_Previews: PreviewProvider {
    static var previews: some View {
        WellnessHeader()
    }
}

