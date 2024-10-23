//
//  HomeView.swift
//  earlyBird
//
//  Created by Eugenio Garza Cabello on 22/10/24.
//

import SwiftUI

struct HomeView: View {
    var userName: String // Parámetro que recibe el nombre del usuario

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    // Menú hamburguesa
                    Button(action: {
                        // Acción para el menú
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    Spacer()
                    
                    // Icono de notificación
                    Button(action: {
                        // Acción de notificación
                    }) {
                        ZStack {
                            Image(systemName: "bell")
                                .font(.title)
                                .foregroundColor(.black)
                                
                            // Puntos de notificación
                            Circle()
                                .fill(Color.red)
                                .frame(width: 10, height: 10)
                                .offset(x: 8, y: -8)
                        }
                    }
                }
                .padding()
                
                // Texto de saludo con el nombre del usuario
                Text("Hello,\n\(userName)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)
                
                // Frase motivacional
                FraseView()
                
                // Segmented Control (Body, Mind, Spirit)
                HStack {
                    Text("Body")
                        .fontWeight(.bold)
                        .foregroundColor(.teal)
                    
                    Text("Mind")
                        .foregroundColor(.gray)
                    
                    Text("Spirit")
                        .foregroundColor(.gray)
                }
                .padding(.vertical)
                
                // Gráfico de progreso (simulado)
                GraphView()
                
                // Metas de usuario
                VStack(alignment: .leading) {
                    Text("My Goals")
                        .font(.headline)
                        .padding(.top)
                    
                    ProgressView("Running", value: 0.8, total: 1.0)
                        .padding(.vertical)
                    
                    ProgressView("Pilates", value: 0.8, total: 1.0)
                        .padding(.vertical)
                    
                    ProgressView("Yoga", value: 0.8, total: 1.0)
                        .padding(.vertical)
                    
                    ProgressView("Cycling", value: 0.8, total: 1.0)
                        .padding(.vertical)
                }
                .padding(.bottom, 20)
            }
            .padding()
        }
        .navigationTitle("Home") // Asegúrate de establecer el título de la vista Home
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(userName: "Usuario de Prueba") // Proporciona un valor de ejemplo
    }
}

