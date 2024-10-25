//
//  ProfGoalRow.swift
//  Profile
//
//  Created by Joirid Juarez Salinas on 24/10/24.
//

import SwiftUI

struct ProfGoalRow: View {
    var goal: GoalModel
    
    var body: some View {
        HStack {
            Image(systemName: goal.image)
                .font(.system(size: 20))
                .foregroundStyle(.black)
            Text(goal.name)
            Spacer()
            if goal.goalTime == goal.actualTime {
                Image(systemName: "checkmark.circle.fill") // Muestra el ícono de completado
                    .foregroundColor(.green) // Puedes personalizar el color
            } else {
                Text("\(goal.actualTime)/\(goal.goalTime) \(goal.unit)")
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    ProfGoalRow(goal: GoalModel(name: "10 min of mindfulness", image: "brain.head.profile", healthArea: "Mental", type: "Mindfulness", goalTime: "10", actualTime: "5", unit: "min"))
}
