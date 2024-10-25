//
//  SwiftUIView.swift
//  Profile
//
//  Created by Joirid Juarez Salinas on 24/10/24.
//

import SwiftUI

struct ProfileView: View {
    var name : String
    var age : String
    @ObservedObject var viewModel: GoalsViewModel
    @State private var showAddGoal: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 80))
                    .foregroundStyle(Color.init(red: 70/255, green: 179/255, blue: 234/255))
                
                Form{
                    Section {
                        HStack {
                            Image(systemName: "person.crop.square")
                                .font(.system(size: 20))
                                .foregroundStyle(.black)
                            Text("Name: ")
                            Text(name)
                            Spacer()
                            
                        }
                        HStack {
                            Image(systemName: "calendar")
                                .font(.system(size: 20))
                                .foregroundStyle(.black)
                            Text("Age: ")
                            Text(age)
                            Spacer()
                        }
                    }
                    .listRowBackground(Color.init(red: 245/255, green: 245/255, blue: 245/255))
                    .listRowSeparator(.hidden)
                    
                    Text("My Daily Health Goals")
                        .font(.title3)
                        .bold()
                    Section {
                        ForEach(viewModel.goals.filter { $0.healthArea == "Physical" }) { goal in
                            ProfGoalRow(goal: goal)
                        }
                        .onDelete(perform: { indexSet in
                            deleteGoal(at: indexSet, healthArea: "Physical")
                        })
                    } header : {
                        Text("Physical Health")
                    }
                    
                    Section {
                        ForEach(viewModel.goals.filter { $0.healthArea == "Mental" }) { goal in
                            ProfGoalRow(goal: goal)
                        }
                        .onDelete(perform: { indexSet in
                            deleteGoal(at: indexSet, healthArea: "Mental")
                        })
                    } header : {
                        Text("Mental Health")
                    }
                    
                    Section {
                        ForEach(viewModel.goals.filter { $0.healthArea == "Spiritual" }) { goal in
                            ProfGoalRow(goal: goal)
                        }
                        .onDelete(perform: { indexSet in
                            deleteGoal(at: indexSet, healthArea: "Spiritual")
                        })
                    } header : {
                        Text("Spiritual Health")
                    }
    

                }
                //.scrollContentBackground(.hidden)
            }
            .navigationBarItems(trailing: Button(action: {
                showAddGoal = true
            }) {
                Text("Add goal")
                    .foregroundColor(.blue) // Cambia el color si lo deseas
            })
        }
        .sheet(isPresented: $showAddGoal) {
            AddGoalView(viewModel: viewModel)
        }
    }
    
    private func deleteGoal(at indexSet: IndexSet, healthArea: String) {
        // Filtramos los objetivos según el área de salud y eliminamos el seleccionado
        let filteredGoals = viewModel.goals.enumerated().filter { $0.element.healthArea == healthArea }
        
        // Convertimos el indexSet en un array y accedemos al índice del objetivo filtrado
        for index in indexSet {
            let goalIndex = filteredGoals[index].offset
            viewModel.goals.remove(at: goalIndex)
        }
    }
}

#Preview {
    ProfileView(name: "John Doe", age: "20", viewModel: GoalsViewModel())
}
