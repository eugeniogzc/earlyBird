//
//  ReadJsonData.swift
//  earlyBird
//
//  Created by Eugenio Garza Cabello on 23/10/24.
//

import Foundation

struct User: Codable, Identifiable {
    
    enum COdingKeys: CodingKey {
        case frase
    }
    
    var id = UUID()
    var frase: String
}

class ReadJsonData: ObservableObject {
    @Published var users: [User] = []
    
    init() {
        loadData()
    }
    
    func loadData() {
        guard let url = Bundle.main.url(forResource: "frases", withExtension: "json")
        else {
            print("json file not found")
            return
        }
        
        let frases = try? Data(contentsOf: url)
        let users = try? JSONDecoder().decode([User].self, from: frases!)
        
        self.users = users!
    }
}
