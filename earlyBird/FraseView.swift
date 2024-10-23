//
//  FraseView.swift
//  earlyBird
//
//  Created by Eugenio Garza Cabello on 23/10/24.
//

import SwiftUI

// Función para cargar el archivo JSON
func loadFrases() -> [Frase] {
    if let url = Bundle.main.url(forResource: "frases", withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let frases = try decoder.decode([Frase].self, from: data)
            return frases
        } catch {
            print("Error al cargar el archivo JSON: \(error)")
        }
    }
    return []
}

struct FraseView: View {
    @State private var frases: [Frase] = []
    @State private var currentFraseIndex: Int = 0

    var body: some View {
        VStack {
            if !frases.isEmpty {
                Text(frases[currentFraseIndex].frase)
                    .font(.title)
                    .padding()
                    .multilineTextAlignment(.center)
            } else {
                Text("Cargando frases...")
                    .font(.title)
                    .padding()
            }
        }
        .onAppear {
            // Cargar frases al iniciar la vista
            frases = loadFrases()

            // Cambiar frase cada 10 segundos
            Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { _ in
                if !frases.isEmpty {
                    currentFraseIndex = (currentFraseIndex + 1) % frases.count
                }
            }
        }
    }
}


struct FraseView_Previews: PreviewProvider {
    static var previews: some View {
        FraseView()
    }
}
