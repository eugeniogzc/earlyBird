//
//  AddGoalView.swift
//  Profile
//
//  Created by Joirid Juarez Salinas on 24/10/24.
//

import SwiftUI

struct AddGoalView: View {
    @Environment(\.presentationMode) var presentationMode // Para cerrar la vista al agregar el objetivo
    @ObservedObject var viewModel: GoalsViewModel

    
    // Lista de posibles propiedades
    let healthAreaOptions = ["Physical", "Mental", "Spiritual"]
    let typePhysicalOptions = ["Sleep", "Exercise", "Other"]
    let imagePhysical = ["bed.double.fill", "figure.yoga", "star"]
    
    let typeMentalOptions = ["Mindfulness", "Meditation", "Social Media", "Hobbies", "Other"]
    let imageMental = ["brain.head.profile", "apple.meditate", "message", "star.bubble", "star"]
    
    let typeSpiritualOptions = ["Reflection", "Breathing", "Connecting with nature", "Spiritual reading", "Connect with my religion", "Other"]
    let imageSpiritual = ["figure.mind.and.body", "lungs", "tree", "book", "book.closed", "star"]
    
    let unitOptions = ["min", "hours"]
    
    
    // Propiedades para capturar los datos del nuevo objetivo
    @State private var name: String = ""
    @State private var image: String = "" // Imagen predeterminada
    @State private var healthArea: String = ""
    @State private var type: String = ""
    @State private var unit: String = "min"
    @State private var selectedIndex = 0
    @State private var selectedNumber = 0
    @State private var time = 61
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Goal Details")) {
                    Picker("Health Area:", selection: $healthArea) {
                        ForEach(healthAreaOptions, id: \.self) { area in
                            Text(area).tag(area)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    
                    HStack{
                        Text("Type:")
                        if healthArea == "Physical" {
                            Picker("", selection: $selectedIndex) {
                                ForEach(0..<typePhysicalOptions.count, id: \.self) { index in
                                    Text(typePhysicalOptions[index]).tag(index)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        } else if healthArea == "Mental" {
                            Picker("", selection: $selectedIndex) {
                                ForEach(0..<typeMentalOptions.count, id: \.self) { index in
                                    Text(typeMentalOptions[index]).tag(index)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        } else if healthArea == "Spiritual"{
                            Picker("", selection: $selectedIndex) {
                                ForEach(0..<typeSpiritualOptions.count, id: \.self) { index in
                                    Text(typeSpiritualOptions[index]).tag(index)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                    }
                    
                    HStack{
                        Text("Name: ")
                        Spacer()
                        TextField("", text: $name)
                            .textFieldStyle(.roundedBorder)
                    }
                    
                    
                    VStack{
                        Text("Goal Time")
                        HStack{
                            VStack{
                                Text("Units")
                                Picker("Units:", selection: $unit) {
                                    ForEach(unitOptions, id: \.self) { unit in
                                        Text(unit).tag(unit)
                                    }
                                }
                                .pickerStyle(.wheel)
                                .frame(height: 100)
                            }
                            VStack{
                                Text("Time")
                                if unit == "hours" {
                                    Picker("Select a number", selection: $selectedNumber) {
                                        ForEach(0..<25) { number in // Rango de números de 0 a 60
                                            Text("\(number)")
                                                .tag(number) // Cada valor tiene su propio tag
                                        }
                                    }
                                    .pickerStyle(.wheel)
                                    .frame(height: 100)
                                } else {
                                    Picker("Select a number", selection: $selectedNumber) {
                                        ForEach(0..<61) { number in // Rango de números de 0 a 60
                                            Text("\(number)")
                                                .tag(number) // Cada valor tiene su propio tag
                                        }
                                    }
                                    .pickerStyle(.wheel)
                                    .frame(height: 100)
                                }
                            }
                        }
                    }
                    Button(action: addGoal) {
                        Text("Add Goal")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding(.all, 6)
            }
            .navigationTitle("Add Goal")
            .navigationBarTitleDisplayMode(.inline)
            //.scrollContentBackground(.hidden)
        }
    }
    
    private func addGoal() {
        // Crear el nuevo objetivo
        if healthArea == "Physical"{
            type = typePhysicalOptions[selectedIndex]
            image = imagePhysical[selectedIndex]
        } else if healthArea == "Mental"{
            type = typeMentalOptions[selectedIndex]
            image = imageMental[selectedIndex]
        } else if healthArea == "Spiritual" {
            type = typeSpiritualOptions[selectedIndex]
            image = imageSpiritual[selectedIndex]
        }
        
        let newGoal = GoalModel(
            name: name,
            image: image,
            healthArea: healthArea,
            type: type,
            goalTime: String(selectedNumber),
            actualTime: "0",
            unit: unit
        )
        
        viewModel.addGoal(newGoal)
        presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    AddGoalView(viewModel: GoalsViewModel())
}
