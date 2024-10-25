//
//  earlyBirdApp.swift
//  earlyBird
//
//  Created by Eugenio Garza Cabello on 22/10/24.
//

import SwiftUI
import UserNotifications

@main
struct earlyBirdApp: App {
    
    init() {
        requestNotificationPermissions()
    }
    var body: some Scene {
        WindowGroup {
            HomeView(userName: "Usuario")
        }
    }
    
    func requestNotificationPermissions() {
        // Solicitar permisos para notificaciones
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("Permiso para notificaciones concedido")
            } else if let error = error {
                print("Error solicitando permiso para notificaciones: \(error)")
            }
        }
    }
}
