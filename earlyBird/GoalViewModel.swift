//
//  GoalViewModel.swift
//  Profile
//
//  Created by Joirid Juarez Salinas on 24/10/24.
//

import Foundation
import Combine

class GoalsViewModel: ObservableObject {
    @Published var goals: [GoalModel] = GoalModel.goalsExample // Inicializa con ejemplos
    
    func addGoal(_ goal: GoalModel) {
        goals.append(goal)
    }
}
