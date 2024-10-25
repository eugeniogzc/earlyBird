//
//  HomeView.swift
//  earlyBird
//
//  Created by Eugenio Garza Cabello on 22/10/24.
//

import SwiftUI

struct HomeView: View {
    var userName: String // Parámetro que recibe el nombre del usuario
    @State private var progress = 0.7
    
    @State private var modalOffset: CGFloat = UIScreen.main.bounds.height * 0.7  // Initial modal position (minimized)
    
    @State private var isModalVisible: Bool = true  // Track if modal is visible
    
    @StateObject var viewModel = GoalViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color(red: 0.27, green: 0.70, blue: 0.92)) // Converted hex #46B3EA to RGB
                    .edgesIgnoringSafeArea(.all)
                VStack() {
                    HStack {
                        Text("Hello,\n\(userName)")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.top)
                            .foregroundColor(Color.white)
                        Spacer()
                        
                        NavigationLink(destination: ProfileView(name: userName, age: "30", viewModel: viewModel)) {
                            Image(systemName: "person.circle")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                    .padding(.top)
                    
                    // Texto de saludo con el nombre del usuario
                    
                    
                    // Frase motivacional
                    FraseView()
                        .foregroundColor(.white)
                    
                    CustomProgressBar(progress: $progress)
                        .padding()
                    Slider(value: $progress)
                        .padding()
                    // Segmented Control (Body, Mind, Spirit)
                    Spacer()
                    
                }
                .padding()
                CustomModalView(modalOffset: $modalOffset, isModalVisible: $isModalVisible)
                    .animation(.spring(), value: modalOffset)  // Use animation with value
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(userName: "Usuario Prueba") // Proporciona un valor de ejemplo
    }
}

