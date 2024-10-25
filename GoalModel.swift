//
//  GoalModel.swift
//  earlyBird
//
//  Created by Joirid Juarez Salinas on 24/10/24.
//

import Foundation

struct GoalModel : Identifiable {
    var id : UUID = UUID()
    var name : String
    var image : String
    var healthArea : String
    var type : String
    var goalTime : String
    var actualTime : String
    var unit : String
}

extension GoalModel {
    static let goalsExample = [
        GoalModel(name: "Sleep 8 hours per night", image: "bed.double.fill", healthArea: "Physical", type: "Sleep", goalTime: "8", actualTime: "6", unit: "hours"),
        GoalModel(name: "30 min of daily exercise", image: "figure.yoga", healthArea: "Physical", type: "Exercise", goalTime: "30", actualTime: "15", unit: "min"),
        GoalModel(name: "15 mins of daily meditation", image: "apple.meditate", healthArea: "Mental", type: "Meditation", goalTime: "15", actualTime: "15", unit: "min"),
        GoalModel(name: "10 min of mindfulness", image: "brain.head.profile", healthArea: "Mental", type: "Mindfulness", goalTime: "10", actualTime: "5", unit: "min"),
        GoalModel(name: "5 min of daily reflection", image: "figure.mind.and.body", healthArea: "Spiritual", type: "Reflection", goalTime: "5", actualTime: "2", unit: "min"),
        GoalModel(name: "10 min of breathing", image: "lungs", healthArea: "Spiritual", type: "Breathing", goalTime: "10", actualTime: "10", unit: "min")
    ]
}
