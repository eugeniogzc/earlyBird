//
//  ContentView.swift
//  earlyBird
//
//  Created by Eugenio Garza Cabello on 22/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var userName: String = "" // Estado para el nombre de usuario
    @State private var isLoggedIn: Bool = false // Controla si el usuario está logueado

    var body: some View {
        NavigationStack {
            VStack {
                if !isLoggedIn {
                    // Vista de inicio de sesión
                    Text("Inicia sesión")
                        .font(.largeTitle)
                        .padding()
                    
                    TextField("Ingresa tu nombre", text: $userName)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .padding()

                    Button(action: {
                        if !userName.isEmpty {
                            isLoggedIn = true // Cambia el estado para navegar a HomeView
                        }
                    }) {
                        Text("Iniciar sesión")
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.teal)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding()
                    }
                }
            }
            .navigationTitle("Login")
            // Asignamos la vista destino usando navigationDestination
            .navigationDestination(isPresented: $isLoggedIn) {
                HomeView(userName: userName)
            }
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
