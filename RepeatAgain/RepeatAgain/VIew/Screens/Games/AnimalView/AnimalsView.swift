//
//  AnimalsView.swift
//  RepeatAgain
//
//  Created by Виталий Багаутдинов on 06.04.2025.
//

import SwiftUI

struct AnimalPair {
    let url: String
    let text: String
}

struct AnimalsView: View {
    
    @StateObject var vm = AnimalsViewModel()
    @State var text: String = ""
    @State var color: Color = .hex410FA3
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .frame(height: 92)
                    .foregroundStyle(color)
                HStack {
                    Button {
                        //
                    } label: {
                        Image("backGame")
                    }
                    Text("Guess the animal")
                        .fredokaFont(size: 22, font: .medium)
                        .foregroundStyle(Color.white)
                        .padding(.horizontal)
                    Spacer()
                }.padding(.horizontal, 20)
                    .padding(.top, 30)
            }
            if let currentAnimal = vm.currentAnimal {
                if color == .green {
                    Spacer()
                    Image("success")
                        .padding(.bottom, 50)
                    Text("Holy Molly! That is Right!")
                        .fredokaFont(size: 20, font: .medium)
                    MainButtonView(text: "Next") {
                        color = .hex410FA3
                        vm.startGame()
                        text = ""
                    }.padding(.top, 40)
                    Spacer(minLength: 320)
                } else if color == .hexD6185D  {
                    Image("failed")
                    Text("Eh? Wrong answer :(")
                        .fredokaFont(size: 20, font: .medium)
                    Text("That is: \(currentAnimal.text)")
                        .fredokaFont(size: 20, font: .medium)
                    MainButtonView(text: "Next") {
                        color = .hex410FA3
                        vm.startGame()
                    }
                    MainButtonView(text: "Try again") {
                        color = .hex410FA3
                    }
                } else {
                    AsyncImage(url: URL(string: currentAnimal.url)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 324, height: 324)
                            .cornerRadius(20)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    TextField("", text: $text)
                        .padding()
                        .frame(width: 324, height: 50)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(Color.black.opacity(0.05))
                        )
                        .cornerRadius(20)
                    
                    Button {
                        color = vm.check(text: text) ? .green : .hexD6185D
                    } label: {
                        Text("get")
                    }
                }
            }
            
            Spacer()

                
            
        }
        .onAppear(perform: {
            vm.startGame()
        })
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden()
    }
    
}

#Preview {
    AnimalsView()
}
