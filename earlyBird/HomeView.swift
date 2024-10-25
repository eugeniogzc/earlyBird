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
    @State private var selectedOption: String = "D"  // Track the selected button ("D", "W", "M")
    
    @State private var modalOffset: CGFloat = UIScreen.main.bounds.height * 0.61  // Initial modal position (minimized)
    
    @State private var isModalVisible: Bool = true  // Track if modal is visible
    
    @StateObject var viewModel = GoalViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                            gradient: Gradient(colors: [
                                Color(red: 146/255, green: 217/255, blue: 243/255),  // #92D9F3
                                Color(red: 129/255, green: 228/255, blue: 211/255)   // #81E4D3
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        .ignoresSafeArea()  // Extend the gradient to fill the entire screen
                
                Image("bg_logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)  // Adjust the size if needed
                    .offset(x: UIScreen.main.bounds.width / 2 - 100)

                VStack() {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Hello,")
                                .font(.system(size: 50))
                                .padding(.top)
                                .foregroundColor(Color.white)
                            Text(userName)
                                .font(.system(size: 50))
                                .fontWeight(.bold)
                                
                                .foregroundColor(Color.white)
                        }
                        Spacer()
                        
                        VStack (alignment: .center){
                            NavigationLink(destination: ProfileView(name: userName, age: "20", viewModel: viewModel)) {
                                Image(systemName: "person.circle.fill")
                                    .font(.system(size: 50))
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .padding()
                    .padding(.top)
                    
                    // Texto de saludo con el nombre del usuario
                    
                    
                    // Frase motivacional
                    
                    /*
                    FraseView()
                        .foregroundColor(.white)
                    */
                    
                    VStack {
                        HStack(spacing: 20) {
                            Button(action: {
                                // When D is pressed, set progress to 0.45 and highlight D
                                self.progress = 0.45
                                self.selectedOption = "D"
                            }) {
                                Text("D")
                                    .font(.system(size: 25))
                                    .fontWeight(.bold)
                                    .foregroundColor(selectedOption == "D" ? Color(red: 159/255, green: 234/255, blue: 231/255) : .white)
                                    .padding()
                                    .background(selectedOption == "D" ? Color.white : Color.clear)
                                    .clipShape(Circle())
                            }
                            
                            Button(action: {
                                // When W is pressed, set progress to 0.60 and highlight W
                                self.progress = 0.60
                                self.selectedOption = "W"
                            }) {
                                Text("W")
                                    .font(.system(size: 25))
                                    .fontWeight(.bold)
                                    .foregroundColor(selectedOption == "W" ? Color(red: 159/255, green: 234/255, blue: 231/255) : .white)
                                    .padding()
                                    .background(selectedOption == "W" ? Color.white : Color.clear)
                                    .clipShape(Circle())
                            }
                            
                            Button(action: {
                                // When M is pressed, set progress to 0.97 and highlight M
                                self.progress = 0.90
                                self.selectedOption = "M"
                            }) {
                                Text("M")
                                    .font(.system(size: 25))
                                    .fontWeight(.bold)
                                    .foregroundColor(selectedOption == "M" ? Color(red: 159/255, green: 234/255, blue: 231/255) : .white)
                                    .padding()
                                    .background(selectedOption == "M" ? Color.white : Color.clear)
                                    .clipShape(Circle())
                            }
                        }
                        CustomProgressBar(progress: $progress)
                            .padding()
                        /*
                        Slider(value: $progress)
                            .padding()
                         */
                    }
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
        HomeView(userName: "Usuario") // Proporciona un valor de ejemplo
    }
}

