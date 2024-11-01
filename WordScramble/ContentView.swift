//
//  ContentView.swift
//  WordScramble
//
//  Created by Armando Francisco on 11/1/24.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords: [String] = [String]()
    @State private var rootWord: String = ""
    @State private var newWord: String = ""
    
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else { return }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
    }
    var body: some View {
        
        NavigationStack {
            List {
                Section {
                    TextField("Enter a word", text: $newWord)
                        .onSubmit(addNewWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                    .onDelete(perform: {
                        usedWords.remove(atOffsets: $0)
                    })
                }
            }
            .navigationTitle("Word Scramble")
        }
        
    }
}

#Preview {
    ContentView()
}
