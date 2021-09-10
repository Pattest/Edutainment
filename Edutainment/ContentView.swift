//
//  ContentView.swift
//  Edutainment
//
//  Created by Baptiste Cadoux on 06/09/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var questionNumber = 1

    @State private var animals = [String]()
    @State private var idxAnimal = 0
    @State private var answer = ""
    @State private var score = 0

    var body: some View {
        VStack(spacing: 30) {
            if !animals.isEmpty {

                Text("Question n°\(questionNumber)")
                    .font(.largeTitle)

                Text("What is this animal ?")
                    .font(.title)

                TextField("Answer", text: $answer)
                    .frame(height: 50)
                    .foregroundColor(.white)
                    .background(Color.yellow)

                Image("\(animals[idxAnimal])")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)

                Text("Score: \(score)")

                BlueButton(name: "Validate") {
                    checkAnswer(for: answer.lowercased())
                }
            }
        }
        .padding()
        .multilineTextAlignment(.center)
        .onAppear(perform: loadFile)
    }

    func checkAnswer(for animal: String) {
        if animal == animals[idxAnimal] {
            score += 1
        }

        questionNumber += 1
        refreshDatas()
    }

    func refreshDatas() {
        answer = ""
        animals.shuffle()
        idxAnimal = Int.random(in: 0...animals.count-1)
    }

    private func loadFile() {
        if let fileUrl = Bundle.main.url(forResource: "animals",
                                         withExtension: "txt"),
           let stringAnimals = try? String(contentsOf: fileUrl) {
            let animals = stringAnimals.components(separatedBy: "\n")
            self.animals = animals
            refreshDatas()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
